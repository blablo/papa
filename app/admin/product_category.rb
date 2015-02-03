ActiveAdmin.register ProductCategory do
  controller do
    def scoped_collection
      current_user.company.product_categories
    end
    def update
      params[:product_category].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:product_category].merge!({ company_id: current_user.company_id })
      create!
    end
  end
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :avatar
    end
    f.actions
  end
end
