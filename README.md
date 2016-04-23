# Wandering IoT

An example application that triagulates the positions of [IoT](https://en.wikipedia.org/wiki/Internet_of_Things) devices.

## Rationale

My first Elixir project! An experiment building an IoT solution using [Elixir](http://elixir-lang.org/), the [Actor model](https://en.wikipedia.org/wiki/Actor_model), and the [Erlang](http://www.erlang.org) VM.

## Goals

* Learn Elixir
* Plot how many actors can run in a single VM against throughput rates

# Build

To build an Elixir project:

    min compile

To run the tests:

    mix test

To run a single test at line 41:

    mix test test/mac_test.exs:41

To start an interactive shell:

    iex

# Libraries

* QuickCheck - https://github.com/parroty/excheck