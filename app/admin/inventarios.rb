ActiveAdmin.register Inventario do
  controller do
    def scoped_collection
      current_user.company.inventarios
    end
    def update
      params[:inventario].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:inventario].merge!({ company_id: current_user.company_id })
      create!
    end
  end

  index do 
    column :compra
    column :existencia
    column :minimo
    default_actions
  end


  form do |f|
    f.inputs "Details" do
      f.input :compra, collection: Compra.where(company_id: current_user.company_id).order('name')
      f.input :existencia
      f.input :minimo
    end
    f.actions
  end


end
