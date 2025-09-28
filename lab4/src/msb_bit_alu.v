`timescale 1ns / 1ps
// <your student id>

/* checkout FIGURE C.5.10 (Bottom) */
/* [Prerequisite] complete bit_alu.v */
module msb_bit_alu (
    input        a,          // 1 bit, a
    input        b,          // 1 bit, b
    input        less,       // 1 bit, Less
    input        a_invert,   // 1 bit, Ainvert
    input        b_invert,   // 1 bit, Binvert
    input        carry_in,   // 1 bit, CarryIn
    input  [1:0] operation,  // 2 bit, Operation
    output reg   result,     // 1 bit, Result (Must it be a reg?)
    output       set,        // 1 bit, Set
    output       overflow    // 1 bit, Overflow
);
    wire ai, bi;
    assign ai = a_invert==1 ? ~a : a ;  
    assign bi = b_invert==1 ? ~b : b ;  
    wire carry_out;
    wire sum;
    assign carry_out = (ai&bi) | ((ai^bi) & carry_in);
    assign sum = (ai^bi) ^ carry_in;

    assign set = sum ^ overflow_count;
    assign overflow = (operation==2'b11) ? 0 : carry_in ^ carry_out;
    assign overflow_count =  carry_in ^ carry_out;

    always @(*) begin  
        case (operation)  
            2'b00:   result <= ai & bi;  
            2'b01:   result <= ai | bi;  
            2'b10:   result <= sum; 
            2'b11:   result <= less;  
            default: result <= 0; 
        endcase
    end
endmodule
