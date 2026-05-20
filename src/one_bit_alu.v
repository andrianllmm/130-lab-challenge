module one_bit_alu (
    input  wire A,
    input  wire B,
    input  wire S0,
    input  wire S1,
    input  wire S2,
    output reg  R,
    output reg  C
);

    always @(*) begin
        // default output
        R = 1'b0;
        C = 1'b0;

        case ({S0, S1, S2})
            3'b100: begin
                // NOT A
                R = ~A;
            end

            3'b101: begin
                // NOT B
                R = ~B;
            end

            3'b000: begin
                // AND
                R = A & B;
            end

            3'b001: begin
                // OR
                R = A | B;
            end

            3'b010: begin
                // ADD, only R output
                R = A ^ B;
                C = 1'b0;
            end

            3'b011: begin
                // ADD, R and C output
                R = A ^ B;
                C = A & B;
            end

            default: begin
                // 3'b110 and 3'b111
                R = 1'b0;
                C = 1'b0;
            end
        endcase
    end

endmodule
