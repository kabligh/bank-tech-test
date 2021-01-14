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

  def deposit(amount, date = nil)
    @balance += amount
    @transaction_history << create_credit(amount, date)
  end

  def withdraw(amount, date = nil)
    raise 'Not enough funds' if amount > @balance
    @balance -= amount
    @transaction_history << create_debit(amount, date)
  end

  def print_statement(statement_class: Statement)
    statement = statement_class.new(@transaction_history)
    statement.print
  end

  private

  def create_credit(amount, date)
    @transaction.new(credit: amount, balance: @balance, date: create(date))
  end

  def create_debit(amount, date)
    @transaction.new(debit: amount, balance: @balance, date: create(date))
  end

  def create(date)
    date == nil ? Time.now.strftime('%d/%m/%Y') : Time.parse(date).strftime("%d/%m/%Y")
  end
end
