class: center, middle, inverse

# Tracing the Meta-Level: PyPy's JIT compiler

## Yusuke Izawa
### Hidehiko Masuhara lab.

2017-07-21
---
class: middlle
# Overview

--
1. introduce the paper

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

# Introduction: Speed on Run-Time

--

- .green[Fast]: Statically Typed Languages

- .red[Slow]: Dynamic Languages

--

##### Example benchmark: Mandelbrot description

.center[
<img src="./assets/img/speed.png" width=500/>
]

.footnote[http://benchmarksgame.alioth.debian.org/u64q/mandelbrot.html]

---

# Introduction: Interpreter and Just-In-Time Compiler

## Implementation

--
- .green[Easy]: interpreter

  - straightforward

--
- .red[Hard]: just-in-time compiler

  - complicated techniques

---

# Introduction: What is PyPy?

--

## Solve the implementation problem

- Aim to be the __environment__ for writing _flexible implementations_ of dynamic languages

--

## Solve the speed promblem

- Get better the performance with Tracing JIT compiler

---
class: center, middle, inverse

# Demo for the PyPy
