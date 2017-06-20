class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!

  def set_total!
    self.total = products.map(&:price).sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do | product_ids_and_quantiy |
      id,quantity =product_ids_and_quantiy #[1,5]
      self.placements.build(product_id: id)
    end
  end
end
