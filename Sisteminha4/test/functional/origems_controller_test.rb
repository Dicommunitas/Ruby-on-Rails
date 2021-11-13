require 'test_helper'

class OrigemsControllerTest < ActionController::TestCase
  setup do
    @origem = origems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:origems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create origem" do
    assert_difference('Origem.count') do
      post :create, origem: @origem.attributes
    end

    assert_redirected_to origem_path(assigns(:origem))
  end

  test "should show origem" do
    get :show, id: @origem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @origem.to_param
    assert_response :success
  end

  test "should update origem" do
    put :update, id: @origem.to_param, origem: @origem.attributes
    assert_redirected_to origem_path(assigns(:origem))
  end

  test "should destroy origem" do
    assert_difference('Origem.count', -1) do
      delete :destroy, id: @origem.to_param
    end

    assert_redirected_to origems_path
  end
end
