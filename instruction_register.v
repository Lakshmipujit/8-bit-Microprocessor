`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 12:59:26
// Design Name: 
// Module Name: instruction_register
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


module instruction_register(
input clk,rst,load,
input [15:0] instruction_in,
output reg [15:0] instruction_out
    );
    always @(posedge clk or posedge rst)
begin

    if(rst)
        instruction_out <= 16'b0;

    else if(load)
        instruction_out <= instruction_in;

end
endmodule
