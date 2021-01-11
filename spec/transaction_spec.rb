require 'transaction'

describe Transaction do

  let(:value) { 1000 }

  subject(:transaction) { Transaction.new(value)}

  it 'records the amount of the transaction upon initialize' do
    expect(transaction.value).to eq 1000
  end

  it 'records the date a transaction was made' do
    time = Time.now
    expect(transaction.date).to eq time.strftime("%d/%m/%Y")
  end
end
