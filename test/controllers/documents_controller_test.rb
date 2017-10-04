require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get set_document" do
    get :set_document
    assert_response :success
  end

  test "should get document_params" do
    get :document_params
    assert_response :success
  end

  test "should get sort_column" do
    get :sort_column
    assert_response :success
  end

  test "should get sort_direction" do
    get :sort_direction
    assert_response :success
  end

end
