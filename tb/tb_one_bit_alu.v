`timescale 1ns / 1ps

module tb_one_bit_alu;

    reg A, B;
    reg S0, S1, S2;
    wire R, C;

    one_bit_alu uut (
        .A(A),
        .B(B),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .R(R),
        .C(C)
    );

    task apply;
        input a, b, s0, s1, s2;
        begin
            A = a;
            B = b;
            S0 = s0;
            S1 = s1;
            S2 = s2;
            #10;
        end
    endtask

    task print_header;
        input [100*8:1] name;
        begin
            $display("\n%0s", name);
            $display("A B | S0 S1 S2 | R C");
        end
    endtask

    initial begin

        // AND (000)
        print_header("AND");
        apply(0,0,0,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(0,1,0,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,0,0,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,1,0,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // OR (001)
        print_header("OR");
        apply(0,0,1,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(0,1,1,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,0,1,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,1,1,0,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // ADD (010)
        print_header("ADD (R only)");
        apply(0,0,0,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(0,1,0,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,0,0,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,1,0,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // ADD (011)
        print_header("ADD (R + C)");
        apply(0,0,1,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(0,1,1,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,0,1,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,1,1,1,0);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // NOT A (100)
        print_header("NOT A");
        apply(0,0,0,1,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,0,0,1,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // NOT B (101)
        print_header("NOT B");
        apply(0,0,1,1,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(0,1,1,1,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);


        // NONE (11x)
        print_header("NONE");
        apply(1,1,0,0,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        apply(1,1,1,0,1);
        $display("%b %b | %b  %b  %b  | %b %b", A,B,S0,S1,S2,R,C);

        $finish;
    end

endmodule
