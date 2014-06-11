ActiveAdmin.register Proveedor do
  controller do
    def scoped_collection
      current_user.company.proveedores
    end
    def update
      params[:proveedor].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:proveedor].merge!({ company_id: current_user.company_id })
      create!
    end
  end

    form do |f|
    f.inputs "Details" do
      f.input :nombre
      f.input :rfc
    end
    f.actions
  end


end
