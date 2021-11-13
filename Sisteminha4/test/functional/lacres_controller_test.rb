require 'test_helper'

class LacresControllerTest < ActionController::TestCase
  setup do
    @lacre = lacres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lacres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lacre" do
    assert_difference('Lacre.count') do
      post :create, lacre: @lacre.attributes
    end

    assert_redirected_to lacre_path(assigns(:lacre))
  end

  test "should show lacre" do
    get :show, id: @lacre.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lacre.to_param
    assert_response :success
  end

  test "should update lacre" do
    put :update, id: @lacre.to_param, lacre: @lacre.attributes
    assert_redirected_to lacre_path(assigns(:lacre))
  end

  test "should destroy lacre" do
    assert_difference('Lacre.count', -1) do
      delete :destroy, id: @lacre.to_param
    end

    assert_redirected_to lacres_path
  end
end
