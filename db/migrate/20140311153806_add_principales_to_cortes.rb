class AddPrincipalesToCortes < ActiveRecord::Migration
  def change
    add_column :cortes, :principales, :text
  end
end
