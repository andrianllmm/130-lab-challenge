// Logic Unit
// Performs basic logic operations.

module logic_unit (
    input  wire A,
    input  wire B,

    output wire NOT_A,
    output wire NOT_B,
    output wire AND_AB,
    output wire OR_AB
);

    // Inverters
    not u1 (NOT_A, A);
    not u2 (NOT_B, B);

    // Logic gates
    and u3 (AND_AB, A, B);
    or  u4 (OR_AB,  A, B);

endmodule
