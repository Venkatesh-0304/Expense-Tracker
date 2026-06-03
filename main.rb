require "date"
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
transport = Category.new("transport")
transport.add_category

e = Expense.new("pizza", 200, food, Date.new(2025, 8, 5))
# e = Expense.new("pizza", 0, food, "3/june/26")  # raises InvalidAmountError
e2 = Expense.new("burger", 100, food, Date.new(2026, 12, 20))
e3 = Expense.new("ice cream", 50, food, Date.new(2024, 6, 23))
e4 = Expense.new("coke", 40, food, Date.new(2025, 8, 5))
e5 = Expense.new("chocolate", 50, transport, Date.new(2026, 12, 25))


u.add_expense(e)
u.add_expense(e2)
u.add_expense(e3)
u.add_expense(e4)
u.add_expense(e5)
u.list_expenses
puts u.total_expense
u.remove_expense(e.expense_id)
puts u.total_expense

u.expenses_by_category("food")
u.monthly_expenses(12, 2026)

r = ReportGenerator.new
r.generate_total_spending_report(u)
