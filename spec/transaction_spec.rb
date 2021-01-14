# frozen_string_literal: true

require 'transaction'
require 'date'

describe Transaction do
  let(:credit_transaction) { Transaction.new(credit: 1000, balance: 1000, date: 12/01/2021) }
  let(:debit_transaction) { Transaction.new(debit: 500, balance: 500, date: 12/01/2021)}

  it 'records a credit value if transaction is credit' do
    expect(credit_transaction.credit).to eq 1000
  end

  it 'records a debit value if transaction' do
    expect(debit_transaction.debit).to eq 500
  end

  it 'records the date a transaction was made' do
    date = 12/01/2021
    expect(credit_transaction.date).to eq date
  end
end
