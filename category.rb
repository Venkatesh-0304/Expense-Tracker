class Category 
  attr_accessor :name
  @@categories = []
  def initialize(name)
    @name = name
  end

  def add_category
    @@categories << self
    puts "#{self.name} Category added successfully"
  end

  def self.categories
    @@categories
  end
end