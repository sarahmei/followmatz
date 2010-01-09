require 'test_helper'

class RubyistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubyists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rubyist" do
    assert_difference('Rubyist.count') do
      post :create, :rubyist => { }
    end

    assert_redirected_to rubyist_path(assigns(:rubyist))
  end

  test "should show rubyist" do
    get :show, :id => rubyists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rubyists(:one).to_param
    assert_response :success
  end

  test "should update rubyist" do
    put :update, :id => rubyists(:one).to_param, :rubyist => { }
    assert_redirected_to rubyist_path(assigns(:rubyist))
  end

  test "should destroy rubyist" do
    assert_difference('Rubyist.count', -1) do
      delete :destroy, :id => rubyists(:one).to_param
    end

    assert_redirected_to rubyists_path
  end
end
