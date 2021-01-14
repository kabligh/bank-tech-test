class Statement

  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print
    puts(statement_header + list_transactions)
  end

  private

  def statement_header
    "date || credit || debit || balance\n"
  end

  def list_transactions
    list = @transaction_history.reverse.map do |transaction|
      "#{transaction.date} || #{format(transaction.credit)} || "\
      "#{format(transaction.debit)} || #{format(transaction.balance)}\n"
    end
    list.join("")
  end

  def format(number)
    number == nil ? "" : '%.2f' % number
  end

end
