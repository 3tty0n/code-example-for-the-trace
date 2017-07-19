---

# Phases: Compilation (code generation)

- turn a trace into efficient machine code

## generated machine code

- immediately execuatble

  - uses in the next iteration loop

---

# Phases: Running (code execution)

execute machine codes made at compilation phases

## Guard:

  - **quick checker** guaranteeing that the path we are execution is **still valid**

  - If guard fails, fall back to _interpretation_
