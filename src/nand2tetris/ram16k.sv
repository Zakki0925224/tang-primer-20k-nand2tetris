`default_nettype none

module ram16k(
    input wire clk,
    input wire[15:0] in,
    input wire[14:0] address,
    input wire load,
    output wire[15:0] out
);
    reg[15:0] ram[16383:0];

    always @(posedge clk) begin
        if (load == 1'b1) begin
            ram[address] <= in;
        end
    end

    assign out = ram[address];
endmodule

`default_nettype wire
