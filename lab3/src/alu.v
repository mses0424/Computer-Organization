`timescale 1ns / 1ps
module alu (
    input  [31:0] a,        // 32 bits, source 1 (A)
    input  [31:0] b,        // 32 bits, source 2 (B)
    input  [ 3:0] ALU_ctl,  // 4 bits, ALU control input
    output [31:0] result,   // 32 bits, result
    output        zero,     // 1 bit, set to 1 when the output is 0
    output        overflow  // 1 bit, overflow
);
    wire a_invert, b_invert; 
    wire set;  
    wire [31:0] less, carry_in, carry_out;
    reg [1:0] operation;  
    
    assign a_invert = 0;
    assign b_invert = (ALU_ctl==4'b0110 || ALU_ctl==4'b0111);
    assign carry_in[0] = (ALU_ctl==4'b0110 || ALU_ctl==4'b0111);

    always @(*) begin
        case (ALU_ctl)
            4'b0000: operation = 2'b00;
            4'b0001: operation = 2'b01; 
            4'b0010: operation = 2'b10; 
            4'b0110: operation = 2'b10;  
            4'b1100: operation = 2'b01;  
            4'b0111: operation = 2'b11;  
            default: operation = 2'b00;  
        endcase
    end
    assign less[31:0] = 0;
    wire [31:0] result1;
    bit_alu lsb(
        .a        (a[0]),
        .b        (b[0]),
        .less     (set),
        .a_invert (a_invert),
        .b_invert (b_invert),
        .carry_in (carry_in[0]),
        .operation(operation[1:0]),
        .result   (result1[0]),
        .carry_out(carry_out[0])
    );
    bit_alu lsbs[30:1](
        .a        (a[30:1]),
        .b        (b[30:1]),
        .less     (less[30:1]),
        .a_invert (a_invert),
        .b_invert (b_invert),
        .carry_in (carry_in[30:1]),
        .operation(operation[1:0]),
        .result   (result1[30:1]),
        .carry_out(carry_out[30:1])
    );
    msb_bit_alu msb(
        .a        (a[31]),
        .b        (b[31]),
        .less     (less[31]),
        .a_invert (a_invert),
        .b_invert (b_invert),
        .carry_in (carry_in[31]),
        .operation(operation[1:0]),
        .result   (result1[31]),
        .set      (set),
        .overflow (overflow)
    );
    assign carry_in[31:1] = carry_out[30:0];
    assign result = (ALU_ctl == 4'b1100) ? ~result1 : result1;
    assign zero = ~|result;
endmodule
