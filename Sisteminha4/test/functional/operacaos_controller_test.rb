require 'test_helper'

class OperacaosControllerTest < ActionController::TestCase
  setup do
    @operacao = operacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operacao" do
    assert_difference('Operacao.count') do
      post :create, operacao: @operacao.attributes
    end

    assert_redirected_to operacao_path(assigns(:operacao))
  end

  test "should show operacao" do
    get :show, id: @operacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operacao.to_param
    assert_response :success
  end

  test "should update operacao" do
    put :update, id: @operacao.to_param, operacao: @operacao.attributes
    assert_redirected_to operacao_path(assigns(:operacao))
  end

  test "should destroy operacao" do
    assert_difference('Operacao.count', -1) do
      delete :destroy, id: @operacao.to_param
    end

    assert_redirected_to operacaos_path
  end
end
