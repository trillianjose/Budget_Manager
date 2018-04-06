require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do
    it "should belong to a user" do
      time = Time.now.freeze
      user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
      expense = Expense.new(amount: 30000, concept: "Uber", date: time, user: user)
      expect(expense.valid?).to eq(true)
      expect(expense.save).to eq(true)
      expect(Expense.count).to eq(1)
      expect(user.expenses).to eq([expense])
    end
    context "amount related" do
      before do
        time = Time.now.freeze
        user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @expense = Expense.new(amount: 30000, concept: "Uber", date: time, user: user)
      end
    end
    context "the amount is negative" do
      it "should not save the expense" do
        expect(@expense.valid?).to be_falsey
        expect(@expense.save).to be_falsey
      end
    end
    context "the amount is positive" do
      it "should save the expense" do
      end
    end
  end
end
