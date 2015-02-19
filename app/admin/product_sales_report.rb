# -*- coding: utf-8 -*-
ActiveAdmin.register_page "Product Sales Report" do
  content do

    @cortes = current_user.company.cortes.includes(sales: [ sale_lines: [:product] ])
#.where('MONTH(fecha) = ? and YEAR(fecha) = ?', 11, 2014)
    @prod = ""
    @wday = ['7D', '1L', '2M', '3X', '4J', '5V', '6S']

    @cortes.each do |corte|
      corte.sales.each do |sale|
        sale.sale_lines.each do |sl|
            if sl.product
              if sale.client
                cliente = sale.client.name + "(" + sale.client.phone + ")"
              else
                cliente = ''
              end
              @prod += "{" +
                "'producto': '" + (sl.product.blank? ? '' : sl.product.name) + "'," +
                "'categoria': '" + (sl.product.blank? ? '' : sl.product.product_category_id.to_s) + "'," +
                "'precio': " + sl.precio.to_s + "," +
                "'cantidad': " + sl.cantidad.round(1).to_s + "," +
                "'domicilio': '" + sale.domicilio.to_s + "'," +
                "'cliente': '" + cliente + "'," +
                "'hora': '" + sl.created_at.strftime('%H') + "'," +
                "'año': '" + corte.fecha.strftime('%Y') + "'," +
                "'mes': '" + corte.fecha.strftime('%m') + "'," +
                "'dia': '" + corte.fecha.strftime('%djs') + "'," +
                "'dia semana': '" + @wday[corte.fecha.strftime('%w').to_i] + "'},"
            end
        end
      end
    end

    @prod += @prod.chop + ""

    render partial: 'report', locals: {prod: @prod}

  end
end 
