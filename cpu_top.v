`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 13:09:44
// Design Name: 
// Module Name: cpu_top
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

module cpu_top(
    input clk,
    input rst
);

//=======================
// Wires
//=======================

wire [7:0] pc;
wire [7:0] jump_addr;

wire [15:0] instr_fetch;
wire [15:0] instr_ir;

wire [3:0] opcode;

wire [7:0] operandA;
wire [7:0] operandB;

wire [2:0] ALU_Sel;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire Jump;
wire ALUSrc;

wire [7:0] immediate;
wire [7:0] alu_B;

wire [7:0] alu_result;
wire [7:0] mem_read_data;
wire [7:0] reg_write_data;

//=======================
// Program Counter
//=======================

program_counter PC(
    .clk(clk),
    .rst(rst),
    .pc_write(1'b1),
    .jump(Jump),
    .jump_addr(jump_addr),
    .pc(pc)
);

//=======================
// Instruction Memory
//=======================

instruction_memory IMEM(
    .address(pc),
    .instruction(instr_fetch)
);

//=======================
// Instruction Register
//=======================

instruction_register IR(
    .clk(clk),
    .rst(rst),
    .load(1'b1),
    .instruction_in(instr_fetch),
    .instruction_out(instr_ir)
);

//=======================
// Decode
//=======================

assign opcode     = instr_ir[15:12];
assign jump_addr  = instr_ir[7:0];
assign immediate  = instr_ir[7:0];

//=======================
// ALU Source MUX
//=======================

assign alu_B = (ALUSrc) ? immediate : operandB;

//=======================
// Control Unit
//=======================

control_unit CU(
    .opcode(opcode),
    .ALU_Sel(ALU_Sel),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Jump(Jump),
    .ALUSrc(ALUSrc)
);

//=======================
// Register File
//=======================

register_file RF(
    .clk(clk),
    .rst(rst),
    .we(RegWrite),

    .write_addr(instr_ir[11:10]),
    .read_addr1(instr_ir[9:8]),
    .read_addr2(instr_ir[7:6]),

    .write_data(reg_write_data),

    .read_data1(operandA),
    .read_data2(operandB)
);

//=======================
// ALU
//=======================

alu ALU(
    .A(operandA),
    .B(alu_B),          // <-- Changed here
    .ALU_Sel(ALU_Sel),
    .Result(alu_result),
    .Carry(),
    .zero()
);

//=======================
// Data Memory
//=======================

data_memory DMEM(
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(alu_result),
    .write_data(operandA),
    .read_data(mem_read_data)
);

//=======================
// Write Back MUX
//=======================

assign reg_write_data =
    (MemRead) ? mem_read_data : alu_result;

endmodule