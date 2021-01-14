require 'statement'

class TransactionDouble
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance: nil, date: nil)
    @credit = credit
    @debit = debit
    @balance = '%.2f' % balance
    @date = date
  end
end

describe Statement do

  describe '#print' do
    it 'prints the header when no transactions have been made' do
      statement = Statement.new([])
      header = "date || credit || debit || balance\n"
      expect { statement.print }.to output(header).to_stdout
    end

    it 'prints a statement with just credit correctly' do
      transaction_double = TransactionDouble.new(credit: 1000, balance: 1000, date: '11/01/2021')
      statement = Statement.new([transaction_double])
      output = "date || credit || debit || balance\n"\
              "11/01/2021 || 1000.00 ||  || 1000.00\n"
      expect { statement.print }.to output(output).to_stdout
    end

    it 'prints a statement with just debit correctly' do
      transaction_double = TransactionDouble.new(debit: 500, balance: 500, date: '12/01/2021')
      statement = Statement.new([transaction_double])
      output = "date || credit || debit || balance\n"\
              "12/01/2021 ||  || 500.00 || 500.00\n"
      expect { statement.print }.to output(output).to_stdout
    end
  end

end
