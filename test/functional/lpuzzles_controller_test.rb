require 'test_helper'

class LpuzzlesControllerTest < ActionController::TestCase
  setup do
    @lpuzzle = lpuzzles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lpuzzles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lpuzzle" do
    assert_difference('Lpuzzle.count') do
      post :create, lpuzzle: { difficulty: @lpuzzle.difficulty, hint: @lpuzzle.hint, image_url: @lpuzzle.image_url, question: @lpuzzle.question, solution: @lpuzzle.solution, title: @lpuzzle.title }
    end

    assert_redirected_to lpuzzle_path(assigns(:lpuzzle))
  end

  test "should show lpuzzle" do
    get :show, id: @lpuzzle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lpuzzle
    assert_response :success
  end

  test "should update lpuzzle" do
    put :update, id: @lpuzzle, lpuzzle: { difficulty: @lpuzzle.difficulty, hint: @lpuzzle.hint, image_url: @lpuzzle.image_url, question: @lpuzzle.question, solution: @lpuzzle.solution, title: @lpuzzle.title }
    assert_redirected_to lpuzzle_path(assigns(:lpuzzle))
  end

  test "should destroy lpuzzle" do
    assert_difference('Lpuzzle.count', -1) do
      delete :destroy, id: @lpuzzle
    end

    assert_redirected_to lpuzzles_path
  end
end
