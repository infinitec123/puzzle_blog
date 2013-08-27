require 'test_helper'

class MpuzzlesControllerTest < ActionController::TestCase
  setup do
    @mpuzzle = mpuzzles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mpuzzles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mpuzzle" do
    assert_difference('Mpuzzle.count') do
      post :create, mpuzzle: { difficulty: @mpuzzle.difficulty, hint: @mpuzzle.hint, image_url: @mpuzzle.image_url, question: @mpuzzle.question, solution: @mpuzzle.solution, title: @mpuzzle.title }
    end

    assert_redirected_to mpuzzle_path(assigns(:mpuzzle))
  end

  test "should show mpuzzle" do
    get :show, id: @mpuzzle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mpuzzle
    assert_response :success
  end

  test "should update mpuzzle" do
    put :update, id: @mpuzzle, mpuzzle: { difficulty: @mpuzzle.difficulty, hint: @mpuzzle.hint, image_url: @mpuzzle.image_url, question: @mpuzzle.question, solution: @mpuzzle.solution, title: @mpuzzle.title }
    assert_redirected_to mpuzzle_path(assigns(:mpuzzle))
  end

  test "should destroy mpuzzle" do
    assert_difference('Mpuzzle.count', -1) do
      delete :destroy, id: @mpuzzle
    end

    assert_redirected_to mpuzzles_path
  end
end
