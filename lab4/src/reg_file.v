`timescale 1ns / 1ps
// <your student id>

/* checkout FIGURE 4.7 */
module reg_file (
    input         clk,          // clock
    input         rstn,         // negative reset
    input  [ 4:0] read_reg_1,   // Read Register 1 (address)
    input  [ 4:0] read_reg_2,   // Read Register 2 (address)
    input         reg_write,    // RegWrite: write data when posedge clk
    input  [ 4:0] write_reg,    // Write Register (address)
    input  [31:0] write_data,   // Write Data
    output [31:0] read_data_1,  // Read Data 1
    output [31:0] read_data_2   // Read Data 2
);

    /* [step 1] How many bits per register? How many registers does MIPS have? */
    reg [31:0] registers[0:31];  // do not change its name
    /* [step 2] Read Registers */
    /* Remember to check whether register number is zero */
    assign read_data_1 = (read_reg_1 == 5'b00000) ? 32'h00000000 : registers[read_reg_1];
    assign read_data_2 = (read_reg_2 == 5'b00000) ? 32'h00000000 : registers[read_reg_2];

    /** Sequential Logic
     * `posedge clk` means that this block will execute when clk changes from 0 to 1 (positive edge trigger).
     * `negedge rstn` vice versa.
     * https://www.chipverify.com/verilog/verilog-always-block
     */
    /* [step 3] Write Registers */
    always @(posedge clk)
        if (rstn) begin  // make sure to check reset!
            if (reg_write) begin
                registers[write_reg] <= write_data;
            end
        end

    /* [step 4] Reset Registers (wordy in Verilog, how about System Verilog?) */
    always @(negedge rstn) begin
        registers[0] <= 32'b0;
        registers[1] <= 32'b0;
        registers[2] <= 32'b0;
        registers[3] <= 32'b0;
        registers[4] <= 32'b0;
        registers[5] <= 32'b0;
        registers[6] <= 32'b0;
        registers[7] <= 32'b0;
        registers[8] <= 32'b0;
        registers[9] <= 32'b0;
        registers[10] <= 32'b0;
        registers[11] <= 32'b0;
        registers[12] <= 32'b0;
        registers[13] <= 32'b0;
        registers[14] <= 32'b0;
        registers[15] <= 32'b0;
        registers[16] <= 32'b0;
        registers[17] <= 32'b0;
        registers[18] <= 32'b0;
        registers[19] <= 32'b0;
        registers[20] <= 32'b0;
        registers[21] <= 32'b0;
        registers[22] <= 32'b0;
        registers[23] <= 32'b0;
        registers[24] <= 32'b0;
        registers[25] <= 32'b0;
        registers[26] <= 32'b0;
        registers[27] <= 32'b0;
        registers[28] <= 32'b0;
        registers[29] <= 32'b0;
        registers[30] <= 32'b0;
        registers[31] <= 32'b0;
    end
endmodule
