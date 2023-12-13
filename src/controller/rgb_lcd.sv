`default_nettype none

module rgb_lcd
#(
    parameter H_ACTIVE = 16'd480,
    parameter H_FP = 16'd2,
    parameter H_SYNC = 16'd41,
    parameter H_BP = 16'd2,

    parameter V_ACTIVE = 16'd272,
    parameter V_FP  = 16'd2,
    parameter V_SYNC  = 16'd10,
    parameter V_BP  = 16'd2,

    parameter HS_POL = 1'b0,
    parameter VS_POL = 1'b0,

    parameter H_TOTAL = H_ACTIVE + H_FP + H_SYNC + H_BP, // horizontal pixels
    parameter V_TOTAL = V_ACTIVE + V_FP + V_SYNC + V_BP  // vertical pixels
)
(
    input wire clk,
    input wire reset,

    output wire dclk,   // display clock
    output wire de,     // data enable
    output wire hs,     // horizontal sync
    output wire vs,     // vertical sync
    output wire[9:0] h_pos, // current horizontal position
    output wire[9:0] v_pos  // current vertical position
);
    reg[11:0] h_cnt;
    reg[11:0] v_cnt;

    reg hs_reg;
    reg vs_reg;

    reg he_reg;
    reg ve_reg;

    reg[9:0] h_pos_reg;
    reg[9:0] v_pos_reg;

    assign hs = hs_reg;
    assign vs = vs_reg;
    assign de = he_reg & ve_reg;
    assign h_pos = h_pos_reg;
    assign v_pos = v_pos_reg;

    // 27MHz to 9 MHz
    rgb_lcd_pll pll(
        .clkin(clk),
        .clkout(dclk)
    );

    // h_cnt
    always @(posedge dclk or posedge reset) begin
        if (reset)
            h_cnt <= 0;

        else if ((h_cnt + 1) == H_TOTAL)
            h_cnt <= 0;

        else
            h_cnt <= h_cnt + 1;
    end

    // v_cnt
    always @(posedge dclk or posedge reset) begin
        if (reset)
            v_cnt <= 0;

        else if ((h_cnt + 1) == H_FP) begin
            if ((v_cnt + 1) == V_TOTAL)
                v_cnt <= 0;

            else
                v_cnt <= v_cnt + 1;
        end
        else
            v_cnt <= v_cnt;
    end

    // hs
    always @(posedge dclk or posedge reset) begin
        if (reset)
            hs_reg <= 0;

        else if ((h_cnt + 1) == H_FP)
            hs_reg <= HS_POL;

        else if ((h_cnt + 1) == H_FP + H_SYNC)
            hs_reg <= ~hs_reg;

        else
            hs_reg <= hs_reg;
    end

    // vs
    always @(posedge dclk or posedge reset) begin
        if (reset)
            vs_reg <= 0;

        else if (((v_cnt + 1) == V_FP) && ((h_cnt + 1) == H_FP))
            vs_reg <= VS_POL;

        else if (((v_cnt + 1) == V_FP + V_SYNC) && ((h_cnt + 1) == H_FP))
            vs_reg <= ~vs_reg;

        else
            vs_reg <= vs_reg;
    end

    // he
    always @(posedge dclk or posedge reset) begin
        if (reset)
            he_reg <= 0;

        else if ((h_cnt + 1) == H_FP + H_SYNC + H_BP)
            he_reg <= 1;

        else if ((h_cnt + 1) == H_TOTAL)
            he_reg <= 0;

        else
            he_reg <= he_reg;
    end

    // ve
    always @(posedge dclk or posedge reset) begin
        if (reset)
            ve_reg <= 0;

        else if (((v_cnt + 1) == V_FP + V_SYNC + V_BP) && ((h_cnt + 1) == H_FP))
            ve_reg <= 1;

        else if (((v_cnt + 1) == V_TOTAL) && ((h_cnt + 1) == H_FP))
            ve_reg <= 0;

        else
            ve_reg <= ve_reg;

    end

    // h_pos
    always @(posedge dclk) begin
        if ((h_cnt + 1) >= H_FP + H_SYNC + H_BP)
            h_pos_reg <= (h_cnt - 1) - (H_FP[11:0] + H_SYNC[11:0] + H_BP[11:0]);

        else
            h_pos_reg <= h_pos_reg;
    end

    // v_pos
    always @(posedge dclk) begin
        if ((v_cnt + 1) >= V_FP + V_SYNC + V_BP)
            v_pos_reg <= (v_cnt - 1) - (V_FP[11:0] + V_SYNC[11:0] + V_BP[11:0]);
        else
            v_pos_reg <= v_pos_reg;
    end
endmodule
`default_nettype wire
