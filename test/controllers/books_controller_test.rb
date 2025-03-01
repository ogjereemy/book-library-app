require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @book = books(:one) # Fixture for book
    sign_in @user
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should show book" do
    get book_path(@book)
    assert_response :success
  end

  test "should borrow book" do
    book = books(:one)
    borrowing = Borrowing.new(book: book, user: users(:one), due_date: Date.today + 14.days, borrowed_at: Time.current)
    assert borrowing.save
  end

  test "should return book" do
    post return_book_path(@book)
    assert_redirected_to books_path
  end

  test "should be valid" do
    book = books(:one)
    assert book.valid?
  end
end
