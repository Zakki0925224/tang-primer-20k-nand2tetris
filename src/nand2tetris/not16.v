`default_nettype none

module not16(
    input wire[15:0] in,
    output wire[15:0] out
);
    _not not_gate[15:0](
        .in(in),
        .out(out)
    );
endmodule

`default_nettype wire
