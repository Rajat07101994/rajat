class Placement < ActiveRecord::Base
  belongs_to :order, inverse_of: :placements
  belongs_to :product, inverse_of: :placements
  after_save :decrement_product_quantity!
  def  decrement_product_quantity!
    byebug
    self.product.decrement!(:quantity, quantity)
    byebug
  end
end
