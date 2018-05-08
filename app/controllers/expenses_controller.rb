class ExpensesController < ApplicationController
  def index
    transaction_type = params["transaction_type"]
    category = params["category"]
    if transaction_type && !category
      @expenses = Expense.joins(:transaction_type).where("transaction_types.name = ?", transaction_type.capitalize).limit(5)
    elsif category && !transaction_type
      @expenses = Expense.joins(:category).where("categories.name = ?", category.capitalize).limit(5)
    elsif category && transaction_type
      @expenses = Expense.joins(:transaction_type, :category).where("transaction_types.name = ? AND categories.name", transaction_type.capitalize, category.capitalize).limit(5)
    else
      @expenses = Expense.order(date: :desc).limit(5)
    end


    @transaction_type = TransactionType.all
    @category = Category.all
    # @months =
    #   if expenses.last.date.month - expenses.first.date.month <  12

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses, status: :ok }
      format.js { render partial: "expenses_list", locals: { expenses: @expenses}}
    end
  end
end
