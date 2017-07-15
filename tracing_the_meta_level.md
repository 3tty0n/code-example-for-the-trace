class: center, middle, inverse

# Tracing the .red[Meta-Level]

---
# Example: A Interpreter implementation

--

.pull-left[

A interpreter

```python
def interpret(bytecode, a):
    regs = [0] * 256
    pc = 0
    while True:
        opcode = ord(bytecode[pc])
        pc += 1
        if opcode == JUMP_IF_A:
            target = ord(bytecode[pc])
            pc += 1
            if a:
                pc = target
        elif opcode == MOV_A_R:
            n = ord(bytecode[pc])
            pc += 1

        [...]

        elif opcode == DECR_A:
            a -= 1
        elif opcode == RETURN_A:
            return a
```
]

--

.pull-right[
Trace when executing the `DECR_A` opcode
```python
loop_start(a0, regs0, bytecode0, pc0)
opcode0 = strgetitem(bytecode0, pc0)
pc1 = int_add(pc0, Const(1))
guard_value(opcode0, Const(7))
a1 = int_sub(a0, Const(1))
jump(a1, regs0, bytecode0, pc1)
```
]

---
# Evaluation of previous example

--

## Problem:

.center[useful _only when_ executing a long series of `DECR_A` opcodes.]

--

## Solution:

.center[do not trace the single opcode, but a **series of several opcodes**.]


---

# Improved Implementation

--

```python
tlrjitdriver = JitDriver(greens = [’pc’, ’bytecode’],
                         reds   = [’a’, ’regs’])

def interpret(bytecode, a):
    regs = [0] * 256
    pc = 0
    while True:
        tlrjitdriver.jit_merge_point(
            bytecode=bytecode, pc=pc,
            a=a, regs=regs)
        opcode = ord(bytecode[pc])
        pc += 1
        if opcode == JUMP_IF_A:
            target = ord(bytecode[pc])
            pc += 1
            if a:
                if target < pc:
                    tlrjitdriver.can_enter_jit(
                        bytecode=bytecode, pc=target,
                        a=a, regs=regs)
                pc = target
        elif opcode == MOV_A_R:
            ... # rest unmodified
```

---

# Improved Implementation

```python
*tlrjitdriver = JitDriver(greens = [’pc’, ’bytecode’],
*                        reds   = [’a’, ’regs’])

def interpret(bytecode, a):
    regs = [0] * 256
    pc = 0
    while True:
*       tlrjitdriver.jit_merge_point(
*           bytecode=bytecode, pc=pc,
*           a=a, regs=regs)
        opcode = ord(bytecode[pc])
        pc += 1
        if opcode == JUMP_IF_A:
            target = ord(bytecode[pc])
            pc += 1
            if a:
                if target < pc:
*                   tlrjitdriver.can_enter_jit(
*                       bytecode=bytecode, pc=target,
*                       a=a, regs=regs)
                pc = target
        elif opcode == MOV_A_R:
            ... # rest unmodified
```

---

# Improved point

--

## Adding hints

- `JitDriver(greends = [...], reds = [...])`

- `jit_merge_point`

- `can_enter_jit`

--

## Why

to use when doing profiling to decide when to start tracing

---

# Hint: JitDriver

--

## greens

-  program counter of the language interpreter
  - in that case: `bytecode` and `pc`

--

## reds

- all other variables that added to `JitDriver` as argument
  - in that case: `a` and `regs`

---

# Hint: jit_merge_point

put at the beginning of bitecode dispatch loop.

--

## In order to

- trace not a single opcode, but a series of several opcodes.

- JIT can detect the head of the bytecode dispatch loop.

---

# Hint: can_enter_jit


needs to be called at the end of any instruction that __program counter__ to an __earlier value__

--

## In order to


- to check for a __closing loop__

- JIT can detect the backward jump

--

## Because

- if it is closing loop, program counter (`green`) variables are the same several times

---

# Example for the fixed interpreter

---

.left-column[
## Example for the fixed interpreter
### - fixed interp.
]

