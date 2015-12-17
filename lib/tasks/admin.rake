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

  task :copy_products, [:arg1, :arg2] => :environment do
    company = Company.find(args.arg1)
    company2 = Company.find(args.arg2)
    products = {}
    compras = {}
    
    company.product_categories.each do |pc|
      pc2 = pc.dup
      pc2.company_id = company2.id
      pc2.avatar = File.open(pc.avatar.file.file) if pc.avatar.present?
      pc2.save
      
      pc.products.each do |p| 
        p2 = p.dup
        p2.company_id = company2.id
        p2.product_category_id = pc2.id
        p2.avatar = File.open(p.avatar.file.file) if p.avatar.present?
        p2.save
        products[p.id.to_s] = p2.id.to_s

      end
    end

    company.compra_categories.each do |pc|
      pc2 = pc.dup
      pc2.company_id = company2.id
      pc2.save
      pc.compras.each do |p| 
        p2 = p.dup
        p2.company_id = company2.id
        p2.compra_category_id = pc2.id
        p2.avatar = File.open(p.avatar.file.file) if p.avatar.present?
        p2.save
        compras[p.id.to_s] = p2.id.to_s
      end
    end

    company.recetas.each do |re|
      re2 = re.dup
      re2.company_id = company2.id
      re2.product_id = products[re.product_id.to_s] if re.product_id
      re2.save
      re.receta_lines.each do |line|
        line2 = line.dup
        line2.company_id = company2.id
        line2.receta_id = re2.id
        line2.product_id = products[line.product_id.to_s] if line.product_id
        line2.compra_id = compras[line.compra_id.to_s] if line.compra_id
        line2.save
      end
    end
    
    
  end
  
end
