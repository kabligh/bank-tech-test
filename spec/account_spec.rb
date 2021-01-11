require 'account'

describe Account do

  let(:account) { Account.new }

  describe '#initialize' do
    it 'has a starting balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'starts with an empty transaction history' do
      expect(account.transaction_history.length).to eq 0
    end

  end

  it { is_expected.to respond_to(:deposit).with(1).argument }

  describe '#deposit' do
    it 'increases the account balance by amount in argument' do
      account.deposit(1000)
      expect(account.balance).to eq 1000
    end
  end

  describe '#withdraw' do
    it 'reduces the account balance by amount in argument' do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq 500
    end
  end

end
