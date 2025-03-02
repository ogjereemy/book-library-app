class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:create]


  def index
    @borrowings = current_user.borrowings.where(returned_at: nil)
    respond_to do |format|
      format.html
      format.json { render json: @borrowings }
    end
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    Rails.logger.debug "Borrowing Params: #{borrowing_params.inspect}"
    @borrowing.user = current_user
    if @borrowing.save
      @book.update(available: false) # Mark the book as unavailable when borrowed
      redirect_to @borrowing, notice: 'Book was successfully borrowed.'
    else
      puts @borrowing.errors.full_messages
      render :new
    end
  end

  def update
    @borrowing = current_user.borrowings.find(params[:id])
    if @borrowing.update(returned_at: Time.current)
      @borrowing.book.update(available: true) # Update book status to available when returned
      redirect_to user_path(current_user), notice: 'Book was successfully returned.'
    else
      render :edit
    end
  end

  def return_book
    @borrowing = Borrowing.find(params[:id])
    @borrowing.update(returned_at: Time.current) # Mark as returned
    redirect_to user_profile_path(current_user), notice: 'Book has been returned.'
  end

  def destroy
    @borrowing = Borrowing.find(params[:id])
    @borrowing.book.update(available: true) # Mark the book as available before destroying the borrowing record
    @borrowing.destroy
    redirect_to borrowings_url, notice: 'Borrowing was successfully destroyed.'
  end

  private

  def borrowing_params
    params.require(:borrowing).permit(:book_id, :user_id, :borrowed_at, :due_date, :returned_at)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
