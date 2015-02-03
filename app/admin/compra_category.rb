ActiveAdmin.register CompraCategory do
  controller do
    def scoped_collection
      current_user.company.compra_categories
    end
    def update
      params[:compra_category].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:compra_category].merge!({ company_id: current_user.company_id })
      create!
    end
  end
  form do |f|
    f.inputs "Details" do
      f.input :name
    end
    f.actions
  end

end
