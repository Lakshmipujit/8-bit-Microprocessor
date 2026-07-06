`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 13:13:17
// Design Name: 
// Module Name: cpu_tb
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

module cpu_tb;

reg clk;
reg rst;

cpu_top DUT(
    .clk(clk),
    .rst(rst)
);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #200;

    $finish;
end

//---------------------------------------------------
// CPU Monitor
//---------------------------------------------------

always @(posedge clk)
begin
    $display("==================================================");
    $display("TIME = %0t", $time);

    $display("PC           = %0d", DUT.pc);
    $display("Instruction  = %b", DUT.instr_ir);
    $display("Opcode       = %b", DUT.opcode);

    $display("Operand A    = %0d", DUT.operandA);
    $display("Operand B    = %0d", DUT.operandB);

    $display("Immediate    = %0d", DUT.immediate);

    $display("ALU Result   = %0d", DUT.alu_result);

    $display("RegWrite     = %b", DUT.RegWrite);
    $display("MemRead      = %b", DUT.MemRead);
    $display("MemWrite     = %b", DUT.MemWrite);

    $display("--------------- Registers ----------------");

    $display("R0 = %0d", DUT.RF.registers[0]);
    $display("R1 = %0d", DUT.RF.registers[1]);
    $display("R2 = %0d", DUT.RF.registers[2]);
    $display("R3 = %0d", DUT.RF.registers[3]);

    $display("--------------- Data Memory --------------");

    $display("MEM[0]  = %0d", DUT.DMEM.memory[0]);
    $display("MEM[1]  = %0d", DUT.DMEM.memory[1]);
    $display("MEM[10] = %0d", DUT.DMEM.memory[10]);

    $display("==================================================");
end

endmodule