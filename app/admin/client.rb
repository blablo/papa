ActiveAdmin.register Client do
index do
    column :name
    column :phone
    column :street
    column :street2
    column :district
    column :note
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :phone
      f.input :street
      f.input :street2
      f.input :district
      f.input :note
    end
    f.actions
  end

  controller do

    def scoped_collection
      current_user.company.clients
    end
  end
  
end
