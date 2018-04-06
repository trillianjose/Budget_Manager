require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do
    it "should belong to a user" do
      time = Time.now.freeze
      expense = Expense.new(amount: 30000, concept: "Uber", date: time)
      expect(expenses.valid?).to eq(true)
    end
  end
end
