class User
  @@user_id = 0 

  attr_accessor :name, :expenses, :user_id, :email
  def initialize(name, email)
    @@user_id += 1
    @user_id = @@user_id
    @name = name
    @email = email
    @expenses = [] 
  end

  def add_expense(expense)  
    raise InvalidAmountError, "Invalid amount" if expense.amount <= 0 
    raise InvalidCategoryError, "Invalid category" unless Category.categories.include?(expense.category)
    @expenses << expense
    puts "#{expense.title} Expense added successfully"
  end

  def find_expense(expense_id)
    @expenses.find {|e| e.expense_id == expense_id}
  end

  def remove_expense(expense_id)
    expense = find_expense(expense_id)
    if expense.nil?
      raise ExpenseNotFoundError , "Expense not found"
    else
      @expenses.delete(expense)
      puts "Expense removed successfully"
    end
  end

  def list_expenses
    puts "----All expenses----"
    @expenses.each do |e|
      display_details(e)
    end
  end

  def total_expense
    total_expense = 0
    @expenses.each do |e|
      total_expense += e.amount
    end
    puts "Total expenses: #{total_expense}"
  end

  def expenses_by_category(category_name)
    puts "Expenses by category #{category_name}"
    @expenses.each do |e|
      if e.category.name == category_name
        display_details(e)
      end
    end
  end

  def monthly_expenses(month, year)
    @expenses.each do |e|
      if e.spent_on.month == month && e.spent_on.year == year
        display_details(e)
      end
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

