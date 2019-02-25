require 'spec_helper'
require 'csv'

describe Order do
  let(:chocolate) { Item.new('Chocolate', 10, false, true) }
  let(:perfume) { Item.new('Perfume', 20, false, false) }

  subject { described_class.new([chocolate, perfume]) }

  describe '#sales_taxes' do
    it 'is the sum of taxes' do
      expect(subject.sales_taxes).to eq(chocolate.taxes + perfume.taxes)
    end
  end

  describe '#total' do
    it 'is the sum of items cost' do
      expect(subject.total).to eq(chocolate.total + perfume.total)
    end
  end

  describe '#export' do
    let(:csv) do
      chocolate.to_csv.to_csv +
        perfume.to_csv.to_csv
    end

    it 'generates list items in csv format' do
      expect(subject.export).to eq csv
    end
  end
end
