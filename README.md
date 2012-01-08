PriorityTest
============

## DESCRIPTION

PriorityTest is a gem that delivers fast feedback for your tests by
prioritizing them.
It prioritizes tests based on two assumptions discovered by [Kent Beck](https://twitter.com/#!/kentbeck) in his tool [JUnit Max](http://junitmax.com/):

> Test run times generally follow a power law distribution - lots of very short tests and a few very long ones. This means that by running the short tests first you can get most of the feedback in a fraction of the runtime of the whole suite.

> Failures are not randomly distributed. A test that failed recently is more likely to fail than one that has run correctly a bazillion times in a row. By putting recently failed (and newly written) tests first in the queue, you maximize the information density of that critical first second of feedback.

PriorityTest inherits from these two assumptions with a simple
algorithm and prioritizes your tests by looking at the test running history.

## ALGORITHM

PriorityTest captures and stores your test running hisotry.
Before each test runs, it looks back X number of the previous test results to calculate the test's Degree of Significant (DoS).
It then prioritizes the running order of all the tests based on each test's DoS.
Two factors determines a test's DoS: test run time and recent failure times.

## INSTALLATION

### RubyGems

    [sudo] gem install priority_test

### RSpec

In your ```Gemfile```, insert the following line:

```ruby
gem 'priority_test'
```

In ```spec_helper.rb```, require the RSpec adapter:

```ruby
require 'priority_test/rspec'
```

## USAGE

Getting help:

    $ pt -h
    Usage: pt <test-framework> [options] [files or directories]

    Test framework:
      * rspec

    Options:
            --priority                   Filter and run priority tests
        -h, --help                       Show help
        -v, --version                    Show version

Run tests in priority order:

    $ pt rspec spec/a_spec

Filter and run priority tests:

    $ pt rspec spec/a_spec --priority

Directly passing arguments to RSpec:

    $ pt rspec spec/a_spec --priority -fp

Run tests in a Rake task:

    $ rake spec PT_OPTS="--priority"

## LICENSE

See LICENSE
