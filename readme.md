
## Lab 1: 32-bit ALU & Register File
- Implemented **32-bit ALU**:
  - Operations: AND, OR, ADD, SUB, NOR, SLT
  - Zero and overflow detection
- Built **supporting modules**: `bit_alu.v`, `msb_bit_alu.v`, `alu.v`
- Implemented **Register File** with two read ports, one write port, and reset

---

## Lab 2: Single-Cycle Processor
- Constructed **Single-Cycle Processor**
- Reused ALU & Register File from Lab1
- Added **control logic**: `alu_control.v`, `control.v`
- Implemented **instruction memory** and **data memory**
- Supported instructions:
  - Arithmetic: add, sub, and, or, slt, nop
  - Memory: lw, sw
  - Branch: beq
  - Jump: j
  - Load Immediate: li (via lui + ori)

---

## Lab 3: Pipelined Processor - Part 1
- Extended single-cycle design into a **5-stage pipelined processor**
- Built `pipelined.v` with pipeline registers
- Reused modules from Lab1 & Lab2
- Supported instructions:
  - Arithmetic & NOP: add, sub, and, or, slt, nop
  - Memory: lw, sw
  - Branch: beq
  - Immediate: addi

---

## Lab 4: Pipelined Processor - Part 2 (Hazard Handling)
- Enhanced pipeline with **hazard handling**
- Implemented:
  - `forwarding.v` (Forwarding Unit)
  - `hazard_detection.v` (Hazard Detection Unit)
- Modified `pipelined.v` to integrate hazard handling
- Added **forwarding** and **stalling** mechanisms
- Supported **branch with delay slot** execution
- Completed pipeline supporting:
  - add, sub, and, or, slt, nop
  - lw, sw
  - beq (with delayed slot)
  - addi

---
