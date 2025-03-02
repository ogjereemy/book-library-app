class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  # Validations if needed
  validates :name, presence: true

  has_many :borrowings
  has_many :books, through: :borrowings


  has_many :borrowed_books, through: :borrowings, source: :book
end
