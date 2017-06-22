class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates_with EnoughProductsValidator

  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!

  def set_total!
    #byebug
    self.total=0
    placements.each do |placement|
      debugger
      self.total+=placement.product.price * placement.quantity
    end
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    #byebug
    product_ids_and_quantities.each do | product_ids_and_quantity |
      id,quantities =product_ids_and_quantity.split(",")
      #byebug
      self.placements.build(product_id: id,quantity: quantities)
    end
    ##
  end

end
