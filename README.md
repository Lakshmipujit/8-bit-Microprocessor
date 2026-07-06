# 8-Bit Microprocessor in Verilog

## Overview

This project implements a simple **8-bit Microprocessor** using **Verilog HDL**. It demonstrates the fundamental building blocks of a CPU, including instruction fetching, decoding, execution, register operations, arithmetic logic operations, and memory access.

The processor was designed and simulated using **AMDA Vivado** and serves as an educational project for learning computer architecture and digital design.

---

## Features

* 8-bit Program Counter (PC)
* 16-bit Instruction Format
* Instruction Memory
* Instruction Register (IR)
* Register File (4 General Purpose Registers)
* Arithmetic Logic Unit (ALU)
* Control Unit
* Data Memory
* Support for Immediate Instructions
* Synchronous Register Write Operations
* Behavioral Simulation using Vivado Simulator

---

## Instruction Set

| Opcode | Instruction | Description           |
| ------ | ----------- | --------------------- |
| 0000   | NOP         | No operation          |
| 0001   | ADD         | Addition              |
| 0010   | SUB         | Subtraction           |
| 0011   | AND         | Bitwise AND           |
| 0100   | OR          | Bitwise OR            |
| 0101   | XOR         | Bitwise XOR           |
| 0110   | NOT         | Bitwise NOT           |
| 0111   | LOAD        | Load from Data Memory |
| 1000   | STORE       | Store to Data Memory  |
| 1001   | MOV         | Move Register         |
| 1010   | ADDI        | Add Immediate         |
| 1011   | JMP         | Jump                  |

---

## Processor Architecture

The processor consists of the following modules:

* Program Counter
* Instruction Memory
* Instruction Register
* Control Unit
* Register File
* ALU
* Data Memory
* Write Back Multiplexer

### Data Flow

```text
Program Counter
        │
        ▼
Instruction Memory
        │
        ▼
Instruction Register
        │
        ▼
Control Unit
        │
        ▼
Register File
        │
        ▼
      ALU
        │
        ▼
 Data Memory
        │
        ▼
 Register Write Back
```

---

## Project Structure

```text
8bit_microprocessor/
│
├── alu.v
├── control_unit.v
├── cpu_top.v
├── cpu_tb.v
├── data_memory.v
├── instruction_memory.v
├── instruction_register.v
├── program_counter.v
├── register_file.v
└── README.md
```

---

## Sample Program

```verilog
memory[0] = 16'b1010_00_00_00000101; // ADDI R0, #5
memory[1] = 16'b1010_01_01_00000011; // ADDI R1, #3
memory[2] = 16'b0001_00_01_00_000000; // ADD R0, R1
memory[3] = 16'b1000_00_00_00000000; // STORE R0
memory[4] = 16'b0000_00_00_00000000; // NOP
```

---

## Simulation

The processor was simulated using **Vivado Simulator (XSim)**.

During simulation, the following were verified:

* Program Counter increments correctly
* Instructions are fetched sequentially
* Instruction decoding
* Register writes
* ALU operations
* Data Memory access
* Write-back stage

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Design Suite
* Vivado XSim Simulator



---

## Learning Outcomes

This project helped in understanding:

* CPU Datapath Design
* Control Unit Design
* Register Transfer Level (RTL) Design
* Verilog HDL
* Digital System Design
* Computer Organization and Architecture
* Functional Simulation and Debugging

---

## Project Done By

**Lakshmi Pujitha Chaganti**

B.Tech Student | Electronics and Communication Engineering

---

