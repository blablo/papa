class Cancellation < ActiveRecord::Base
  attr_accessible :desc, :reason, :sale_id, :total
  belongs_to :sale
  belongs_to :company
  validate :sale_info

  validates :reason, :presence => true

  scope :no_corte, where(:corte_id => nil)


  def sale_info
    self.desc = self.sale.sale_names
    self.total = self.sale.total
  end

end
