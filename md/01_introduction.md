class: center, middle, inverse

# Tracing the Meta-Level: PyPy's JIT compiler

## Yusuke Izawa
### Tokyo Institute of Technology
### Hidehiko Masuhara lab.

2017-07-21
---
class: middlle
# Overview

1. Introduce "Tracing the Meta-Level: PyPy's JIT compiler"

  1. Introduction

  1. PyPy's Tracing JIT Compiler

  1. Tracing the Meta-Level

  1. Evaluation

  1. Conclutsion

1. My Future Work

---
class: center, middle, inverse

# Introduction

---

# Introduction: What is PyPy?

## Compatibility

- highliy compatibility with CPython

## Environment

- writing flexible implementations of dynamic languages

  - enable developers to try experimental implementations

## RPython

- implementations are written in RPython

  - subset of Python that allows type inference

---

# Introduction: About the paper

- Tracing the Meta-Level: PyPy’s Tracing JIT Compiler

  - Carl Friedrich Bolz, Antonio Cuni, Maciej Fijalkowski, Armin Rigo

  - ICOOOLPS ‘09

---

# Introduction: Speed on Run-Time

--

- .green[Fast]: Statically Typed Languages

- .red[Slow]: Dynamic Languages

##### Example benchmark:  [Drawing Mandelbrot](http://benchmarksgame.alioth.debian.org/u64q/mandelbrot.html)

.center[
<img src="./assets/img/speed.png" width=400/>
]

--

## PyPy: Solve the speed promblem

- Get better the performance with Tracing JIT compiler *

<sup>.red.bold[*] Main point in this seminar</sup>

---

# Introduction: Interpreter and JIT

--

## Implementation

- .green[Easy]: interpreter for dynamic languages

  - straightforward, without advanced techniques like JIT

- .red[Hard]: just-in-time compiler for dynamic languages

  - advanced, but complicated techniques

--

## PyPy: Solve the implementation problem

- ease the implementation of dynamic languages

  - with advanced techniques

- writing tracing JIT

<!-- ---
class: middle, center, inverse
# Demo for the PyPy
-->
