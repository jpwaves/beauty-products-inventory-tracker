require "test_helper"

class ReplenishmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @replenishment = replenishments(:one)
  end

  test "should get index" do
    get replenishments_url
    assert_response :success
  end

  test "should get new" do
    get new_replenishment_url
    assert_response :success
  end

  test "should create replenishment" do
    assert_difference("Replenishment.count") do
      post replenishments_url, params: { replenishment: { account_id: @replenishment.account_id, fulfilled_at: @replenishment.fulfilled_at, product_id: @replenishment.product_id } }
    end

    assert_redirected_to replenishment_url(Replenishment.last)
  end

  test "should show replenishment" do
    get replenishment_url(@replenishment)
    assert_response :success
  end

  test "should get edit" do
    get edit_replenishment_url(@replenishment)
    assert_response :success
  end

  test "should update replenishment" do
    patch replenishment_url(@replenishment), params: { replenishment: { account_id: @replenishment.account_id, fulfilled_at: @replenishment.fulfilled_at, product_id: @replenishment.product_id } }
    assert_redirected_to replenishment_url(@replenishment)
  end

  test "should destroy replenishment" do
    assert_difference("Replenishment.count", -1) do
      delete replenishment_url(@replenishment)
    end

    assert_redirected_to replenishments_url
  end
end
