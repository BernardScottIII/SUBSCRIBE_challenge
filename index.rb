require './item.rb'
require './basket.rb'

input = $stdin.read
items = Basket.new

for line in input.split("\n") do
  parts = line.split(" ")
  quantity = parts[0].to_i
  item =  parts[1..-3].join(" ")
  price = parts[-1].to_f
  items.add(Item.new(quantity, item, price))
end

puts items.print_recipt
