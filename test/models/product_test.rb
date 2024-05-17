require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @account = accounts(:no_products)
  end
  test 'validates name and quantity presence' do
    assert Product.new(name: 'Product', quantity: 1, account: @account).valid?
    assert Product.new(name: 'Product', account: @account).invalid?
    assert Product.new(quantity: 1, account: @account).invalid?
  end

  test 'validates quantity is an integer greater than or equal to 0' do
    assert Product.new(name: 'Product', quantity: 0, account: @account).valid?
    assert Product.new(name: 'Product', quantity: 1, account: @account).valid?
    assert Product.new(name: 'Product', quantity: -1, account: @account).invalid?
    assert Product.new(name: 'Product', quantity: 1.5, account: @account).invalid?
    assert Product.new(name: 'Product', account: @account).invalid?
  end

  test 'low_stock scope returns products whose quantity is 1' do
    zero_quantity = Product.create!(name: 'Zero', quantity: 0, account: @account)
    one_quantity = Product.create!(name: 'One', quantity: 1, account: @account)
    two_quantity = Product.create!(name: 'Two', quantity: 2, account: @account)

    low_stock_products = Product.low_stock

    assert_not_includes low_stock_products, zero_quantity, 'Product with zero quantity is not considered low stock'
    assert_includes low_stock_products, one_quantity, 'Product with one quantity is considered low stock'
    assert_not_includes low_stock_products, two_quantity, 'Product with two quantity is not considered low stock'
  end

  test 'out_of_stock scope returns products whose quantity is 0' do
    zero_quantity = Product.create!(name: 'Zero', quantity: 0, account: @account)
    one_quantity = Product.create!(name: 'One', quantity: 1, account: @account)
    out_of_stock_products = Product.out_of_stock

    assert_includes out_of_stock_products, zero_quantity, 'Product with zero quantity is considered out of stock'
    assert_not_includes out_of_stock_products, one_quantity, 'Product with one quantity is not considered out of stock'
  end

  test 'active scope returns products whose archived column is false' do
    active_product = Product.create!(name: 'Active', quantity: 1, account: @account, archived: false)
    archived_product = Product.create!(name: 'Archived', quantity: 1, account: @account, archived: true)

    active_products = Product.active

    assert_includes active_products, active_product, 'Active product is considered active'
    assert_not_includes active_products, archived_product, 'Archived product is not considered active'
  end
end
