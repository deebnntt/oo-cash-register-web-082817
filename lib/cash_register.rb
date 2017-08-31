
class CashRegister
#  attr_reader :quantity
  attr_accessor :discount, :total, :quantity, :title, :last_transaction

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @titles = []
    @last_transaction = last_transaction
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @title = title
    @quantity = quantity
    @price = price
    @total = @total + (@price * @quantity)
    quantity.times do
      @titles << title
    end
    @last_transaction = @price
  end

  def calc_discount
    @total = (@total * 0.80).to_i
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.calc_discount}."
    end
  end

  def items
    @titles
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end

end
