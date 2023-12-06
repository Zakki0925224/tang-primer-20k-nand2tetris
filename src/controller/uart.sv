`default_nettype none

module uart
#(
    parameter DELAY_FRAMES = 234 // 27,000,000 hz / 115200 baud rate
)
(
    input wire clk,
    input wire rx,
    output wire tx
);
    localparam HALF_DELAY_WAIT = (DELAY_FRAMES / 2);

    // receiver
    enum {
        RX_STATE_IDLE = 0,
        RX_STATE_START_BIT = 1,
        RX_STATE_READ_WAIT = 2,
        RX_STATE_READ = 3,
        RX_STATE_STOP_BIT = 5
    } rx_state = RX_STATE_IDLE;

    reg[12:0] rx_cnt = 0;
    reg[2:0] rx_bit_num = 0;
    reg[7:0] data_in = 0;
    reg byte_ready = 0;

    always @(posedge clk) begin
        case (rx_state)
            RX_STATE_IDLE: begin
                // reset
                byte_ready <= 0;
                if (rx == 0 && tx_state == TX_STATE_IDLE) begin
                    rx_state <= RX_STATE_START_BIT;
                    rx_cnt <= 1;
                    rx_bit_num <= 0;
                end
            end

            RX_STATE_START_BIT: begin
                // wait for delay
                if (rx_cnt == HALF_DELAY_WAIT) begin
                    rx_state <= RX_STATE_READ_WAIT;
                    rx_cnt <= 1;
                end
                else begin
                    rx_cnt <= rx_cnt + 1;
                end
            end

            RX_STATE_READ_WAIT: begin
                // wait DELAY_FRAMES clocks
                rx_cnt <= rx_cnt + 1;

                if ((rx_cnt + 1) == DELAY_FRAMES) begin
                    rx_state <= RX_STATE_READ;
                end
            end

            RX_STATE_READ: begin
                // read 8bits
                rx_cnt <= 1;
                data_in <= {rx, data_in[7:1]};
                rx_bit_num <= rx_bit_num + 1;

                if (rx_bit_num == 7)
                    rx_state <= RX_STATE_STOP_BIT;
                else
                    rx_state <= RX_STATE_READ_WAIT;
            end

            RX_STATE_STOP_BIT: begin
                // end of read bits
                rx_cnt <= rx_cnt + 1;

                if ((rx_cnt + 1) == DELAY_FRAMES) begin
                    rx_state <= RX_STATE_IDLE;
                    rx_cnt <= 0;
                    byte_ready <= 1;
                end
            end
        endcase
    end

    // transmitter
    enum {
        TX_STATE_IDLE = 0,
        TX_STATE_START_BIT = 1,
        TX_STATE_WRITE = 2,
        TX_STATE_STOP_BIT = 3
    } tx_state = TX_STATE_IDLE;

    reg[24:0] tx_cnt = 0;
    reg[7:0] data_out = 0;
    reg tx_pin_reg = 1;
    reg[2:0] tx_bit_num = 0;

    assign tx = tx_pin_reg;

    always @(posedge clk) begin
        case (tx_state)
            TX_STATE_IDLE: begin
                if (byte_ready) begin
                    tx_state <= TX_STATE_START_BIT;
                    tx_cnt <= 0;
                    data_out <= data_in;
                end
                else begin
                    tx_pin_reg <= 1;
                end
            end

            TX_STATE_START_BIT: begin
                tx_pin_reg <= 0;

                if ((tx_cnt + 1) == DELAY_FRAMES) begin
                    tx_state <= TX_STATE_WRITE;
                    tx_bit_num <= 0;
                    tx_cnt <= 0;
                end
                else begin
                    tx_cnt <= tx_cnt + 1;
                end
            end

            TX_STATE_WRITE: begin
                tx_pin_reg <= data_out[tx_bit_num];

                if ((tx_cnt + 1) == DELAY_FRAMES) begin
                    if (tx_bit_num == 7) begin
                        tx_state <= TX_STATE_STOP_BIT;
                    end
                    else begin
                        tx_state <= TX_STATE_WRITE;
                        tx_bit_num <= tx_bit_num + 1;
                    end

                    tx_cnt <= 0;
                end
                else begin
                    tx_cnt <= tx_cnt + 1;
                end
            end

            TX_STATE_STOP_BIT: begin
                tx_pin_reg <= 1;

                if ((tx_cnt + 1) == DELAY_FRAMES) begin
                    tx_state <= TX_STATE_IDLE;
                end
                else begin
                    tx_cnt <= tx_cnt + 1;
                end
            end
        endcase
    end
endmodule

`default_nettype wire
