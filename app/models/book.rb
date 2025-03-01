class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings
  has_many :borrowers, through: :borrowings, source: :user

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true
  validates :isbn, presence: true

  def available?
    borrowings.none? { |borrowing| borrowing.returned_at.nil? }
  end
end
