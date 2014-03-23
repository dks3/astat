require 'test_helper'

class CodesControllerTest < ActionController::TestCase
  setup do
    @code = codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code" do
    assert_difference('Code.count') do
      post :create, code: { city_code: @code.city_code, country_code: @code.country_code }
    end

    assert_redirected_to code_path(assigns(:code))
  end

  test "should show code" do
    get :show, id: @code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @code
    assert_response :success
  end

  test "should update code" do
    patch :update, id: @code, code: { city_code: @code.city_code, country_code: @code.country_code }
    assert_redirected_to code_path(assigns(:code))
  end

  test "should destroy code" do
    assert_difference('Code.count', -1) do
      delete :destroy, id: @code
    end

    assert_redirected_to codes_path
  end
end
