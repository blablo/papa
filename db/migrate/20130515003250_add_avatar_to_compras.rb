class AddAvatarToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :avatar, :string
  end
end
