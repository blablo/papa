class AddMinimoToInventarios < ActiveRecord::Migration
  def change
    add_column :inventarios, :minimo, :float
  end
end
