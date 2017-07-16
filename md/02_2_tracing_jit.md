---

# Phases: Compilation (code generation)

generate efficient machine code using a trace

---

# Phases: Running (code execution)

execute machine codes made at compilation phases

---

# Devices: Gurad

--

## Role

- ensure correctness in progress

- a guard failing, *fall back to* **interpretation phase**

--

## Usecase

- places guard at every possible point where the path could go another direction

---

# Devices: Position Key

--

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
