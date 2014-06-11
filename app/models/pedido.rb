class Pedido < ActiveRecord::Base
  attr_accessible :cambio, :client_id, :orden, :sale_id
  belongs_to :sale
  belongs_to :client
  belongs_to :company
end
