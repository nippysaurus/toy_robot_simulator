# Toy Robot Simulator

## running tests

Use bundler to install required gems (just rspec for testing).

```
bundle
```

Then run `rspec` to run all tests.

```
............................

Finished in 0.00618 seconds (files took 0.1036 seconds to load)
28 examples, 0 failures
```

## installation

First build the gem

```
gem build toy_robot_simulator.gemspec
```

Next install the gem

```
gem install toy_robot_simulator-0.0.0.gem
```

The gem should now be installed, and the `toy_robot_simulator` command should be available.

## usage

The `toy_robot_simulator` command will be availabel if you have installed the gem. It reads instructions from STDIN.

I have included some examples in the `example` directory.

This is how (for example) you would run example "a":

```
cat examples/example_a | toy_robot_simulator
```
