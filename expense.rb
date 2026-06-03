require_relative "category"
class Expense 
  @@expense_id = 0

  attr_accessor :title, :amount, :category, :spent_on, :expense_id

  def initialize(title, amount, category, spent_on)
    @@expense_id += 1
    @expense_id = @@expense_id
    @title = title
    @amount = amount
    @category = category
    @spent_on = spent_on
  end
end

food = Category.new("food")
e = Expense.new("pizza", 30, food, "3/june/26")
puts e.title
puts e.amount
puts e.category.name
puts e.spent_on
puts e.expense_id