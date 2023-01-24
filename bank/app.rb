require_relative './lib/account'
require_relative './lib/transaction'
require_relative './lib/statement'
require 'date'

# Create an instance of account class
account = Account.new

# Create some transaction instances and add them to the account
transaction1 = Transaction.new(1000, DateTime)
account.add_transaction(transaction1)
transaction2 = Transaction.new(2000, DateTime)
account.add_transaction(transaction2)
transaction3 = Transaction.new(-500, DateTime)
account.add_transaction(transaction3)

# Create an instance of the statement class, initialized with the account
statement = Statement.new(account)

# Print the statement to the console
puts statement.print_statement