`timescale 1 ns/10 ps

module register_tb;

reg clear, clk, write_enable;
reg [31:0] input_val;

wire [31:0] output_val;

localparam period = 20;
localparam tick = period / 2;

register uut(.clear(clear), .clk(clk), .write_enable(write_enable),
    .input_val(input_val), .output_val(output_val));

initial
begin
    clk = 0;
    forever #tick clk = ~clk;
end

initial
begin
    $dumpfile("register_tb.fst");
    $dumpvars(0, register_tb);

    clear = 0;
    write_enable = 0;
    input_val = 1;

    #period;

    write_enable = 1;
    
    #period;

    write_enable = 0;

    #period;

    clear = 1;

    #period;

    $finish;
end

endmodule
