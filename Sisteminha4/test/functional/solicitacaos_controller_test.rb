require 'test_helper'

class SolicitacaosControllerTest < ActionController::TestCase
  setup do
    @solicitacao = solicitacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitacao" do
    assert_difference('Solicitacao.count') do
      post :create, solicitacao: @solicitacao.attributes
    end

    assert_redirected_to solicitacao_path(assigns(:solicitacao))
  end

  test "should show solicitacao" do
    get :show, id: @solicitacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solicitacao.to_param
    assert_response :success
  end

  test "should update solicitacao" do
    put :update, id: @solicitacao.to_param, solicitacao: @solicitacao.attributes
    assert_redirected_to solicitacao_path(assigns(:solicitacao))
  end

  test "should destroy solicitacao" do
    assert_difference('Solicitacao.count', -1) do
      delete :destroy, id: @solicitacao.to_param
    end

    assert_redirected_to solicitacaos_path
  end
end
