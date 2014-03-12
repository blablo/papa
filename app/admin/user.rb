ActiveAdmin.register User do
index do
    column :email
    column :username
    column :name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :username
      f.input :roles
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
end
