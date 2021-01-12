# frozen_string_literal: true

class Transaction
  attr_reader :value, :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance: nil)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = Time.now.strftime('%d/%m/%Y')
  end

end
