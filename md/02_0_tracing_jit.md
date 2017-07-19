---
class: center, middle, inverse

# Tracing JIT Compiler
---

# Background: Assumptions of Tracing JIT Compiler

Tracing JIT techniques are built on following assumptions.

--
## Assumptions

- programs spend most of their runtime in loops

- several iterations of the same loop are likely to take similar code paths

---
# Overview: Tracing JIT Compiler

--

.pull-left[
## Phases
- Interpretation / Profiling

- Tracing

- Code generation

- Code execution

## Techniques for Tracing

- Gurad

- Position key
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

  - _Tracing mode_

--

## During

- records a history of all the executed oprations*, one iteration of the hot loop

.footnote[.red.bold[*] name: Trace]

---

# Techniques: Gurad

## Role

- ensure correctness in progress

- a guard failing, *fall back to* **interpretation phase**

--

## Usecase

- places guard at every possible point where the path could go another direction

---

# Techniques: Position Key

## Role

- recognizes the corresponding loop for a trace

- describes the position of the execution of the program

 - have executed functions and program counter

???

- Position Key の役割は trace における loop がどうなっているかという状態を認識すること
- 実行されるプログラムの position （位置）を把握
 - 位置とは今何ステップ目なのか、といったもの
- 実行された関数やプログラムカウンターをもっている

--

## Usecase
- check position key at backward branch instruction*

.footnote[.red.bold[*] to check the loop is closed]

???

- usecase としてはバックワードジャンプ（前方への命令へジャンプすること）がないか調べること
- これでループが閉じているか判断する
