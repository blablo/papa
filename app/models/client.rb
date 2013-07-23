class Client < ActiveRecord::Base
  attr_accessible :name, :phone, :street, :street2, :district, :note, :latitude, :longitude

  validate :format_phone

  validates :phone, :presence => true
  
  def format_phone
    self.phone = self.phone.gsub(/[^0-9]/,"")
  end

end
