`timescale 1ns / 1ps

module control (
    input [5:0] opcode, // the opcode field of a instruction is [?:?]
    output reg_dst, // select register destination: rt(0), rd(1)
    output alu_src, // select 2nd operand of ALU: rt(0), sign-extended(1)
    output mem_to_reg, // select data write to register: ALU(0), memory(1)
    output reg_write, // enable write to register file
    output mem_read, // enable read form data memory
    output mem_write, // enable write to data memory
    output branch, // this is a branch instruction or not (work with alu.zero)
    output [1:0] alu_op, // ALUOp passed to ALU Control unit
    output jump,
    output lui_op,
    output ori_op
);

    wire op;
    assign lui_op = (opcode == 6'b001111);
    assign ori_op = (opcode == 6'b001101);
    assign op = (opcode == 6'b100011) || lui_op || ori_op;
    assign reg_dst = (opcode == 6'b000000);
    assign alu_src = (opcode == 6'b100011) || (opcode == 6'b101011) || ori_op;
    assign mem_to_reg = (opcode == 6'b100011);
    assign reg_write = (opcode == 6'b000000) || op;
    assign mem_read = op;
    assign mem_write = (opcode == 6'b101011);
    assign branch = (opcode == 6'b000100);
    assign alu_op[0] = (opcode == 6'b000100) || lui_op || ori_op;
    assign alu_op[1] = (opcode == 6'b000000);
    assign jump = (opcode == 6'b000010);
    
endmodule