# -*- coding: utf-8 -*-
namespace :admin do
  task :corte_fecha => :environment do 
    Corte.all.each do |corte|
      if corte.fecha.blank? 
        corte.update_attribute(:fecha, corte.created_at)
      end
    end
  end


  task :es_caja => :environment do 
    Gasto.all.each do |gasto|
      if gasto.corte_id.nil?
        gasto.update_attribute(:es_caja, false)
      end
    end
  end

  task :pollos_corte => :environment do 
    Corte.all.each do |corte|
      if corte.principales.nil?
        corte.update_attribute(:principales, corte.count_recetas.to_json)
      end
    end
  end
  
  task :add_company => :environment do 
    Company.find_or_create_by_id_and_name(1, "Rico Don Pollo") 
    User.update_all(:company_id => 1)
    Product.update_all(:company_id => 1)
    ProductCategory.update_all(:company_id => 1)
    CompraCategory.update_all(:company_id => 1)
    Compra.update_all(:company_id => 1)
    Gasto.update_all(:company_id => 1)
    Inventario.update_all(:company_id => 1)
    Proveedor.update_all(:company_id => 1)
    Receta.update_all(:company_id => 1)
    Sale.update_all(:company_id => 1)
    Corte.update_all(:company_id => 1)
  end

end
