#Give a visual sumary about expenses for: day, last month, category and the accumulated compare the current month with the last concept

class DashboardHandler
  def initialize(expenses)
    @expenses = expenses
  end

  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
    @expenses.yesterday_expenses.pluck(:amount).sum
  end

  def this_month_expenses
    @expenses.this_month.pluck(:amount).sum
  end

  def last_month_expenses
    @expenses.last_month.pluck(:amount).sum
  end

  def last_six_month_expenses_by_transaction
    @expenses.by_transaction_last_six_month
  end

  def this_month_daily_by_transaction
    @expenses.by_transaction_this_month
  end

  def current_month_by_category_expenses
    @expenses.by_category_this_month
  end

  def accumulated_against_past_month
    @expenses.last_month
    @expenses.this_month
  end

  def last_six_month
    @expenses.last_six_months
  end

  def this_month
    @expenses.this_month
  end

  def last_two_months
      @expenses.last_two_months
  end
end
