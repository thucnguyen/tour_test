require 'csv'

class Order
  def initialize(items = [])
    @items = items
  end

  def sales_taxes
    @items.inject(0) { |s, item| s + item.total_taxes }
  end

  def total
    @items.inject(0) { |s, item| s + item.total }
  end

  def export
    CSV.generate do |csv|
      @items.each do |item|
        csv << item.to_csv
      end
      csv << ["Sales Taxes: #{sales_taxes}"]
      csv << ["Total: #{total}"]
    end
  end
end
