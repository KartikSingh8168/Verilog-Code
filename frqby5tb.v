`timescale 1ps/1ps
`include "frqby5.v"

module frqby5tb;
reg clk,rst;
wire [2:0]Q;
wire f;

frqby5 uut(.clk(clk),.rst(rst),.f(f),.Q(Q));
initial begin
    $dumpfile("frqby5tb.vcd");
    $dumpvars(0,frqby5tb);
    clk = 0;
    rst = 1;
    #5;
    rst=0;
    #10;
    #300;
    $finish;
end

always #10 clk = ~clk;

endmodule