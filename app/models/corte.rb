class Corte < ActiveRecord::Base
  attr_accessible :user_id, :caja, :fecha
  has_many :sales
  has_many :gastos

end
