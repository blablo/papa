class AddAddressAndPhoneToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address, :string
    add_column :companies, :phone, :string
    add_column :companies, :webpage, :string
  end
end
