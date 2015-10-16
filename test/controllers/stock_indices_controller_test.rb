require 'test_helper'

class StockIndicesControllerTest < ActionController::TestCase
  setup do
    @stock_index = stock_indices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_indices)
  end

  test "should create stock_index" do
    assert_difference('StockIndex.count') do
      post :create, stock_index: { description: @stock_index.description, name: @stock_index.name, slug: @stock_index.slug }
    end

    assert_response 201
  end

  test "should show stock_index" do
    get :show, id: @stock_index
    assert_response :success
  end

  test "should update stock_index" do
    put :update, id: @stock_index, stock_index: { description: @stock_index.description, name: @stock_index.name, slug: @stock_index.slug }
    assert_response 204
  end

  test "should destroy stock_index" do
    assert_difference('StockIndex.count', -1) do
      delete :destroy, id: @stock_index
    end

    assert_response 204
  end
end
