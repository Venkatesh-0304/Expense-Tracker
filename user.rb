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
    raise InvalidAmount, "Invalid amount" if expense.amount <= 0 
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
      raise ExpenseNotFound , "Expense not found"
    else
      @expenses.delete(expense)
      puts "Expense removed successfully"
    end
  end

  def list_expenses
    @expenses.each do |e|
      puts "----All expenses----"
      puts "Expense Title : #{e.title}"
      puts "Amount : #{e.amount}"
      puts "Category : #{e.category.name}"
      puts "Spend on : #{e.spent_on}"
    end
  end

  def total_expense
    total_expense = 0
    @expenses.each do |e|
      total_expense += e.amount
    end
    puts "Total expenses: #{total_expense}"
  end
end

