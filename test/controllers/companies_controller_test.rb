require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { description: @company.description, exchange: @company.exchange, fundamentals: @company.fundamentals, name: @company.name, quote: @company.quote, sector: @company.sector, slug: @company.slug, subsector: @company.subsector, symbol: @company.symbol, type: @company.type }
    end

    assert_response 201
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { description: @company.description, exchange: @company.exchange, fundamentals: @company.fundamentals, name: @company.name, quote: @company.quote, sector: @company.sector, slug: @company.slug, subsector: @company.subsector, symbol: @company.symbol, type: @company.type }
    assert_response 204
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_response 204
  end
end
