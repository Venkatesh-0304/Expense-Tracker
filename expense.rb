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
end