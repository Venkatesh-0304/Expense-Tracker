class Category 
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

c = Category.new("food")
puts c.name