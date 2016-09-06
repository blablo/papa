ActiveAdmin.register Waste do
#  filter :corte_fecha, :as => :date


  controller do
    def scoped_collection
      current_user.company.wastes
    end
    def update
      params[:waste].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:waste].merge!({ company_id: current_user.company_id })
      create!
    end
  end
  
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
