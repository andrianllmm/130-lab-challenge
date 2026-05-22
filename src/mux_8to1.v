// 8-to-1 Multiplexer
// Selects one of eight inputs using 3 select lines.
//
// Select mapping (S0 = MSB, S2 = LSB):
// S0 S1 S2 | Selected Input
// ---------+----------------
// 0  0  0  | I0
// 0  0  1  | I1
// 0  1  0  | I2
// 0  1  1  | I3
// 1  0  0  | I4
// 1  0  1  | I5
// 1  1  0  | I6
// 1  1  1  | I7

module mux_8to1 (

    input  wire I0,
    input  wire I1,
    input  wire I2,
    input  wire I3,
    input  wire I4,
    input  wire I5,
    input  wire I6,
    input  wire I7,

    input  wire S0,
    input  wire S1,
    input  wire S2,

    output wire Y
);

    wire nS0, nS1, nS2;
    wire w0, w1, w2, w3, w4, w5, w6, w7;

    // Invert select lines
    not u0 (nS0, S0);
    not u1 (nS1, S1);
    not u2 (nS2, S2);

    // Decode minterms (S0 is MSB, S2 is LSB)
    and u3  (w0, I0, nS0, nS1, nS2);  // 000
    and u4  (w1, I1, nS0, nS1, S2);   // 001
    and u5  (w2, I2, nS0, S1,  nS2);  // 010
    and u6  (w3, I3, nS0, S1,  S2);   // 011

    and u7  (w4, I4, S0,  nS1, nS2);  // 100
    and u8  (w5, I5, S0,  nS1, S2);   // 101
    and u9  (w6, I6, S0,  S1,  nS2);  // 110
    and u10 (w7, I7, S0,  S1,  S2);   // 111

    // Output OR reduction
    or u11 (Y, w0, w1, w2, w3, w4, w5, w6, w7);

endmodule
