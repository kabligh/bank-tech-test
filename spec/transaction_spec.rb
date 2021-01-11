# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:value) { 1000 }
  let(:type) { :credit }
  subject(:transaction) { Transaction.new(value, type) }

  it 'records a positive value if transaction is credit' do
    expect(transaction.value).to eq 1000
  end

  it 'records the type of transaction' do
    expect(transaction.type).to eq :credit
  end

  it 'records the date a transaction was made' do
    time = Time.now
    expect(transaction.date).to eq time.strftime('%d/%m/%Y')
  end
end
