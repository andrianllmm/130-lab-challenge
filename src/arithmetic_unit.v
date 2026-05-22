// Arithmetic Unit
// Performs half-adder operations.
// SUM   = A XOR B
// CARRY = A AND B

module arithmetic_unit (
    input  wire A,
    input  wire B,

    output wire SUM,
    output wire CARRY
);

    xor u1 (SUM,   A, B);
    and u2 (CARRY, A, B);

endmodule
