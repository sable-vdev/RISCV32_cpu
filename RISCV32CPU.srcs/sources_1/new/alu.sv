`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2026 03:09:30 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(input[31:0] a, b, input [3:0] ctrl, output reg zero, output reg[31:0] result);

    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_AND  = 4'b0010;
    localparam ALU_OR   = 4'b0011;
    localparam ALU_XOR  = 4'b0100;
    localparam ALU_SLL  = 4'b0101;
    localparam ALU_SRL  = 4'b0110;
    localparam ALU_SRA  = 4'b0111;
    localparam ALU_SLT  = 4'b1000;
    localparam ALU_SLTU = 4'b1001;

    always @(*) begin
        result = 32'b0;
        //carry_out = 1'b0;

        case(ctrl)
        ALU_ADD:
            result = a + b;
        ALU_SUB:
            result = a - b;
        ALU_AND:
            result = a & b;
        ALU_OR:
            result = a | b;
        ALU_XOR:
            result = a ^ b;
        ALU_SLL:
            result = a << (b[4:0]); 
        ALU_SRL:
            result = a >> (b[4:0]);
        ALU_SRA:
            result = $signed(a) >>> (b[4:0]);
        ALU_SLT:
            result = $signed(a) < $signed(b);
        ALU_SLTU:
            result = a < b;
        default: 
            result = 32'b0;
        endcase

        zero = (result == 32'b0);
    end

endmodule