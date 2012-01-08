PriorityTest
============

# DESCRIPTION

PriorityTest is gem that delivers fast feedback for your tests by
prioritizing them.
It prioritizes tests based on two assumptions discovered by [Kent Beck](https://twitter.com/#!/kentbeck) in his tool [JUnit Max](http://junitmax.com/):

> Test run times generally follow a power law distribution - lots of very short tests and a few very long ones. This means that by running the short tests first you can get most of the feedback in a fraction of the runtime of the whole suite.

> Failures are not randomly distributed. A test that failed recently is more likely to fail than one that has run correctly a bazillion times in a row. By putting recently failed (and newly written) tests first in the queue, you maximize the information density of that critical first second of feedback.

PriorityTest inherits from these two assumptions and implements a simple
algorithm by looking at your test running history.

# ALGORITHM

First of all, PriorityTest captures and stores your test running
hisotry.
Before each test runs, it looks back X number of the previous test results and determites whether the test is significant.
It then prioritizes the test run order based on this significant.
Two factors determines the degree of significant for a test: test run times and recent failure times.

# INSTALLATION

    gem install priority_test

## RSpec

In spec_helper.rb, insert the following line:

```ruby
require 'priority_test/rspec'
```

# USAGE

Getting help:

```bash
$ pt -h
Usage: pt <test-framework> [options] [files or directories]

Test framework:
  * rspec

Options:
        --priority                   Filter and run priority tests
    -h, --help                       Show help
    -v, --version                    Show version
```

Runn tests in priority order:
```bash
$ pt rspec spec/a_spec
```

Filter and run only priority tests:
```bash
$ pt rspec spec/a_spec --priority
```

Passing arguments to RSpec:
```bash
$ pt rspec spec/a_spec --priority -fp
```
