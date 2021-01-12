# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:credit_transaction) { Transaction.new(credit: 1000, balance: 1000) }
  let(:debit_transaction) { Transaction.new(debit: 500, balance: 500)}

  it 'records a credit value if transaction is credit' do
    expect(credit_transaction.credit).to eq 1000
  end

  it 'records a debit value if transaction' do
    expect(debit_transaction.debit).to eq 500
  end

  it 'records the date a transaction was made' do
    time = Time.now
    expect(credit_transaction.date).to eq time.strftime('%d/%m/%Y')
  end
end
