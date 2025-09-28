# Lab 1: 32-bit ALU & Register File

## Tasks Overview
- Implement a **32-bit ALU** with basic operations:
  - AND, OR, ADD, SUB, NOR, SLT
  - Support **zero flag** and **overflow detection**
- Build supporting modules:
  - `bit_alu.v` (1-bit ALU)
  - `msb_bit_alu.v` (1-bit ALU for MSB)
  - `alu.v` (32-bit ALU integration)
- Implement a **Register File**:
  - Two read ports, one write port
  - Write on `posedge clk` with `reg_write`
  - Reset clears all registers
- Verify functionality:
  - Run provided testbenches (`tb_alu.sv`, `tb_reg_file.sv`)
  - Capture waveform results
- Write report:
  - Diagrams of ALU architecture
  - Explanation of overflow and ALU control signals
  - Test results and observations
