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

  1. Tracing JIT Compiler

  1. Tracing the Meta-Level

  1. Evaluation

  1. Conclutsion

1. My Future Work

---
class: center, middle, inverse

# Introduction

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

# Introduction: Interpreter and Just-In-Time Compiler

## Implementation

--
- .green[Easy]: interpreter

  - straightforward techniques

- .red[Hard]: just-in-time compiler

  - complicated techniques

--

## PyPy: Solve the implementation problem

- Aim to be the __environment__ for writing _flexible implementations_ of dynamic languages

---
class: middle, center, inverse
# Demo for the PyPy
