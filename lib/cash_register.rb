class CashRegister
    attr_accessor :discount, :total, :items, :items_hashes

    def initialize(discount = 0)
        @discount = discount.to_f
        @total = 0
        @items = []
        @items_hashes = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times do | i |
            self.items << item
            self.items_hashes << {item: item, price: price * quantity.to_f}
        end
        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= self.total.to_f * (self.discount / 100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        # how do I grab the index and the price of the item?
        last_item = self.items.last
        puts last_item
        print self.items
        self.items.pop
        print self.items
        print self.items_hashes
        found_item = self.items_hashes.find do | item |
            item[:item] == last_item
        end
        self.total -= found_item[:price]
    end

end



