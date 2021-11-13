require 'test_helper'

class FechamentoDiarioVagaosControllerTest < ActionController::TestCase
  setup do
    @fechamento_diario_vagao = fechamento_diario_vagaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fechamento_diario_vagaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fechamento_diario_vagao" do
    assert_difference('FechamentoDiarioVagao.count') do
      post :create, fechamento_diario_vagao: @fechamento_diario_vagao.attributes
    end

    assert_redirected_to fechamento_diario_vagao_path(assigns(:fechamento_diario_vagao))
  end

  test "should show fechamento_diario_vagao" do
    get :show, id: @fechamento_diario_vagao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fechamento_diario_vagao.to_param
    assert_response :success
  end

  test "should update fechamento_diario_vagao" do
    put :update, id: @fechamento_diario_vagao.to_param, fechamento_diario_vagao: @fechamento_diario_vagao.attributes
    assert_redirected_to fechamento_diario_vagao_path(assigns(:fechamento_diario_vagao))
  end

  test "should destroy fechamento_diario_vagao" do
    assert_difference('FechamentoDiarioVagao.count', -1) do
      delete :destroy, id: @fechamento_diario_vagao.to_param
    end

    assert_redirected_to fechamento_diario_vagaos_path
  end
end
