`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 12:54:48
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(
    input  [7:0] address,
    output [15:0] instruction
);

reg [15:0] memory [0:255];
integer i;

initial begin
    // Initialize all locations to NOP
    for(i = 0; i < 256; i = i + 1)
        memory[i] = 16'b0000_00_00_00000000;

    // Program

    // R0 = R0 + 5
    memory[0] = 16'b1010_00_00_00000101;

    // R1 = R1 + 3
    memory[1] = 16'b1010_01_01_00000011;

    // R0 = R1 + R0
    memory[2] = 16'b0001_00_01_00_000000;

    // STORE R0
    // (With your present datapath, this stores to address = ALU result)
    memory[3] = 16'b1000_00_00_00000000;

    // NOP
    memory[4] = 16'b0000_00_00_00000000;
end

assign instruction = memory[address];

endmodule