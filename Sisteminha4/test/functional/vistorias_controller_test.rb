require 'test_helper'

class VistoriasControllerTest < ActionController::TestCase
  setup do
    @vistoria = vistorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vistorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vistoria" do
    assert_difference('Vistoria.count') do
      post :create, vistoria: @vistoria.attributes
    end

    assert_redirected_to vistoria_path(assigns(:vistoria))
  end

  test "should show vistoria" do
    get :show, id: @vistoria.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vistoria.to_param
    assert_response :success
  end

  test "should update vistoria" do
    put :update, id: @vistoria.to_param, vistoria: @vistoria.attributes
    assert_redirected_to vistoria_path(assigns(:vistoria))
  end

  test "should destroy vistoria" do
    assert_difference('Vistoria.count', -1) do
      delete :destroy, id: @vistoria.to_param
    end

    assert_redirected_to vistorias_path
  end
end
