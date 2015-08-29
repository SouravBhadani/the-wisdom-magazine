require 'test_helper'

class MegazinesControllerTest < ActionController::TestCase
  setup do
    @megazine = megazines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:megazines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create megazine" do
    assert_difference('Megazine.count') do
      post :create, megazine: { published: @megazine.published, title: @megazine.title, user_id: @megazine.user_id }
    end

    assert_redirected_to megazine_path(assigns(:megazine))
  end

  test "should show megazine" do
    get :show, id: @megazine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @megazine
    assert_response :success
  end

  test "should update megazine" do
    patch :update, id: @megazine, megazine: { published: @megazine.published, title: @megazine.title, user_id: @megazine.user_id }
    assert_redirected_to megazine_path(assigns(:megazine))
  end

  test "should destroy megazine" do
    assert_difference('Megazine.count', -1) do
      delete :destroy, id: @megazine
    end

    assert_redirected_to megazines_path
  end
end
