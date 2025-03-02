class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return_book]
  before_action :set_book, only: [:show, :borrow, :return_book]

  def index
    @books = Book.includes(:borrowings).all
    @book = Book.new
  end

  def show
    # Already handled by the set_book method
  end

  def borrow
    if @book.available?
      @borrowing = current_user.borrowings.create(book: @book, due_date: 2.weeks.from_now, borrowed_at: Time.current)
      @book.update(available: false)
      redirect_to user_profile_path(user_id: current_user.id), notice: "You have borrowed the book."
    else
      redirect_to book_path(@book), alert: "Book is not available."
    end
  end

  def return_book
    @book = Book.find(params[:id])
    @borrowing = current_user.borrowings.find_by(book: @book, returned_at: nil) # Find active borrowings
    if @borrowing
      @borrowing.update(returned_at: Time.current) # Mark as returned
      @book.update(available: true) # Mark the book as available
      redirect_to user_profile_path(current_user), notice: "You have returned the book."
    else
      redirect_to user_profile_path(current_user), notice: "Error returning the book."
    end
  end 

  def create
    @book = Book.new(book_params)
    if @book.save
      # Load the list of books to prevent the nil error when rendering the view
      @books = Book.all
      render :index, notice: 'Book was successfully created.'
    else
      # Load the list of books again if save fails, to prevent nil error
      @books = Book.all
      render :index, alert: 'Failed to create book.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :published_date)
  end
end
