require 'test_helper'

class GrupoUsuariosControllerTest < ActionController::TestCase
  setup do
    @grupo_usuario = grupo_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupo_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupo_usuario" do
    assert_difference('GrupoUsuario.count') do
      post :create, grupo_usuario: @grupo_usuario.attributes
    end

    assert_redirected_to grupo_usuario_path(assigns(:grupo_usuario))
  end

  test "should show grupo_usuario" do
    get :show, id: @grupo_usuario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupo_usuario.to_param
    assert_response :success
  end

  test "should update grupo_usuario" do
    put :update, id: @grupo_usuario.to_param, grupo_usuario: @grupo_usuario.attributes
    assert_redirected_to grupo_usuario_path(assigns(:grupo_usuario))
  end

  test "should destroy grupo_usuario" do
    assert_difference('GrupoUsuario.count', -1) do
      delete :destroy, id: @grupo_usuario.to_param
    end

    assert_redirected_to grupo_usuarios_path
  end
end
