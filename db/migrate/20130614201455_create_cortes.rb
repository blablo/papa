class CreateCortes < ActiveRecord::Migration
  def change
    create_table :cortes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
