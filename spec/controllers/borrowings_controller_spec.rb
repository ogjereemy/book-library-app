require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  let(:book) { Book.create(title: 'Example Book', author: 'John Doe') }
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  before do
    sign_in user
  end

  it 'should allow borrowing a book' do
    post :create, params: { book_id: book.id }
    expect(book.borrowings.count).to eq(1)
    expect(flash[:notice]).to eq('You have borrowed the book!')
  end

  it 'should allow returning a book' do
    borrowing = book.borrowings.create(user: user)
    patch :return, params: { book_id: book.id, id: borrowing.id }
    expect(borrowing.reload.returned_at).not_to be_nil
    expect(flash[:notice]).to eq('You have returned the book!')
  end
end
