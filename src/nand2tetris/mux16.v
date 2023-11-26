`default_nettype none

module mux16(
    input wire[15:0] a,
    input wire[15:0] b,
    input wire sel,
    output wire[15:0] out
);
    mux mux[15:0](
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );
endmodule

`default_nettype wire
