---
class: center, middle, inverse

# Evaluation

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

|     | JIT  |  hints | constant-folding | trace overhead |
|:----|:----:|:------:|:----------------:|---------------:|
|  1  |  ☓   | ☓      |       ☓          |        ☓       |
|  2  |  ○   | ☓      |       ☓          |        ☓       |
|  3  |  ○   | ○      |       ☓          |        ☓       |
|  4  |  ○   | ○      |       ○          |        ○       |
|  5  |  ○   | ○      |       ○          |        ○       |
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
