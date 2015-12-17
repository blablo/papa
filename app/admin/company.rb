ActiveAdmin.register Company do
  actions :all, :except => [:destroy]
  config.filters = false


  controller do

    def create(options={}, &block)
      if current_user.company.nil?
        params[:company][:user_id] = current_user.id
        super
      else
        redirect_to admin_companies_url
      end
    end

    
    def scoped_collection
      Company.where(id: current_user.company_id)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :logo
      f.input :rfc
      f.input :address
      f.input :webpage
      f.input :phone
      f.input :ticket_copies
      f.input :points_system
      f.input :points_rate
    end
    f.actions
  end

end
