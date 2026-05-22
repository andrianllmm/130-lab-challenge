// 8-to-1 Multiplexer
// Selects one of eight inputs using 3 select lines.

module mux_8to1 (

    // Data inputs
    input  wire I0,
    input  wire I1,
    input  wire I2,
    input  wire I3,
    input  wire I4,
    input  wire I5,
    input  wire I6,
    input  wire I7,

    // Select inputs
    input  wire S0,
    input  wire S1,
    input  wire S2,

    // Output
    output wire Y
);

    // Inverted select lines
    wire nS0, nS1, nS2;

    // Intermediate outputs
    wire w0, w1, w2, w3, w4, w5, w6, w7;

    // Generate inverted select signals
    not u0 (nS0, S0);
    not u1 (nS1, S1);
    not u2 (nS2, S2);

    // Input selection logic
    and u3  (w0, I0, nS2, nS1, nS0);
    and u4  (w1, I1, nS2, nS1, S0);
    and u5  (w2, I2, nS2, S1,  nS0);
    and u6  (w3, I3, nS2, S1,  S0);
    and u7  (w4, I4, S2,  nS1, nS0);
    and u8  (w5, I5, S2,  nS1, S0);
    and u9  (w6, I6, S2,  S1,  nS0);
    and u10 (w7, I7, S2,  S1,  S0);

    // Combine selected outputs
    or u11 (Y, w0, w1, w2, w3, w4, w5, w6, w7);

endmodule
