# Wandering IoT

[![Build Status](https://travis-ci.org/devstopfix/iot-wander.svg?branch=master)](https://travis-ci.org/devstopfix/iot-wander)

A web service for the reliable consumption of large volumes of [time series](https://en.wikipedia.org/wiki/Time_series) data generated by [IoT](https://en.wikipedia.org/wiki/Internet_of_Things) devices.

## Rationale

My first Elixir project! An experiment building an IoT solution using [Elixir](http://elixir-lang.org/), the [Actor model](https://en.wikipedia.org/wiki/Actor_model), and the [Erlang](http://www.erlang.org) VM.

## Goals

* Learn Elixir
* Plot how many actors can run in a single VM against throughput rates

# Project

## Install Elixir on OS X

Using [Homebrew](http://brew.sh):

    brew update
    brew install elixir

## Build

To build an Elixir project:

    mix deps.get
    mix compile

## Test

To run the tests:

    mix test

To run a single test at line 41:

    mix test test/mac_test.exs:41

## Dev

To start an interactive shell and run the web server:

    iex -S mix

        c "lib/wander_plug.ex"

        {:ok, _} = Plug.Adapters.Cowboy.http WanderPlug, []

To test the API:

    curl -v http://localhost:4000/

## Documentation

See this [README](README.md) and the [docs](doc/index.html).

To generate the HTML documentation from the source code:

    mix docs
    open doc/index.html

# API

The web service provides a RESTful API over HTTPS. 

## Resources

The API provides this resource:

* `/hub/{MAC}` - the endpoint to which a HUB can POST it's data

## Status codes

* 202 Accepted - your request has been received and stored for processing
* 400 Bad Request - your request was to a bad resource URL, or the content was invalid (e.g. invalid JSON)
* 404 Not Found - your resource structure is valid but does not exist (e.g. unknown MAC address)
* 405 Method Not Allowed - e.g. you are trying to GET a resource that only allows POST. See the resource definitions above

# Libraries used

* [ExCheck](https://github.com/parroty/excheck) - property based testing
* [Cowboy](https://github.com/ninenines/cowboy) - the de facto HTTP server for Erlang
* [Plug](https://github.com/elixir-lang/plug) - an Elixir library to build web applicationds

# Credits

* [Travis CI](https://docs.travis-ci.com/user/languages/elixir/)
