# frozen_string_literal: true

require 'application_system_test_case'

class ReplenishmentsTest < ApplicationSystemTestCase
  setup do
    @replenishment = replenishments(:one)
  end

  test 'visiting the index' do
    visit replenishments_url
    assert_selector 'h1', text: 'Replenishments'
  end

  test 'should create replenishment' do
    visit replenishments_url
    click_on 'New replenishment'

    fill_in 'Account', with: @replenishment.account_id
    fill_in 'Fulfilled at', with: @replenishment.fulfilled_at
    fill_in 'Product', with: @replenishment.product_id
    click_on 'Create Replenishment'

    assert_text 'Replenishment was successfully created'
    click_on 'Back'
  end

  test 'should update Replenishment' do
    visit replenishment_url(@replenishment)
    click_on 'Edit this replenishment', match: :first

    fill_in 'Account', with: @replenishment.account_id
    fill_in 'Fulfilled at', with: @replenishment.fulfilled_at
    fill_in 'Product', with: @replenishment.product_id
    click_on 'Update Replenishment'

    assert_text 'Replenishment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Replenishment' do
    visit replenishment_url(@replenishment)
    click_on 'Destroy this replenishment', match: :first

    assert_text 'Replenishment was successfully destroyed'
  end
end
