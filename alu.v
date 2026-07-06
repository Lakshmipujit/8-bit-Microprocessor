`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 12:25:43
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


module alu(
input [7:0] A,
input [7:0] B,
input [2:0] ALU_Sel,
output reg [7:0] Result,
output zero,
output reg Carry
    );
    always @(*) begin
        Carry=0;
        case (ALU_Sel)
        3'b000: {Carry,Result}=A+B;
        3'b001: {Carry,Result}=A-B;
        3'b010: Result=A&B;
        3'b011: Result=A|B;
        3'b100: Result=A^B;
        3'b101: Result=~A;
        default: Result=8'b0;
        endcase
    end
    assign zero=(Result==8'b0);
endmodule
