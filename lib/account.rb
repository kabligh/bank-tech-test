# frozen_string_literal: true

require 'time'
require_relative 'transaction'
require_relative 'statement'

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

  def print_statement(statement_class: Statement)
    statement = statement_class.new(@transaction_history)
    statement.print
  end

  private

  def create_credit(amount)
    @transaction.new(credit: amount, balance: @balance, date: create_date)
  end

  def create_debit(amount)
    @transaction.new(debit: amount, balance: @balance, date: create_date)
  end

  def create_date
    Time.now.strftime('%d/%m/%Y')
  end
end
