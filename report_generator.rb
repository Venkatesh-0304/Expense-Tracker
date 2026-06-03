class ReportGenerator 
  def generate_total_spending_report(user)
    puts "____Total spending report_____"
    puts "Name : #{user.name}"
    puts "Email : #{user.email}"
    puts "#{user.total_expense}"
  end

  def generate_monthly_report(user, month, year)
    expenses = user.expenses
    expenses.each do |e|
      if e.spent_on.month == month && e.spent_on.year == year
        display_details(e)
      end
    end
  end

  def generate_category_report(user)
    expenses = user.expenses
    grouped = expenses.group_by {|e| e.category.name}

    grouped.each do |category_name, category_expenses|
      puts "Expenses by category : #{category_name}"
      category_expenses.each {|e| display_details(e)}
    end
  end

  def display_details(e)
    puts "Expense Title : #{e.title}"
    puts "Amount : #{e.amount}"
    puts "Category : #{e.category.name}"
    puts "Spend on : #{e.spent_on}"
    puts "-" * 30
  end
end

