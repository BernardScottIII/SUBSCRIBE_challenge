require './item.rb'

# A collection of Items for which the total sales tax and import duty are
#   applied to every item.
class Basket
  
  # Applicable at a rate of 10% on all goods, except books, food, and medical
  #   products that are exempt.
  @@BASIC_SALES_TAX = 0.1

  # Additional sales tax applicable on all imported goods at a rate of 5%, with
  #   no exemptions.
  @@IMPORT_DUTY = 0.05

  def initialize
    @items = []
    @applied_tax = 0.0
    @total_cost = 0.0
  end

  # These rules are being applied to sales tax
  def apply_rounding(amount)
    amount = amount.round(2)

    hundredths = ((amount * 100.0)%10.0).round
    if hundredths > 0.0 && hundredths < 5.0
      hundredths = 5.0
    end

    return (amount.round(1) + (hundredths/100)).round(2)
  end

  def apply_taxes(item)
    if item.class != Item
      raise TypeError, "Object is not an Item type."
    end

    sales_tax = item.price * @@BASIC_SALES_TAX

    # Exemption for books
    if item.name.include? "book"
      sales_tax = 0
    end

    # Exemption for food
    if item.name.include? "chocolate"
      sales_tax = 0
    end

    # Exemption for medical products
    if item.name.include? "headache pills"
      sales_tax = 0
    end

    # Import Duty
    if item.name.include? "imported"
      sales_tax += item.price * @@IMPORT_DUTY
    end

    # Apply rounding to 0.05 cent
    sales_tax = apply_rounding(sales_tax)

    @applied_tax += sales_tax * item.quantity

    new_price = (item.price + sales_tax) * item.quantity

    @total_cost += ((item.price + sales_tax) * item.quantity).round(2)

    return Item.new(item.quantity, item.name, new_price)
  end

  def add(item)
    if item.class != Item
      raise TypeError, "Object is not an Item type."
    end

    item = apply_taxes(item)
    @items.push(item)
  end

  def to_s
    result = "Basket with #{@items.length} items:" + "\n"
    for item in @items do
      result += item.to_s + "\n"
    end
    return result
  end

  def print_recipt
    result = ""
    for item in @items do
      result += "#{item.quantity} #{item.name}: %1.2f\n" % item.price
    end
    result += "Sales Taxes: %1.2f\n" % @applied_tax
    result += "Total: %1.2f" % @total_cost
  end
end
