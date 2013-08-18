require 'test_helper'

class ChroniclesControllerTest < ActionController::TestCase
  setup do
    @chronicle = chronicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chronicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chronicle" do
    assert_difference('Chronicle.count') do
      post :create, chronicle: { date: @chronicle.date+1.day, mood: @chronicle.mood, summary: @chronicle.summary }
    end

    assert_redirected_to chronicle_path(assigns(:chronicle))
  end

  test "should show chronicle" do
    get :show, id: @chronicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chronicle
    assert_response :success
  end

  test "should update chronicle" do
    patch :update, id: @chronicle, chronicle: { date: @chronicle.date, mood: @chronicle.mood, summary: @chronicle.summary }
    assert_redirected_to chronicle_path(assigns(:chronicle))
  end

  test "should destroy chronicle" do
    assert_difference('Chronicle.count', -1) do
      delete :destroy, id: @chronicle
    end

    assert_redirected_to chronicles_path
  end
end
