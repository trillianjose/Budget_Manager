#Give a visual sumary about expenses for: day, last month, category and the accumulated compare the current month with the last concept

class DashboardHandler

  def initialize(expenses)
    @expenses = expenses
  end

  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
    @expense.yesterday_expenses.pluck(:amount).sum
  end

  def this_month_expenses
    @expense.this_month.pluck(:amount).sum
  end

  def last_month_expenses
    @expense.last_month.pluck(:amount).sum
  end

  def last_six_month_expenses_by_transaction
    @expense.by_transaction_last_six_month
  end

  def this_month_daily_by_transaction
    @expense.by_transaction_this_month
  end

  def current_month_by_category_expenses
    @expense.by_category_this_month
  end

  def accumulated_against_past_month
    @expense.last_month
    @expense.this_month
  end

end
