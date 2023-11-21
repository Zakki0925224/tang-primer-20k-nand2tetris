`default_nettype none

module inc16(
    input wire[15:0] in,
    output wire[15:0] out
);
    add16 addr(
        .a(in),
        .b(16'b1),
        .out(out)
    );
endmodule

`default_nettype wire
