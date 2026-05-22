// 1-Bit ALU Design
//
// Operations:
// S2 S1 S0 | Operation
// ---------+----------------
// 0  0  0  | A AND B
// 0  0  1  | A OR B
// 0  1  0  | A XOR B
// 0  1  1  | A + B
// 1  0  0  | NOT A
// 1  0  1  | NOT B
// 1  1  0  | Unused
// 1  1  1  | Unused
//
// R = Main ALU result
// C = Carry output (valid only for ADD)

// 1-Bit ALU
// Combines logic unit, arithmetic unit,
// and multiplexers to produce ALU outputs.
module alu_1bit (

    // ALU inputs
    input  wire A,
    input  wire B,

    // Operation select lines
    input  wire S0,
    input  wire S1,
    input  wire S2,

    // Outputs
    output wire R,
    output wire C
);

    // Internal signals from logic unit
    wire NOT_A, NOT_B, AND_AB, OR_AB;

    // Internal signals from arithmetic unit
    wire SUM, CARRY;


    // Logic Unit Instance
    logic_unit u_logic (
        .A(A),
        .B(B),
        .NOT_A(NOT_A),
        .NOT_B(NOT_B),
        .AND_AB(AND_AB),
        .OR_AB(OR_AB)
    );


    // Arithmetic Unit Instance
    arithmetic_unit u_arith (
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CARRY)
    );


    // Result Multiplexer
    // Selects the final ALU result.
    mux_8to1 mux_r (
        .I0(AND_AB),
        .I1(OR_AB),
        .I2(SUM),
        .I3(SUM),
        .I4(NOT_A),
        .I5(NOT_B),
        .I6(1'b0),
        .I7(1'b0),

        .S0(S0),
        .S1(S1),
        .S2(S2),

        .Y(R)
    );


    // Carry Multiplexer
    // Carry is only enabled during ADD operation.
    mux_8to1 mux_c (
        .I0(1'b0),
        .I1(1'b0),
        .I2(1'b0),
        .I3(CARRY),
        .I4(1'b0),
        .I5(1'b0),
        .I6(1'b0),
        .I7(1'b0),

        .S0(S0),
        .S1(S1),
        .S2(S2),

        .Y(C)
    );

endmodule