.right-column[

### Repeated

```python
tlrjitdriver = JitDriver(greens = [’pc’, ’bytecode’],
                         reds   = [’a’, ’regs’])

def interpret(bytecode, a):
    regs = [0] * 256
    pc = 0
    while True:
        tlrjitdriver.jit_merge_point(
            bytecode=bytecode, pc=pc,
            a=a, regs=regs)
        opcode = ord(bytecode[pc])
        pc += 1
        if opcode == JUMP_IF_A:
            target = ord(bytecode[pc])
            pc += 1
            if a:
                if target < pc:
                    tlrjitdriver.can_enter_jit(
                        bytecode=bytecode, pc=target,
                        a=a, regs=regs)
                pc = target
        elif opcode == MOV_A_R:
            ... # rest unmodified
```
]
---

.left-column[
## Example for the fixed interpreter
### - fixed interp.
### - input bytecode
]

.right-column[
### Compute the square of the accumulator

```avrasm
MOV_A_R     0   # i = a
MOV_A_R     1   # copy of `a`

# 4:
MOV_R_A     0   # i--
DECR_A

MOV_A_R     0   # res += a
MOV_R_A     2
ADD_R_TO_A  1
MOV_A_R     2

MOV_R_A     0   # if i !=0: goto 4
JUMP_IF_A   4

MOV_R_A     2   # return res
RETURN_A
```
]

---

.left-column[
## Example for the fixed interpreter
### - fixed interp.
### - input bytecode
### - result
]

.right-column[
### Example trace

```python
loop_start(a0, regs0, bytecode0, pc0)
# MOV_R_A 0
opcode0 = strgetitem(bytecode0, pc0)
pc1 = int_add(pc0, Const(1))
guard_value(opcode0, Const(2))
n1 = strgetitem(bytecode0, pc1)
pc2 = int_add(pc1, Const(1))
a1 = call(Const(<* fn list_getitem>), regs0, n1)
# DECR_A
opcode1 = strgetitem(bytecode0, pc2)
pc3 = int_add(pc2, Const(1))
guard_value(opcode1, Const(7))
a2 = int_sub(a1, Const(1))
[...]
opcode5 = strgetitem(bytecode0, pc11)
pc12 = int_add(pc11, Const(1))
guard_value(opcode5, Const(2))
n6 = strgetitem(bytecode0, pc12)
pc13 = int_add(pc12, Const(1))
a5 = call(Const(<* fn list_getitem>), regs0, n6)
# JUMP_IF_A 4
opcode6 = strgetitem(bytecode0, pc13)
pc14 = int_add(pc13, Const(1))
guard_value(opcode6, Const(3))
target0 = strgetitem(bytecode0, pc14)
pc15 = int_add(pc14, Const(1))
i1 = int_is_true(a5)
guard_true(i1)
jump(a5, regs0, bytecode0, target0)
```
]

---

# Improve the Result

--

## What points to look at?

- remove operations

- constant folding immutable values

---

# Remove operations

--

## Example


```python
loop_start(a0, regs0, bytecode0, pc0)
# MOV_R_A 0
*opcode0 = strgetitem(bytecode0, pc0)
pc1 = int_add(pc0, Const(1))
*guard_value(opcode0, Const(2))
n1 = strgetitem(bytecode0, pc1)
pc2 = int_add(pc1, Const(1))
a1 = call(Const(<* fn list_getitem>), regs0, n1)
```

--

## Insight


- most of its operations are not actually doing any computaion

	- i.e.) they manipulate the datastructure of the data structure of the language interpreter

- they can be removed


---


# Constant folding immutable values

--

## Example


```python
loop_start(a0, regs0, bytecode0, pc0)
# MOV_R_A 0
opcode0 = strgetitem(bytecode0, pc0)
*pc1 = int_add(pc0, Const(1))
guard_value(opcode0, Const(2))
*n1 = strgetitem(bytecode0, pc1)
*pc2 = int_add(pc1, Const(1))
*a1 = call(Const(<* fn list_getitem>), regs0, n1)
```

--

## Insight


- most of the operations are manipulating the bytecoce string and the program counter
  - program counter (`int`): fixed value
  - bytecode (`string`): immutable in RPython
- they can be __constant-folded__

---

# Optimized Result

--

