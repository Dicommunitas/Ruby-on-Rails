require 'test_helper'

class AmostrasControllerTest < ActionController::TestCase
  setup do
    @amostra = amostras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amostras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amostra" do
    assert_difference('Amostra.count') do
      post :create, amostra: @amostra.attributes
    end

    assert_redirected_to amostra_path(assigns(:amostra))
  end

  test "should show amostra" do
    get :show, id: @amostra.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amostra.to_param
    assert_response :success
  end

  test "should update amostra" do
    put :update, id: @amostra.to_param, amostra: @amostra.attributes
    assert_redirected_to amostra_path(assigns(:amostra))
  end

  test "should destroy amostra" do
    assert_difference('Amostra.count', -1) do
      delete :destroy, id: @amostra.to_param
    end

    assert_redirected_to amostras_path
  end
end
