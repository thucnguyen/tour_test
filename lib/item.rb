class Item
  def initialize(name, price, quantity = 1, imported = false, exempt = false)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
    @exempt = exempt
  end

  def imported_tax
    return 0 unless @imported

    @price * 0.05
  end

  def sale_tax
    return 0 if @exempt

    @price * 0.1
  end

  def taxes
    round_up(imported_tax + sale_tax)
  end

  def cost
    @price + taxes
  end

  def total
    cost * @quantity
  end

  def to_csv
    [@name, @price, total]
  end

  private

  def round_up(value)
    (value * 20).round / 20.0
  end
end
