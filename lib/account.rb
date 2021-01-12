# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :balance, :transaction, :transaction_history

  def initialize(transaction: Transaction)
    @balance = 0
    @transaction = transaction
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << create_credit(amount)
  end

  def withdraw(amount)
    raise 'Not enough funds' if amount > @balance
    @balance -= amount
    @transaction_history << create_debit(amount)
  end

  def print_statement
    puts(statement_header + list_transaction)
  end

  # private

  def statement_header
    "date || credit || debit || balance\n"
  end

  def create_credit(amount)
    @transaction.new(credit: amount, balance: @balance)
  end

  def create_debit(amount)
    @transaction.new(debit: amount, balance: @balance)
  end

  def list_transaction
    list = @transaction_history.reverse.map do |transaction|
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    list.join("")
  end
end
