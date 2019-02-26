require 'spec_helper'

describe Item do
  let(:quantity) { 2 }
  let(:imported) { false }
  let(:exempt) { false }
  subject { described_class.new('Example item', 10, 2, imported, exempt) }

  describe '#imported_tax' do
    context 'when it is not imported' do
      it 'returns zero' do
        expect(subject.imported_tax).to be_zero
      end
    end

    context 'when it is imported' do
      let(:imported) { true }
      it 'returns 1' do
        expect(subject.imported_tax).to eq 0.5
      end
    end
  end

  describe '#sale_tax' do
    it 'is 10 percent on the price' do
      expect(subject.sale_tax).to eq 1
    end

    context 'when it is a exempt item' do
      let(:exempt) { true }

      it 'returns zero' do
        expect(subject.sale_tax).to be_zero
      end
    end
  end

  describe '#taxes' do
    it 'is the sum of sale_tax and imported tax' do
      expect(subject.taxes).to eq 1
    end
  end

  describe '#total_taxes' do
    it 'is the quantity * taxes' do
      expect(subject.total_taxes).to eq 2 * subject.taxes
    end
  end

  describe '#cost' do
    it 'is the sum of cost and taxes' do
      expect(subject.cost).to eq 11
    end
  end

  describe '#total' do
    it 'is the quantity * cost' do
      expect(subject.total).to eq subject.cost * 2
    end
  end

  describe '#to_csv' do
    it 'returns an array' do
      expect(subject.to_csv).to eq [2, 'Example item', subject.total]
    end
  end
end
