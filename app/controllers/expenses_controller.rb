class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @transaction_type = TransactionType.all
    @category = Category.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses, status: :ok }
    end
  end
end
