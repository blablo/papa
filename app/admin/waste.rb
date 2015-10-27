ActiveAdmin.register Waste do
#  filter :corte_fecha, :as => :date
  
  index do
    
    column :quantity
    column :product do |waste|
      waste.product.name
    end
    column :corte do |waste|
      waste.corte.fecha.strftime('%d/%m/%Y') if waste.corte_id
    end
    
  end
  
end
