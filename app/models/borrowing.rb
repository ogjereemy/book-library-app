class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_at, presence: true
  validates :due_date, presence: true
  validates :returned_at, presence: true, if: :returned?

  def returned?
    returned_at.present?
  end
end
