class Expense 
  @@expense_id = 0

  attr_accessor :title, :amount, :category, :spent_on, :expense_id

  def initialize(title, amount, category, spent_on)
    @@expense_id += 1
    @expense_id = @@expense_id
    @title = title
    @amount = amount
    @category = category
    raise "Cannot add future expenses" if spent_on > Date.today
    @spent_on = spent_on
  end

  def display_details
    puts "_________________________________________________"
    puts "Expense Title : #{self.title}"
    puts "Amount : #{self.amount}"
    puts "Category : #{self.category.name}"
    puts "Spend on : #{self.spent_on}"
  end
end