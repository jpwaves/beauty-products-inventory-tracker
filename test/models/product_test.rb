require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @account = accounts(:one)
  end
  test 'validates name and quantity presence' do
    assert Product.new(name: 'Product', quantity: 1, account: @account).valid?
    assert Product.new(name: 'Product', account: @account).invalid?
    assert Product.new(quantity: 1, account: @account).invalid?
  end
end
