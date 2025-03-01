class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow]
  before_action :set_book, only: [:show, :return]

  def index
    @books = Book.all
    @book = Book.new
    @books = Book.includes(:borrowings)
  end

  def show
    @book = Book.find(params[:id])
  end

  def borrow
    @book = Book.find(params[:id])
    if @book.available?
      @borrowing = current_user.borrowings.create(book: @book, due_date: 2.weeks.from_now, borrowed_at: Time.current)
      @book.update(available: false)
      redirect_to user_profile_path(user_id: current_user.id), notice: "You have borrowed the book."
    else
      redirect_to book_path(@book), alert: "Book is not available."
    end
  end

  def return_book
    @borrowing = current_user.borrowings.find_by(book_id: params[:id])
    if @borrowing
      @borrowing.book.update(available: true)
      @borrowing.destroy
      redirect_to user_profile_path, notice: "You have returned the book."
    else
      redirect_to user_profile_path, alert: "Error returning the book."
    end
  end 

  def return
    @book = Book.find(params[:id])
    borrowing = Borrowing.find_by(book: @book, user: current_user, returned_at: nil) # Only find active borrowings
  
    if borrowing
      borrowing.update(returned_at: Time.current) # Mark as returned
      @book.update(available: true) # Mark the book as available again
      redirect_to books_path, notice: "Book successfully returned."
    else
      redirect_to books_path, alert: "This book is not currently borrowed by you."
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :published_date, :isbn)
  end
end
