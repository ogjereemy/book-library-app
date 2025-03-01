require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    @borrowing = borrowings(:one)
    sign_in @user
  end

  test "should get index" do
    get borrowings_url
    assert_response :success
  end

  test "should create borrowing" do
    assert_difference('Borrowing.count') do
      post borrowings_url, params: { borrowing: { book_id: @book.id, borrowed_at: Date.today, due_date: Date.tomorrow, user_id: @user.id } }
    end
    assert_redirected_to borrowing_url(Borrowing.last)
  end

  test "should update borrowing" do
    patch borrowing_url(@borrowing), params: { borrowing: { returned_at: Time.current, user_id: @user.id } }
    assert_redirected_to user_path(@user)
  end

  test "should destroy borrowing" do
    assert_difference('Borrowing.count', -1) do
      delete borrowing_url(@borrowing)
    end
    assert_redirected_to borrowings_url
  end
end
