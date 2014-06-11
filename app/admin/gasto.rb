ActiveAdmin.register Gasto do
    controller do
    def scoped_collection
      current_user.company.gastos
    end
    def update
      params[:gasto].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:gasto].merge!({ company_id: current_user.company_id })
      create!
    end
  end
  form do |f|
    f.inputs "Details" do
      f.input :compra
      f.input :proveedor
      f.input :volumen
      f.input :precio
      f.input :fecha
      f.input :nota
      f.input :es_caja
      f.input :factura
      f.input :subtotal
      f.input :iva

    end
    f.actions
  end

end
