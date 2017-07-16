---
class: center, middle, inverse

# Tracing JIT Compiler
---

# Background: Assumptions of Tracing JIT Compiler

--
## Assumptions

- programs spend most of their runtime in loops

- several iterations of the same loop are likely to take similar code paths

---
# Internal Techniques: Tracing JIT Compiler

Tracing JIT techniques is built on above assumptions.

--

## Phases
- Interpretation / Profiling
- Tracing
- Compilation
- Running

--

## Devises

- Guards
- Position key

---

# Overview: Tracing JIT Compiler
.center[
<img src="./assets/img/tracingjit_diagram.png" height=500/>
]

---
# Phases: Interpretation / Profiling

- when the program starts, everything is interpreted

--
-  do profiling

  - counts how often the *backwark jump** is executed

  - too many jumps → .red[Hot Loop]

.footnote[.red.bold[*] jump to the previous instruction]

---
# Phases: Tracing

## Conditions for Entering

- when .red[Hot Loop] is identified

--

## Subject doing tracing

- Tracer

--

## During

- records a history of all the executed oprations*

.footnote[.red.bold[*] name: Trace]
