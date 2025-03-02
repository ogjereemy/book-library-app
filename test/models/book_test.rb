require "test_helper"

class BookTest < ActiveSupport::TestCase
  setup do
    @book = Book.new(title: "Example Title", author: "Example Author", isbn: "1234567890")
  end

  test "should be valid" do
    book = books(:one)
    assert book.valid?
  end

  test "title should be present" do
    @book.title = ""
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = ""
    assert_not @book.valid?
  end

  test "isbn should be unique" do
    duplicate_book = @book.dup
    @book.save
    assert_not duplicate_book.valid?
  end

  test "book should be available if no active borrowings" do
    assert @book.available?
  end

  test "should destroy borrowing" do
    borrowing = borrowings(:one)
    assert_difference("Borrowing.count", -1) do
      borrowing.destroy
    end
  end
end
