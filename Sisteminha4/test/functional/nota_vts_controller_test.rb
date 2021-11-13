require 'test_helper'

class NotaVtsControllerTest < ActionController::TestCase
  setup do
    @nota_vt = nota_vts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nota_vts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota_vt" do
    assert_difference('NotaVt.count') do
      post :create, nota_vt: @nota_vt.attributes
    end

    assert_redirected_to nota_vt_path(assigns(:nota_vt))
  end

  test "should show nota_vt" do
    get :show, id: @nota_vt.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nota_vt.to_param
    assert_response :success
  end

  test "should update nota_vt" do
    put :update, id: @nota_vt.to_param, nota_vt: @nota_vt.attributes
    assert_redirected_to nota_vt_path(assigns(:nota_vt))
  end

  test "should destroy nota_vt" do
    assert_difference('NotaVt.count', -1) do
      delete :destroy, id: @nota_vt.to_param
    end

    assert_redirected_to nota_vts_path
  end
end
