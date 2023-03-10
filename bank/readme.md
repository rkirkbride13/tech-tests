# Bank tech test

This is my attempt at a bank tech test. Transaction class instances (deposits / withdrawals) can be created and added to a Bank class, which can calculate the balance and print a statement.
It is written using Ruby and test-driven with the RSpec framework

**To run this code locally:**  

    $ git clone git@github.com:[USERNAME]/tech-test.git
    $ cd bank
    $ gem install bundler
    $ bundle install
    $ ruby app.rb
    
**To run the test suite**

    $ git clone git@github.com:[USERNAME]/tech-test.git
    $ cd bank
    $ gem install bundler
    $ bundle install
    $ rspec

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Approach

I initially modelled this as a single class (Bank class) program in which a depost / withdrawal could be made, before then splitting it into two classes (Bank and Transaction classes). This was because I wanted to seperate the responsibility of the transactions from the bank, which should simply handles transactions by taking instances of them.

I test drove the single class first, starting simple with single deposits or withdrawals, before adding multiple depsoits or withdrawals and finally multiple deposits and withdrawals. Once the logic was test-driven, I test-drove the formatting in a similar way.

I then added in unit tests so that I could be satisfied my classes were working independently of one another
