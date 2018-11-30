require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @book = books(:one)
    sign_in users(:one)
  end

  test "should get index" do
    
    sign_in users(:one)
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end


  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, general_media_id: @book.general_media_id } }
    assert_response :success
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
