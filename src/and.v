module _and(
    input a,
    input b,
    output out
);
    wire nand_ab;

    _nand nand_gate_ab(
        .a(a),
        .b(b),
        .out(nand_ab)
    );

    _nand nand_gate_out(
        .a(nand_ab),
        .b(nand_ab),
        .out(out)
    );
endmodule


// module and_tb();
//     reg a, b, out;

//     _and and_gate(
//         .a(a),
//         .b(b),
//         .out(out)
//     );

//     initial begin
//         a = 1;
//         b = 0;

//         if (out == 0)
//             $display("ok");

//         else
//             $display("error");
//     end
// endmodule
