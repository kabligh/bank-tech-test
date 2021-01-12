# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double :transaction }
  let(:account) { Account.new(transaction: transaction) }

  describe '#initialize' do
    it 'has a starting balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'starts with an empty transaction history array' do
      expect(account.transaction_history).to eq([])
    end
  end

  describe '#deposit' do
    before do
      allow(transaction).to receive(:new)
    end

    it 'increases the account balance by amount in argument' do
      account.deposit(1000)
      expect(account.balance).to eq 1000
    end

    it 'adds a transaction to the transactions history array' do
      expect { account.deposit(1000) }.to change { account.transaction_history.length }.by(1)
    end

    it 'adds the amount to the transaction credit' do
      expect(transaction).to receive(:new).with(credit: 1000, balance: 1000)
      account.deposit(1000)
    end
  end

  describe '#withdraw' do
    before do
      allow(transaction).to receive(:new)
    end

    it 'raises an error if not enough money in account' do
      expect{account.withdraw(5)}.to raise_error('Not enough funds')
    end

    it 'reduces the account balance by amount in argument' do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq 500
    end

    it 'adds a transaction to the transactions history array' do
      account.deposit(1000)
      expect { account.withdraw(500) }.to change { account.transaction_history.length }.by(1)
    end
  end

  describe '#print_statement' do
    # let(:transaction_history) { [credit_transaction, debit_transaction] }
    # let(:credit_transaction) { double(:credit_transaction, credit: 1000, balance: 1000, date: 12/01/2021) }
    # let(:debit_transaction) { double(:debit_transaction, debit: 500, balance: 500, date: 12/01/2021) }
    let(:account) { Account.new }

    text = "date || credit || debit || balance\n"\
    "12/01/2021 ||  || 500 || 500\n"\
    "12/01/2021 || 1000 ||  || 1000\n"

    it 'prints transactions in correct format' do
      account.deposit(1000)
      account.withdraw(500)
      expect { account.print_statement }.to output(text).to_stdout
    end
  end
end
