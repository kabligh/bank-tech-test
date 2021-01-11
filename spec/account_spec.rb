require 'account'

describe Account do

  it { is_expected.to respond_to(:deposit).with(1).argument }

  it 'has a starting balance of 0' do
      account = Account.new
      expect(account.balance).to eq 0
  end

end
