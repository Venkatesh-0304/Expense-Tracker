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
    @expenses << expense
    puts "#{expense.title} Expense added successfully"
  end
end

u = User.new("bhoomi", "bhoomi@gmail.com")
u1 = User.new("priya", "priya@gmail.com")
food = Category.new("food")
e = Expense.new("pizza", 30, food, "3/june/26")

# puts u.name
# puts u.email
# puts u.user_id
# puts u1.name
# puts u1.email
# puts u1.user_id
u.add_expense(e)