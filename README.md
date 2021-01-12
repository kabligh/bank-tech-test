# Bank tech test

Practice tech test, week 10 of Makers bootcamp. [Full instructions here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

## Tech used

Ruby, RSpec, Rubocop, Simple Coverage

Program fully tested, with 100% coverage.

## Quick launch
```
$ git clone https://github.com/kabligh/bank-tech-test.git
$ cd bank-tech-test
$ bundle
$ irb
$ require './lib/account.rb'
```

### Example usage

```
# Create an account
> account = Account.new

# Check balance
> account.balance
=> 0

# Try to withdraw money (before depositing)
> account.withdraw(10)
=> RuntimeError (Not enough funds)

# Deposit money
> account.deposit(100)

# Print bank statement
> account.print_statement
date || credit || debit || balance
12/01/2021 || 100.00 ||  || 100.00
```

## Process

* Broke the task down into two main classes, Account and Transaction
* Visualised how they would interact with class diagrams
* Used TDD, starting with the most simple test cases
