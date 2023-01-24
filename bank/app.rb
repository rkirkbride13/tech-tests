require_relative './lib/bank'
require_relative './lib/transaction'
require 'date'

# Create a bank
bank = Bank.new

# Create some transactions and add them to the bank
transaction1 = Transaction.new(1000, DateTime.now)
bank.add_transaction(transaction1)
transaction2 = Transaction.new(2000, DateTime.now)
bank.add_transaction(transaction2)
transaction3 = Transaction.new(-500, DateTime.now)
bank.add_transaction(transaction3)

# Print the bank statement to the console
puts bank.print_statement
p "--------"
puts DateTime.now.strftime "%d/%m/%Y"
