# sma-examples

This is an Iceberg repo for Pharo 6.1 containing demo examples for the Software Modeling and Analysis course: <http://scg.unibe.ch/teaching/sma>

This repo resides on github: <https://github.com/onierstrasz/sma-examples>

This repo contains several packages of demo code, plus a class `SMA` with several class-side methods that each generates a Playground with code snippets.

## Smalltalk: A Reflective Language and System

In this lecture we introduce Pharo Smalltalk using a CallGraph example.
The folder CallGraphDemo contains a series of fileouts containing 5 successive versions of code to parse a callgraph dump from Javassist, and to model the call graph as Smalltalk objects.

The completed project is in the package `SMA-CallGraph`.

Load:

```
Metacello new
   baseline: 'SMACallGraph';
   repository: 'github://onierstrasz/sma-examples/src';
   load
```

To generate the Playground run:

`SMA callGraph.`

## Understanding Classes and Metaclasses

This lecture illustrates the Smalltalk object model using an example of a Snakes and Ladders game.

Load:

```
Metacello new
   baseline: 'SMASnakesAndLadders';
   repository: 'github://onierstrasz/sma-examples/src';
   load
```

and run `SMA metaclassDemo` to obtain the snippet Playground.

## Reflection and Metaprogramming

This lecture illustrates reflective features of Smalltalk.
The demos are in the package `SMA-Reflection`.
Load:

```
Metacello new
   baseline: 'SMAReflection';
   repository: 'github://onierstrasz/sma-examples/src';
   load
```

Run `SMA reflectionDemo` to obtain the snippets.

