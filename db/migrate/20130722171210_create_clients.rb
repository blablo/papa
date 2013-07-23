class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :street2
      t.string :district
      t.string :note
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
