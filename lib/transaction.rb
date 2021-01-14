# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance: nil, date: nil)
    @credit = credit
    @debit = debit
    @balance = '%.2f' % balance
    @date = date
  end

end
