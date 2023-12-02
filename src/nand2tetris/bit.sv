`default_nettype none

module _bit(
    input wire clk,
    input wire in,
    input wire load, // 1 -> write
    output wire out
);
    reg val;

    always @(posedge clk) begin
        if (load == 1'b1) begin
            val <= in;
        end
    end

    assign out = val;
endmodule

`default_nettype wire
