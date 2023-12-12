`default_nettype none

module rgb_lcd
#(
    parameter DELAY_FRAMES = 3 // 27MHz to 9Mhz
)
(
    input wire clk,
    input wire reset,

    output wire dclk,   // display clock
    output wire de,     // data enable
    output wire hs,     // horizontal sync
    output wire vs,     // vertical sync
    output wire[9:0] current_x_pos,
    output wire[9:0] current_y_pos
);
endmodule

    reg[3:0] clk_cnt = 0;

    always @(posedge clk) begin
        clk_cnt <= clk_cnt + 1;

        if ((clk_cnt + 1) == DELAY_FRAMES) begin

            clk_cnt <= 0;
        end
    end
`default_nettype wire
