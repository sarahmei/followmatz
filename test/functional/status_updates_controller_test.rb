require 'test_helper'

class StatusUpdatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_update" do
    assert_difference('StatusUpdate.count') do
      post :create, :status_update => { }
    end

    assert_redirected_to status_update_path(assigns(:status_update))
  end

  test "should show status_update" do
    get :show, :id => status_updates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => status_updates(:one).to_param
    assert_response :success
  end

  test "should update status_update" do
    put :update, :id => status_updates(:one).to_param, :status_update => { }
    assert_redirected_to status_update_path(assigns(:status_update))
  end

  test "should destroy status_update" do
    assert_difference('StatusUpdate.count', -1) do
      delete :destroy, :id => status_updates(:one).to_param
    end

    assert_redirected_to status_updates_path
  end
end
