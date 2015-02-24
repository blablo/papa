class AddTicketPrintsAndPointSystemToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :rfc, :string
    add_column :companies, :ticket_copies, :integer, default: 1
    add_column :companies, :points_system, :boolean, default: false
    add_column :companies, :points_rate, :float, precision: 5, scale: 2, default: 0.01
  end
end
