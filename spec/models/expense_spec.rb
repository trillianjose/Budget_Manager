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
        @expense = Expense.new(concept: "Uber", date: time, user: user)
      end
      context "the amount is negative" do
        it "should not save the expense" do
          @expense.amount = -200
          expect(@expense.valid?).to be_falsey
          expect(@expense.save).to be_falsey
          expect(@expense.errors.messages).not_to be_empty
        end
      end
      context "the amount is positive" do
        it "should save the expense" do
          @expense.amount = 20000
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors.messages).to be_empty
        end
      end
    end

    context "concept related" do
      before do
        time = Time.now.freeze
        user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @expense = Expense.new(amount: 30000, date: time, user: user)
      end
      context "the concept is not empty" do
        it "should save the expense" do
          @expense.concept = "Uber"
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors).to be_empty
        end
      end
      context "The concept is empty" do
          it "should not save the expense and show error" do
            expect(@expense.valid?).to be_falsey
            expect(@expense.save).to be_falsey
            expect(@expense.errors).not_to be_empty
          end
      end
    end

    context "date related" do
      before do
        user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @expense = Expense.new(amount: 30000, concept: "Uber", user: user)
      end
      context "the date is empty" do
        it "should save the expense and set the current date on the date field" do
          expect(@expense.save).to be_truthy
          expect(@expense.date).not_to be_nil
          expect(@expense.errors.messages).to be_empty
        end
      end
      context "the date is not empty" do
        it "should save the expenses" do
          time = Time.now.freeze
          @expense.date = time
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.date).to eq(time)
          expect(@expense.errors.messages).to be_empty
        end
      end
    end
  end
end
