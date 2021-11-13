require 'test_helper'

class TipoAmostrasControllerTest < ActionController::TestCase
  setup do
    @tipo_amostra = tipo_amostras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_amostras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_amostra" do
    assert_difference('TipoAmostra.count') do
      post :create, tipo_amostra: @tipo_amostra.attributes
    end

    assert_redirected_to tipo_amostra_path(assigns(:tipo_amostra))
  end

  test "should show tipo_amostra" do
    get :show, id: @tipo_amostra.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_amostra.to_param
    assert_response :success
  end

  test "should update tipo_amostra" do
    put :update, id: @tipo_amostra.to_param, tipo_amostra: @tipo_amostra.attributes
    assert_redirected_to tipo_amostra_path(assigns(:tipo_amostra))
  end

  test "should destroy tipo_amostra" do
    assert_difference('TipoAmostra.count', -1) do
      delete :destroy, id: @tipo_amostra.to_param
    end

    assert_redirected_to tipo_amostras_path
  end
end
