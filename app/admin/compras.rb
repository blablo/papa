ActiveAdmin.register Compra do
  controller do
    def scoped_collection
      current_user.company.compras
    end
    def update
      params[:compra].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:compra].merge!({ company_id: current_user.company_id })
      create!
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :compra_category
      f.input :name
      f.input :avatar
      f.input :medida

    end
    f.actions
  end


end
