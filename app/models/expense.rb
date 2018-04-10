class Expense < ApplicationRecord

  validates :user_id, presence: true
  validates :category, presence: true
  validates :transaction_type, presence: true
  validates :amount, numericality: { greater_than: 0}
  validates :concept, presence: true
  validate :data_cant_be_nil

  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type

  def data_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end
end
