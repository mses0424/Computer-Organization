`timescale 1ns / 1ps
module alu (
    input  [31:0] a,        // 32 bits, source 1 (A)
    input  [31:0] b,        // 32 bits, source 2 (B)
    input  [ 3:0] ALU_ctl,  // 4 bits, ALU control input
    output reg [31:0] result,   // 32 bits, result
    output reg    zero,     // 1 bit, set to 1 when the output is 0
    output reg    overflow  // 1 bit, overflow
);
    always @(ALU_ctl,a,b)
        begin
            case (ALU_ctl)
                4'b0000 : 
				begin
					result <= a&b;
					overflow <= 0;
				end
                4'b0001 : 
				begin
					result <= a|b;
					overflow <= 0;
				end
                4'b0010 : 
				begin
					result <= a+b;
					if ((a[31] == 1 && b[31] == 1 && result[31] == 0) ||
						(a[31] == 0 && b[31] == 0 && result[31] == 1)) begin
						overflow <= 1; 
					end
					else overflow <=0;
				end
                4'b0110 : 
				begin
					result <= a+(~b+1);
					if ((a[31] == 1 && b[31] == 0 && result[31] == 0) ||
						(a[31] == 0 && b[31] == 1 && result[31] == 1)) begin
						overflow <= 1; 
					end
					else overflow <=0;
				end
                4'b1100 : 
				begin
					result <= ~(a|b);
					overflow <= 0;
				end
                4'b0111 : 
				begin 
					if (a[31] != b[31]) begin
						if (a[31] > b[31]) begin
							result <= 1;
						end 
						else begin
							result <= 0;
				     	end
					end 
                    else begin
						if (a < b) begin
							result <= 1;
					    end 
						else begin
			                result <= 0;
					    end
					end
					overflow <= 0;
                end
            endcase
        end
        always @(result) begin
			if (result == 0) begin
				zero <= 1;
			end else begin
				zero <= 0;
			end
		end
endmodule
