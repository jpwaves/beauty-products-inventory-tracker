require 'test_helper'

class ReplenishmentTest < ActiveSupport::TestCase
  def setup
    @unfulfilled_replenishment = replenishments(:unfulfilled)
    @fulfilled_replenishment = replenishments(:fulfilled)
  end

  test 'unfulfilled scope should return only unfulfilled replenishments' do
    unfulfilled_replenishments = Replenishment.unfulfilled

    assert_includes unfulfilled_replenishments, @unfulfilled_replenishment
    refute_includes unfulfilled_replenishments, @fulfilled_replenishment
  end
end
