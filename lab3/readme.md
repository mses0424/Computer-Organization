# Lab 3: Pipelined Processor - Part 1

## Tasks Overview
- Implement a **Pipelined Processor** (no hazard detection, no stalling, no forwarding).
- Reuse modules from Lab 1 & Lab 2:
  - ALU (`alu.v`)
  - Register File (`reg_file.v`)
  - Control logic (`alu_control.v`, `control.v`)
  - Instruction & Data Memory (`instr_mem.v`, `data_mem.v`)
- Build the main processor module:
  - `pipelined.v`
- Implement pipeline registers across stages.

---

## Instruction Support
- **Arithmetic Instructions & NOP**: add, sub, and, or, slt, nop
- **Load & Store**: lw, sw
- **Branch**: beq
- **Add Immediate**: addi

---

## Verification
- Test with provided testbench `tb_pipelined.sv` and assembly programs (`.s` → `.mem` format).
- Use **JsSpim** to verify instruction execution flow.
- Ensure correct behavior with hazards (testbench will check, do NOT implement hazard handling).

---

## Report
- Provide architecture diagrams of pipelined datapath and controls.
- Show test results (waveforms, additional test cases).
- Answer conceptual questions:
  - When stalls are required / avoidable
  - Throughput vs latency
  - Pipeline efficiency discussions
  - Effects of allowing fewer pipeline stages
  - Longer pipelines and performance

---
