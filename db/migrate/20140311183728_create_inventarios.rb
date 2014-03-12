class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.string :compra_id
      t.float :existencia

      t.timestamps
    end
  end
end
