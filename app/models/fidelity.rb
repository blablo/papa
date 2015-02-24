class Fidelity < ActiveRecord::Base
  attr_accessible :client_id, :company_id, :points
  belongs_to :client
  belongs_to :company
end