.semi-left[
```python
# MOV_R_A 0
a1 = call(Const(<* fn list_getitem>), regs0, Const(0))
# DECR_A
a2 = int_sub(a1, Const(1))
# MOV_A_R 0
call(Const(<* fn list_setitem>), regs0, Const(0), a2)
# MOV_R_A 2
a3 = call(Const(<* fn list_getitem>), regs0, Const(2))
# ADD_R_TO_A  1
i0 = call(Const(<* fn list_getitem>), regs0, Const(1))
a4 = int_add(a3, i0)
# MOV_A_R 2
call(Const(<* fn list_setitem>), regs0, Const(2), a4)
# MOV_R_A 0
a5 = call(Const(<* fn list_getitem>), regs0, Const(0))
# JUMP_IF_A 4
i1 = int_is_true(a5)
guard_true(i1)
jump(a5, regs0)
```
<!-- </code></pre> -->
]

--

.semi-right[
```avrasm
MOV_A_R     0
MOV_A_R     1

# 4:
MOV_R_A     0
DECR_A

MOV_A_R     0
MOV_R_A     2
ADD_R_TO_A  1
MOV_A_R     2

MOV_R_A     0
JUMP_IF_A   4

MOV_R_A     2
RETURN_A
```
]

--


.center[Very similar to the original bytecode]

???

- 以上の最適化技術を施すと、次のようなトレースを生成することが出来ます
- 命令の列が以前より大幅に減りました。これによって命令の数が減るので、以前のものより実行速度が早くなると考えられます
- このトレース、非常に元のバイトコードに似ていませんか？
- これは偶然ではなく、最適化の過程で無駄な計算の枝葉を取っていったので、なるべくしてなったのです

---
# Evaluation

--

## hardware
- 1.4 GHz Pentium M processor
- 1 GB RAM
- Linux 2.6.27

## Trying number
- all benchmarks are repeated 50 times

---

.left-column[
## Timings of the example interpreter
]

---

.left-column[
## Timings of the example interpreter
### - condition
]

.right-column[
- using square function
  ```assembler
  MOV_A_R     1   # copy of `a`

  # 4:
  MOV_R_A     0   # i--
  DECR_A
  MOV_A_R     0

  MOV_R_A     2   # res += a
  ADD_R_TO_A  1
  MOV_A_R     2

  MOV_R_A     0
  JUMP_IF_A   4

  MOV_R_A     2   # return res
  RETURN_A
  ```
- 10000000 times repeated
- first run is ignored: optimization are enabled after second run

]

---

.left-column[
## Timings of the example interpreter
### - condition
### - target
]

.right-column[
1. translated to C .red[without] including a JIT compiler

1. tracing JIT is .green[enabled], but .red[no hints] are applied

1. trajing JIT is enabled, hints are .green[applied], but constant folding is .red[disabled]

1. tracing JIT is enabled, hints are applied, constant fonling is .green[enabled] (.blue[full optimization])

1. same as 4, but trace is .red[never] invoked
]

---
.left-column[
## Timings of the example interpreter
### - condition
### - target
### - result
]

.right-column[
## Result for the example intepreter computations

<img src="./assets/img/benchmark1.png" width=500/>
]
---

.left-column[
## Compare PyPy and CPython
### - target and condition
]

.right-column[
## Target
1. PyPy compiled to C, no Jit

1. PyPy compliled to C, with JIT

1. CPython 2.5.2

1. CPython 2.5.2 + Psyco 1.6

## Condition
- executing following function, f(10000000)

  ```python
  def f(a):
      t = (1, 2, 3)
  i=0
  while i < a:
          t = (t[1], t[2], t[0])
          i += t[0]
      return
  ```
]

---
.left-column[
## Compare PyPy and CPython
### - target and condition
### - result
]

.right-column[

## Result for the PyPy and CPython
<img src="./assets/img/benchmark2.png" width=500 />
]

---
class: center, middle, inverse
name: conclusion

# Conclusion
---

## Spped up

--

- improving the results when applying a tracint JIT to an interpreter

## Many application

--

- SPy-VM: a Samlltalk implementation
- a Prolog interpreter
- PyGirl: a Gameboy emulator
- and so on.

they are written in RPython
