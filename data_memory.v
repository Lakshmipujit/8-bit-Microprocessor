`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 13:07:29
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input clk,MemRead,MemWrite,

    input [7:0] address,
    input [7:0] write_data,

    output reg [7:0] read_data
    );
    reg [7:0] memory [0:255];

integer i;

// Optional initialization
initial begin
    for(i = 0; i < 256; i = i + 1)
        memory[i] = 8'b0;

    // sample values
    memory[10] = 8'd25;
    memory[11] = 8'd50;
end
// Read operation (combinational)
always @(*) begin
    if(MemRead)
        read_data = memory[address];
    else
        read_data = 8'b0;
end

// Write operation (sequential)
always @(posedge clk) begin
    if(MemWrite)
        memory[address] <= write_data;
end
endmodule
