require 'test_helper'

class ProdutoVtsControllerTest < ActionController::TestCase
  setup do
    @produto_vt = produto_vts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produto_vts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produto_vt" do
    assert_difference('ProdutoVt.count') do
      post :create, produto_vt: @produto_vt.attributes
    end

    assert_redirected_to produto_vt_path(assigns(:produto_vt))
  end

  test "should show produto_vt" do
    get :show, id: @produto_vt.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produto_vt.to_param
    assert_response :success
  end

  test "should update produto_vt" do
    put :update, id: @produto_vt.to_param, produto_vt: @produto_vt.attributes
    assert_redirected_to produto_vt_path(assigns(:produto_vt))
  end

  test "should destroy produto_vt" do
    assert_difference('ProdutoVt.count', -1) do
      delete :destroy, id: @produto_vt.to_param
    end

    assert_redirected_to produto_vts_path
  end
end
