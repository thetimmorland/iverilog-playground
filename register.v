module register
(
    input wire clear, clk, write_enable,
    input wire [31:0] input_val,
    output reg[31:0] output_val
);

initial
begin
    output_val = 0;
end

always @(posedge clk) begin
    if (write_enable) begin
        output_val = input_val;
    end

    if (clear) begin
        output_val = 0;
    end
end

endmodule
