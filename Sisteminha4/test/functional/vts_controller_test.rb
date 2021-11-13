require 'test_helper'

class VtsControllerTest < ActionController::TestCase
  setup do
    @vt = vts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vt" do
    assert_difference('Vt.count') do
      post :create, vt: @vt.attributes
    end

    assert_redirected_to vt_path(assigns(:vt))
  end

  test "should show vt" do
    get :show, id: @vt.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vt.to_param
    assert_response :success
  end

  test "should update vt" do
    put :update, id: @vt.to_param, vt: @vt.attributes
    assert_redirected_to vt_path(assigns(:vt))
  end

  test "should destroy vt" do
    assert_difference('Vt.count', -1) do
      delete :destroy, id: @vt.to_param
    end

    assert_redirected_to vts_path
  end
end
