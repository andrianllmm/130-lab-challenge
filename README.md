# CMSC 130 Lab Challenge - 1-Bit ALU

## Description

This project implements a 1-bit Addition and Logic Unit (ALU) using Verilog HDL. The system performs both arithmetic and logic operations on two 1-bit inputs through combinational logic.

The ALU is designed with separate arithmetic and logic units controlled through a multiplexer, which selects the correct operation based on the control signals.

The project is simulated and verified using Icarus Verilog and GTKWave.

---

## Objectives

- Implement a 1-bit ALU system
- Perform arithmetic and logic operations using combinational circuits
- Design and verify the system using Verilog HDL
- Simulate waveform outputs for functional verification

---

## Inputs

### Data Inputs

- **A** = 1-bit input A
- **B** = 1-bit input B

### Control Signals

- **S0** = Operation select bit 0
- **S1** = Operation select bit 1
- **S2** = Operation select bit 2

---

## Outputs

- **R** = Result output
- **C** = Carry output

The ALU produces arithmetic or logic results depending on the selected operation.

---

## Operation Table

| S0  | S1  | S2  | Operation                  |
| --- | --- | --- | -------------------------- |
| 1   | 1   | -   | None                       |
| 1   | 0   | 0   | NOT A                      |
| 1   | 0   | 1   | NOT B                      |
| 0   | 0   | 0   | AND                        |
| 0   | 0   | 1   | OR                         |
| 0   | 1   | 0   | Addition (R output only)   |
| 0   | 1   | 1   | Addition (R and C outputs) |

---

## Architecture

The system consists of:

- A **Logic Unit** for logical operations
- An **Arithmetic Unit** for addition operations
- A **Multiplexer** that selects the correct output based on the control signals

The selected operation determines the values of the result output (**R**) and carry output (**C**).

---

## Project Structure

```text
src/
├── alu_1bit.v          # Top-level 1-bit ALU module
├── arithmetic_unit.v  # Arithmetic unit for addition operations
├── logic_unit.v       # Logic unit for logical operations
└── mux_8to1.v         # Multiplexer for operation selection

tb/                    # Testbench files for simulation and verification
sim/                   # Simulation outputs (VCD waveform and compiled VVP files)
```

---

## Requirements

- Icarus Verilog (`iverilog`) – compilation and simulation
- GTKWave – waveform visualization
- GNU Make – build automation (recommended)
- VS Code – development environment (optional)

---

## Build and Run Instructions

### Using Makefile (recommended)

Compile and run simulation:

```sh
make run
```

View waveform:

```sh
make wave
```

Clean generated files:

```sh
make clean
```

Full reset:

```sh
make reset
```

---

### Manual Execution

Compile:

```sh
iverilog -o sim/run.vvp src/alu.v tb/tb_alu.v
```

Run simulation:

```sh
vvp sim/run.vvp
```

View waveform:

```sh
gtkwave sim/dump.vcd
```
