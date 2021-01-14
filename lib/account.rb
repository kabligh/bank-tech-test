# frozen_string_literal: true

require 'time'
require_relative 'transaction'

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

  def print_statement
    puts(statement_header + list_transaction)
  end

  # private

  def create_credit(amount, date)
    @transaction.new(credit: amount, balance: @balance, date: create(date))
  end

  def create_debit(amount, date)
    @transaction.new(debit: amount, balance: @balance, date: create(date))
  end

  def create(date)
    date == nil ? Time.now.strftime('%d/%m/%Y') : Time.parse(date).strftime("%d/%m/%Y")
  end

  def statement_header
    "date || credit || debit || balance\n"
  end

  def list_transaction
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
