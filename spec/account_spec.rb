# frozen_string_literal: true

require 'account'

describe Account do
  describe '#initialize' do
    it 'has a starting balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'starts with an empty transaction history array' do
      expect(subject.transaction_history).to eq([])
    end
  end

  describe '#deposit' do
    # let(:credit_transaction) { double(value: 1000, type: :credit) }
    # let(:transaction_class) { double(new: credit_transaction) }
    let(:account) { Account.new }

    it 'increases the account balance by amount in argument' do
      account.deposit(1000)
      expect(account.balance).to eq 1000
    end

    it 'adds a credit type transaction to the transaction history' do
      account.deposit(1000)
      expect(account.transaction_history[0].type).to eq :credit
    end
  end

  describe '#withdraw' do
    let(:credit_transaction) { double(value: 1000, type: :credit) }
    let(:debit_transaction) { double(value: 500, type: :debit) }
    # let(:transaction_class) { double(new: debit_transaction) }
    let(:account) { Account.new }

    it 'reduces the account balance by amount in argument' do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq 500
    end

    it 'adds a debit type transaction to the transaction history' do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.transaction_history[1].type).to eq :debit
    end
  end
end
