class AddFechaToCortes < ActiveRecord::Migration
  def change
    add_column :cortes, :fecha, :datetime
  end
end
