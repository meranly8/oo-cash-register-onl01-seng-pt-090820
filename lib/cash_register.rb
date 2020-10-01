class CashRegister
  attr_accessor :total, :discount, :items, :last_trans
  # @@items = []
  # @@item_and_price = []
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity=1)
    self.total += price * quantity
    # @@item_and_price << {title: title, subtotal: subtotal}
    self.last_trans = price * quantity
    quantity.times do
      @items << title
    end
  end
  
  def apply_discount
    if @discount != 0 
      percentage = self.discount.to_f/100
      deduction = self.total * percentage
      @total -= deduction
      "After the discount, the total comes to $#{@total.to_i}."
    else
      @total 
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    self.total -= self.last_trans
  end
end
