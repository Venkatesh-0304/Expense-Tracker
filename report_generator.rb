class ReportGenerator 
  def generate_total_spending_report(user)
    puts "____Total spending report_____"
    puts "Name : #{user.name}"
    puts "Email : #{user.email}"
    puts "#{user.total_expense}"
  end

  def generate_monthly_report(user, month, year)
    puts "Monthly Spends "
    expenses = user.expenses
    user_monthly_expenses = expenses.select do |e| 
      e.spent_on.month == month && e.spent_on.year == year
    end

    user_monthly_expenses.each  {|e| display_details(e)}

    total = user_monthly_expenses.sum(&:amount)
    puts "\n"
    puts "Total for the month #{month} is : #{total}"
  end

  def generate_category_report(user)
    expenses = user.expenses
    grouped = expenses.group_by {|e| e.category.name}
    grouped.each do |category_name, category_expenses|
      total = 0
      puts "_________________________________________________"
      puts "Expenses by category : #{category_name}"
      total = expenses.sum(&:amount)
      puts "Total from category #{category_name} : #{total}"
      puts "_________________________________________________"
    end
  end

  def display_details(e)
    puts "_________________________________________________"
    puts "Expense Title : #{e.title}"
    puts "Amount : #{e.amount}"
    puts "Category : #{e.category.name}"
    puts "Spend on : #{e.spent_on}"
  end
end

