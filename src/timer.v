module timer #(
    parameter COUNT_LIMIT = 27_000_000
) (
    input wire clk,
    output wire count_max
);
    reg [$clog2 (COUNT_LIMIT + 1) - 1:0] counter = 0;
    assign count_max = (counter == COUNT_LIMIT)? 1'b1: 1'b0;

    always @(posedge clk) begin
        if (counter == COUNT_LIMIT) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
