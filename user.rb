require_relative "expense"
require_relative "category"
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
    if expense.amount <= 0
      raise InvalidAmount, "Invalid Amount"
    elsif !@categories.include?(expense.category)
      raise InvalidCategoryError, "Invalid category"
    else
      @expenses << expense
      puts "#{expense.title} Expense added successfully"
    end
  end

  def find_expense(expense_id)
    @expenses.find {|e| e.expense_id == expense_id}
  end

  def remove_expense(expense_id)
    expense = find_expense(expense_id)
    if expense.empty?
      raise ExpenseNotFound , "Expense not found"
    else
      @expenses.delete(expense)
      puts "Expense removed successfully"
    end
  end

  def list_experses
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

u = User.new("bhoomi", "bhoomi@gmail.com")
u1 = User.new("priya", "priya@gmail.com")
food = Category.new("food")
e = Expense.new("pizza", 200, food, "3/june/26")
e2 = Expense.new("burger", 100, food, "30/may/26")
e3 = Expense.new("ice cream", 50, food, "29/may/26")

e4 = Expense.new("coke", 40, food, "28/may/26")
e5 = Expense.new("chocolate", 50, transport, "25/may/26")



# puts u.name
# puts u.email
# puts u.user_id
# puts u1.name
# puts u1.email
# puts u1.user_id
u.add_expense(e)
u.add_expense(e2)
u.add_expense(e3)

u.add_expense(e4)
u.add_expense(e5)


u.list_experses
puts u.total_expense
# puts e.expense_id
u.remove_expense(e5.expense_id)

puts u.total_expense

