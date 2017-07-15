class: center, middle, inverse
name: title

# Code Example for the Trace

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]

--

.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]

.pull-right[
```python
# corresponding trace:
* loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
* i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
* i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
* guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
* result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
* n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
* i2 = int_ge(n1, Const(0))
  guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
* guard_true(i2)
  jump(result1, n1)
```
]

---

# A Python Code and the Recorded Trace

.pull-left[
```python
def f(a, b):
    if b % 46 == 41:
        return a - b
    else:
        return a + b
def strange_sum(n):
    result = 0
    while n >= 0:
        result = f(result, n)
        n -= 1
    return result
```
]


.pull-right[
```python
# corresponding trace:
  loop_header(result0, n0)
  i0 = int_mod(n0, Const(46))
  i1 = int_eq(i0, Const(41))
  guard_false(i1)
  result1 = int_add(result0, n0)
  n1 = int_sub(n0, Const(1))
  i2 = int_ge(n1, Const(0))
  guard_true(i2)
* jump(result1, n1)
```
]
