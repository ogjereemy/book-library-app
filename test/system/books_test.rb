require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books List"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Title", with: @book.title
    fill_in "Author", with: @book.author
    fill_in "Isbn", with: @book.isbn
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "showing a Book" do
    visit book_url(@book)
    assert_selector "h1", text: @book.title
  end
end
