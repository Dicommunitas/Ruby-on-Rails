require 'test_helper'

class ComposicaoDeVagaosControllerTest < ActionController::TestCase
  setup do
    @composicao_de_vagao = composicao_de_vagaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:composicao_de_vagaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create composicao_de_vagao" do
    assert_difference('ComposicaoDeVagao.count') do
      post :create, composicao_de_vagao: @composicao_de_vagao.attributes
    end

    assert_redirected_to composicao_de_vagao_path(assigns(:composicao_de_vagao))
  end

  test "should show composicao_de_vagao" do
    get :show, id: @composicao_de_vagao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @composicao_de_vagao.to_param
    assert_response :success
  end

  test "should update composicao_de_vagao" do
    put :update, id: @composicao_de_vagao.to_param, composicao_de_vagao: @composicao_de_vagao.attributes
    assert_redirected_to composicao_de_vagao_path(assigns(:composicao_de_vagao))
  end

  test "should destroy composicao_de_vagao" do
    assert_difference('ComposicaoDeVagao.count', -1) do
      delete :destroy, id: @composicao_de_vagao.to_param
    end

    assert_redirected_to composicao_de_vagaos_path
  end
end
