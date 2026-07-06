`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 12:37:35
// Design Name: 
// Module Name: register_file
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


module register_file(
input clk,rst,we,
input [1:0] write_addr,
input [1:0] read_addr1,
input [1:0] read_addr2,
input [7:0] write_data,
output [7:0] read_data1,
output [7:0] read_data2
    );
    reg [7:0] registers [0:3];
    integer i;
    //write operation
    always @(posedge clk or posedge rst) begin
    if(rst) begin
    for(i=0;i<4;i=i+1)
    registers[i]<=8'b0;
    end
    else if(we)
    begin
    registers[write_addr] <= write_data;
    end
    end
    //read operation
    assign read_data1=registers[read_addr1];
    assign read_data2=registers[read_addr2];
endmodule
