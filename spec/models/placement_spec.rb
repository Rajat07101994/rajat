require 'spec_helper'

describe Placement do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:placements){FactoryGirl.build:placements}
  subject{ placements }
  it { should respond_to :order_id }
  it { should respond_to :product_id }
  it { should belongs_to :order }
  it {should belongs_to :product }
end
