ActiveAdmin.register Receta do



    form do |f|
      f.inputs do
      f.input :product
        f.has_many :receta_lines, :allow_destroy => true, :heading => 'Themes', :new_record => true do |cf|
          cf.input :compra
          cf.input :cantidad
        end
      end
      f.actions
    end


end
