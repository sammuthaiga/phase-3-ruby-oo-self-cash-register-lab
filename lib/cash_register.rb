class CashRegister
    attr_accessor :total, :quantity, :items, :price
    attr_reader :discount, :title

    def initialize(discount=0, total = 0)
        @total = total
        @discount=discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @title = title
        @price = price * quantity
        quantity.times { @items << title }
        self.total += self.price
    end

    def apply_discount
        if @discount > 0
            @total -= (@total * @discount/100)
            "After the discount, the total comes to $#{@total.round(2)}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @price
    end

end