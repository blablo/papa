class AddAvatarToProductCategories < ActiveRecord::Migration
  def change
    add_column :product_categories, :avatar, :string
  end
end
