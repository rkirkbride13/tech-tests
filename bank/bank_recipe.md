# Bank Class Design Recipe

## 1. Describe the Problem

-As a customer
-So that I can save money
-I would like to deposit money in the bank.

-As a customer
-So that I can spend money
-I would like to be able to 
withdraw money from the bank

-As a customer
-So that I can know my incoming/outgoings
-I would like to print a dated bank statement.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class Bank
  def initialize
    # initialize with an empty array called statement
    # initialize with a bank balance variable that is 0
  end

  def check_balance
    # gets current account balance
  end

  def deposit_money(funds, date) # funds is a float, date is a date
    # No return value
    # adds to bank balance
    # pushes transaction into a hash with the date || credit || debit || balance
  end

  def withdraw_money(funds, date) # funds is a float, date is a date
    # No return value
    # subtracts from bank balance
    # pushes transaction into a hash with the date || credit || debit || balance
  end

  def print_statement
    # Returns a list with dated transactions
  end

end
```

## 3. Create Examples as Tests

```ruby
# EXAMPLE

# 1
bank = Bank.new
expect(bank.check_balance).to eq 0.00

# 2
bank = Bank.new
bank.deposit_money(1, "01/01/2023")
expect(bank.print_statement).to eq "01/01/2023 || 1.00 || || 1.00"

# 3
bank = Bank.new
bank.withdraw_money(1, "01/01/2023")
expect(bank.print_statement).to eq "01/01/2023 || || 1.00 || -1.00"

# 4
bank = Bank.new
bank.deposit_money(1, "01/01/2023")
bank.withdraw_money(1, "02/01/2023")
expect(bank.print_statement).to eq "01/01/2023 || 1.00 || || 1.00, 02/01/2023 || || 1.00 || 0.00"

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
