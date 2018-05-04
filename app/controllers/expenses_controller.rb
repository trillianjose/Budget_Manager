class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @transaction_type = TransactionType.all
    @category = Category.all
  end
end
