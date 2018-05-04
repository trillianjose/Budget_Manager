class DashboardController < ApplicationController

  def index
    @today_expenses = DashboardHandler.today_expenses
    @yesterday_expenses = DashboardHandler.yesterday_expenses
    @this_month_expenses = DashboardHandler.this_month_expenses
    @last_month_expenses = DashboardHandler.last_month_expenses
  end

end
