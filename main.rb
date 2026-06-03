require_relative "expense_not_found_error"
require_relative "invalid_amount_error"
require_relative "invalid_category_error"
require_relative "category"
require_relative "expense"
require_relative "user"
require_relative "report_generator"



u = User.new("bhoomi", "bhoomi@gmail.com")

food = Category.new("food")
food.add_category
transport = Category.new("trnasport")
transport.add_category

e = Expense.new("pizza", 200, food, "3/june/26")
# e = Expense.new("pizza", 0, food, "3/june/26")  # raises InvalidAmountError
e2 = Expense.new("burger", 100, food, "30/may/26")
e3 = Expense.new("ice cream", 50, food, "29/may/26")
e4 = Expense.new("coke", 40, food, "28/may/26")
e5 = Expense.new("chocolate", 50, transport, "25/may/26")


u.add_expense(e)
u.add_expense(e2)
u.add_expense(e3)
u.add_expense(e4)
u.add_expense(e5)
u.list_expenses
puts u.total_expense
u.remove_expense(e.expense_id)
puts u.total_expense

r = ReportGenerator.new
r.generate_total_spending_report(u)