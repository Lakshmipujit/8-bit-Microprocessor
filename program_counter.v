`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 12:47:52
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk,rst,pc_write,jump,
input [7:0] jump_addr,
output reg [7:0] pc
    );
    always @(posedge clk) begin
    if(rst) begin
    pc<=8'b00000000;
    end
    else if(pc_write) begin
       if (jump) begin
            pc<=jump_addr;
       end
       else begin
            pc<=pc+1;
       end
     end
    end
endmodule
