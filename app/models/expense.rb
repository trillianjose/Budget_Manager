class Expense < ApplicationRecord

  validates :user_id, presence: true
  validates :category, presence: true
  validates :transaction_type, presence: true
  validates :amount, numericality: { greater_than: 0}
  validates :concept, presence: true
  before_create :data_cant_be_nil

  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type

  scope :last_six_months, -> { where("date >= ?", 6.months.ago)}
  scope :this_month, -> { where("date >= ?", 0.month.ago.beginning_of_month)}
  scope :by_category, -> { this_month.group_by { |expense| expense.category.name}}
  scope :last_month, -> { where("date >= ? and date >= ?", 1.month.ago.beginning_of_month, 1.month.ago.end_of_month)}
  scope :amount_last_month, -> {last_month.pluck(:amount).sum }
  scope :amount_this_month, -> {this_month.pluck(:amount).sum }
  scope :daily_expenses, -> {where('date >=?', 1.day.ago.end_of_day).count )}

  def data_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end
end
