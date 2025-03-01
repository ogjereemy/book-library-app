require 'test_helper'

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @borrowing = borrowings(:one)
    @user = users(:one)
    @book = books(:one)
    sign_in @user
  end

  test "should get index" do
    get borrowings_path
    assert_response :success
  end

  test "should create borrowing" do
    post borrowings_url, params: { borrowing: { book_id: @book.id, user_id: @user.id, due_date: Date.tomorrow } }
    borrowing = Borrowing.last
    assert_not_nil borrowing
    assert_equal @book.id, borrowing.book_id
    assert_equal @user.id, borrowing.user_id
  end

  test "should return book" do
    patch borrowing_path(@borrowing), params: { borrowing: { returned_at: Time.current } }
    assert_redirected_to user_path(users(:one))
  end

  test "should destroy borrowing" do
    assert_difference('Borrowing.count', -1) do
      delete borrowing_path(@borrowing)
    end
    assert_redirected_to borrowings_path
  end
end
