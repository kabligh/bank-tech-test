# frozen_string_literal: true
require_relative 'transaction'

class Account
  attr_reader :balance, :transaction, :transaction_history

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << transaction.new(amount, :credit)
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << transaction.new(amount, :debit)
  end
end
