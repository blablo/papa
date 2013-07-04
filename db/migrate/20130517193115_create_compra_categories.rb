class CreateCompraCategories < ActiveRecord::Migration
  def self.up
    create_table :compra_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :compra_categories
  end
end
