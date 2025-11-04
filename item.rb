# Single entry in provided input files.
class Item

  attr_accessor :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
  end

  def to_s
    "#{@quantity} #{@name} at #{@price}"
  end
end
