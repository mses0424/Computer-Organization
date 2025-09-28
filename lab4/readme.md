# Lab 4: Pipelined Processor - Part 2

## Tasks Overview
- Extend the pipelined processor from Lab 3 to handle **hazards**:
  - Implement **Forwarding Unit** (`forwarding.v`)
  - Implement **Hazard Detection Unit** (`hazard_detection.v`)
  - Modify `pipelined.v` to integrate hazard handling
- Support **branch with delay slot** execution
- Ensure correct execution with forwarding and necessary stalls

---

## Instruction Support
- **Arithmetic Instructions & NOP**: add, sub, and, or, slt, nop
- **Load & Store**: lw, sw
- **Branch**: beq (with delayed slot)
- **Add Immediate**: addi

---

## Hazard Handling
- Forwarding for ALU results to dependent instructions
- Stall insertion when forwarding is insufficient:
  - ALU → Branch dependency
  - Load → Use dependency
- Special handling for **branch hazards**:
  - Move branch decision and target calculation to ID stage
  - Forward required values for branch decision
  - Insert stalls when needed

---

## Verification
- Test with provided testbench `tb_pipelined.sv` and assembly programs
- Use **JsSPIM (Lab4 version)** to validate correct behavior (branch delay slot execution)
- Ensure your pipeline matches the expected outputs

---

## Report
- Show pipeline architecture with hazard handling units
- Provide waveform screenshots and test results
- Answer conceptual questions:
  - Equations for EX/MEM hazard detection
  - Forwarding requirements for branch decisions
  - Handling of stalls for load → branch cases
  - Removing unnecessary stalls (e.g., sw after lw)

---



