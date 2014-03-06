# projecteuler - This fellow's solutions to Project Euler problems

Also see [euler: HARD MODE](https://github.com/mcandre/euler-hard-mode).

# HOMEPAGE

http://projecteuler.net/

# EXAMPLE

    $ runhaskell problem1.hs

# REQUIREMENTS

* [Haskell](http://www.haskell.org)

## Optional

* [Ruby](http://www.ruby-lang.org) 1.9+
* [Guard](http://guardgem.org/) 1.8.2+
* [aspelllint](https://github.com/mcandre/aspelllint)

Install Guard and aspelllint:

    $ bundle

# DEVELOPMENT

## Linting

Keep the code tidy:

    $ make lint

## Spell Check

    $ aspelllint
    ...

## Local CI

Test solutions as you make code changes:

    $ make guard
    > ...
