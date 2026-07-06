`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 13:03:10
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input [3:0] opcode,
output reg [2:0] ALU_Sel,
output reg RegWrite, MemRead, MemWrite, Jump, ALUSrc
    );
    always @(*)
begin

    // default values (VERY IMPORTANT)
    ALU_Sel  = 3'b000;
    RegWrite = 0;
    MemRead  = 0;
    MemWrite = 0;
    Jump     = 0;
    ALUSrc = 1'b0;

    case(opcode)
     4'b0000: begin // NOP
        end

        4'b0001: begin // ADD
            ALU_Sel  = 3'b000;
            RegWrite = 1;
        end

        4'b0010: begin // SUB
            ALU_Sel  = 3'b001;
            RegWrite = 1;
        end

        4'b0011: begin // AND
            ALU_Sel  = 3'b010;
            RegWrite = 1;
        end
         4'b0100: begin // OR
            ALU_Sel  = 3'b011;
            RegWrite = 1;
        end

        4'b0101: begin // XOR
            ALU_Sel  = 3'b100;
            RegWrite = 1;
        end

        4'b0110: begin // NOT
            ALU_Sel  = 3'b101;
            RegWrite = 1;
        end
        4'b0111: begin
    MemRead  = 1'b1;
    RegWrite = 1'b1;
    ALUSrc   = 1'b1;
end

        4'b1000: begin
    MemWrite = 1'b1;
    ALUSrc   = 1'b1;
end

        4'b1001: begin // MOV
            ALU_Sel  = 3'b110; // PASS A
            RegWrite = 1;
        end

        4'b1010: begin
    ALU_Sel  = 3'b000;
    RegWrite = 1'b1;
    ALUSrc   = 1'b1;
end
         4'b1011: begin // JMP
            Jump = 1;
        end
       
        default: begin
        end
        

    endcase

end
endmodule
