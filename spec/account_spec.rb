require 'account'

describe Account do

  it 'lets holders deposit money' do
    expect(subject).to respond_to(:deposit).with(1).argument
  end
end
