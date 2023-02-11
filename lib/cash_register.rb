class CashRegister
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times { @items << title }
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total *= (100 - @discount) / 100.0
    "After the discount, the total comes to $#{@total.round(2)}."
  end

  def items
    @items
  end

  def void_last_transaction
    last_item = @items.pop
    @total -= @items.count(last_item) * @total / @items.count
  end
end