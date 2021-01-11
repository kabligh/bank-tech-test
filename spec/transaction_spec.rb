require 'transaction'

describe Transaction do

  describe '#initialize' do
    let(:value) { 1000 }
    let(:type) { :credit }
    subject(:transaction) { Transaction.new(value, type) }

    it 'records the amount of the transaction upon initialize' do
      expect(transaction.value).to eq 1000
    end

    it 'records the date a transaction was made' do
      time = Time.now
      expect(transaction.date).to eq time.strftime("%d/%m/%Y")
    end

  end

  describe '#credit' do
    let(:value) { 1000 }
    let(:type) { :credit }
    subject(:transaction) { Transaction.new(value, type) }

    it 'returns positive value' do
      expect(transaction.credit).to eq value
    end
  end

  describe '#debit' do
    let(:value) { 1000 }
    let(:type) { :debit }
    subject(:transaction) { Transaction.new(value, type) }

    it 'returns negative value' do
      expect(transaction.debit).to eq -value
    end
  end

end
