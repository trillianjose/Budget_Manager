class ExpensesController < ApplicationController
  def index
    @expenses = Expense.order(created_at: :desc)
    @transaction_type = TransactionType.all
    @category = Category.all
    # @months =
    #   if expenses.last.date.month - expenses.first.date.month <  12


    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses, status: :ok }
    end
  end
end
