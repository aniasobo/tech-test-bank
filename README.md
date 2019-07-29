# Bank tech test

## Functionality

- REPL app but no need for a command line interface
- bank takes deposits
- bank withdraws money
- bank prints account statements with date, amount, balance on it
- no need for a database but should keep data in memory

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


### Initial planning:

Bank - single class
Basic functionality - Bank is launched in an empty state, prints out an empty dated statement
Creating a Date helper to use in both tests and code
Test for the date helper
Statement method - returns from other methods: adds header, history formatted
simple methods first going by the scenario from spec: deposit, withdrawal
