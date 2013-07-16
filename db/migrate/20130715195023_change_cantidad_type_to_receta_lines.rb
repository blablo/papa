class ChangeCantidadTypeToRecetaLines < ActiveRecord::Migration
def up
   change_column :receta_lines, :cantidad, :float
  end

  def down
   change_column :receta_lines, :cantidad, :integer

  end
end
