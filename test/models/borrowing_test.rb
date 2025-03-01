require 'test_helper'

class BorrowingTest < ActiveSupport::TestCase
  def setup
    @borrowing = borrowings(:one)
    @borrowing.user = users(:one)
  end

  test "should be valid" do
    assert @borrowing.valid?
  end

  test "should create borrowing" do
    borrowing = Borrowing.new(book: books(:one), user: users(:one), due_date: Date.today + 14.days, borrowed_at: Time.current)
    assert borrowing.save
  end

  test "should destroy borrowing" do
    assert_difference('Borrowing.count', -1) do
      @borrowing.destroy
    end
  end

  test "should not save borrowing without book" do
    borrowing = Borrowing.new(user: users(:one))
    assert_not borrowing.save
  end

  test "due date should be present" do
    @borrowing.due_date = nil
    assert_not @borrowing.valid?
  end

  test "should mark book as unavailable when borrowed" do
    book = books(:one)
    borrowing = Borrowing.new(book: book, user: users(:one), due_date: Date.today + 14.days, borrowed_at: Time.current)
    borrowing.save
    assert_not book.available?
  end

  test "should return book" do
    @borrowing.returned_at = Time.current
    @borrowing.save
    assert @borrowing.book.available?
  end

  test "borrowed at should be present" do
    @borrowing.borrowed_at = nil
    assert_not @borrowing.valid?
  end
end
