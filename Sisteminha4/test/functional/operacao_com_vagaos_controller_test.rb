require 'test_helper'

class OperacaoComVtsControllerTest < ActionController::TestCase
  setup do
    @operacao_com_vagao = operacao_com_vagaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operacao_com_vagaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operacao_com_vagao" do
    assert_difference('OperacaoComVt.count') do
      post :create, operacao_com_vagao: @operacao_com_vagao.attributes
    end

    assert_redirected_to operacao_com_vagao_path(assigns(:operacao_com_vagao))
  end

  test "should show operacao_com_vagao" do
    get :show, id: @operacao_com_vagao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operacao_com_vagao.to_param
    assert_response :success
  end

  test "should update operacao_com_vagao" do
    put :update, id: @operacao_com_vagao.to_param, operacao_com_vagao: @operacao_com_vagao.attributes
    assert_redirected_to operacao_com_vagao_path(assigns(:operacao_com_vagao))
  end

  test "should destroy operacao_com_vagao" do
    assert_difference('OperacaoComVt.count', -1) do
      delete :destroy, id: @operacao_com_vagao.to_param
    end

    assert_redirected_to operacao_com_vagaos_path
  end
end
