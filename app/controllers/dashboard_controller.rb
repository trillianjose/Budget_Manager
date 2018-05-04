class DashboardController < ApplicationController

  def index
    handler = DashboardHandler.new(Expense.all)
    @today_expenses = handler.today_expenses
    @yesterday_expenses = handler.yesterday_expenses
    @this_month_expenses = handler.this_month_expenses
    @last_month_expenses = handler.last_month_expenses
  end

end
