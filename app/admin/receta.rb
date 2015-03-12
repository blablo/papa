ActiveAdmin.register Receta do

  controller do
    def scoped_collection
      current_user.company.recetas
    end
    def update
      params[:receta].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:receta].merge!({ company_id: current_user.company_id })
      create!
    end
  end

  index do 
    column :product
    default_actions
  end


  form do |f|
      f.inputs do
      f.input :product, collection: Product.where(company_id: current_user.company_id).order('name')
        f.has_many :receta_lines, :allow_destroy => true, :heading => 'Themes', :new_record => true do |cf|
          cf.input :compra, collection: Compra.where(company_id: current_user.company_id).order('name')
        
          cf.input :cantidad
        end
      end
      f.actions
    end


end
