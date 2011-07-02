require 'test_helper'

class FopsControllerTest < ActionController::TestCase
  setup do
    @fop = fops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fop" do
    assert_difference('Fop.count') do
      post :create, fop: @fop.attributes
    end

    assert_redirected_to fop_path(assigns(:fop))
  end

  test "should show fop" do
    get :show, id: @fop.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fop.to_param
    assert_response :success
  end

  test "should update fop" do
    put :update, id: @fop.to_param, fop: @fop.attributes
    assert_redirected_to fop_path(assigns(:fop))
  end

  test "should destroy fop" do
    assert_difference('Fop.count', -1) do
      delete :destroy, id: @fop.to_param
    end

    assert_redirected_to fops_path
  end
end
