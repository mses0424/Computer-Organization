# Lab 2: Single-Cycle Processor

## Tasks Overview
- Implement a **Single-Cycle Processor** that executes one instruction per clock cycle.
- Reuse ALU and Register File from Lab 1.
- Add control logic:
  - `alu_control.v`
  - `control.v`
- Implement instruction/data memories:
  - `instr_mem.v`
  - `data_mem.v`
- Build the main processor module:
  - `single_cycle.v`

---

## Instruction Support
- **Arithmetic Instructions & NOP**: add, sub, and, or, slt, nop
- **Load & Store**: lw, sw
- **Branch**: beq
- **Jump**: j
- **Load Immediate**: li (via lui + ori)

---

## Verification
- Test with provided testbench `tb_single_cycle.sv` and assembly program `0.s`
- Use **JsSpim** simulator to check instruction behavior
- Convert `.txt` results into `.mem` format using `format.py`

---

## Report
- Provide datapath and control diagrams
- Show test results (waveforms, cases tested)
- Answer questions on:
  - Timing of register/memory read/write
  - Translation of pseudo branch instructions
  - Infinite loop with `beq`
  - Extending jump range
  - Why single-cycle processors are not used today

---



