`default_nettype none

module or16(
    input wire[15:0] a,
    input wire[15:0] b,
    output wire[15:0] out
);
    _or or_gate[15:0](
        .a(a),
        .b(b),
        .out(out)
    );
endmodule

`default_nettype wire
