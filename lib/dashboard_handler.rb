#Give a visual sumary about expenses for: day, last month, category and the accumulated compare the current month with the last concept

class DashboardHandler

  def today_expenses(expenses)
    @expenses = expenses
  end

  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end
end
  
