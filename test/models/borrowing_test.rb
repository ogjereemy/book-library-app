require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should not save borrowing without borrowed_at" do
    borrowing = Borrowing.new(due_date: Date.tomorrow, user: @user, book: @book)
    assert_not borrowing.save, "Saved the borrowing without a borrowed_at date"
  end

  test "should not save borrowing without due_date" do
    borrowing = Borrowing.new(borrowed_at: Date.today, user: @user, book: @book)
    assert_not borrowing.save, "Saved the borrowing without a due_date"
  end

  test "should save borrowing with borrowed_at and due_date" do
    borrowing = Borrowing.new(borrowed_at: Date.today, due_date: Date.tomorrow, user: @user, book: @book)
    assert borrowing.save, "Could not save the borrowing with borrowed_at and due_date"
  end

  test "should validate returned_at if present" do
    borrowing = Borrowing.new(borrowed_at: Date.today, due_date: Date.tomorrow, returned_at: Date.yesterday, user: @user, book: @book)
    assert_not borrowing.valid?, "Borrowing is valid with returned_at before borrowed_at"
  end
end
