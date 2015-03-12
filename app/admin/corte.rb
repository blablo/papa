ActiveAdmin.register Corte do
  controller do
    def scoped_collection
      current_user.company.cortes
    end
  end
  
end
