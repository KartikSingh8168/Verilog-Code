`timescale 1ns/1ns
`include "synccount.v"

module synccounttb;

reg clk,rst;
wire [2:0]out;

synccount uut(.clk(clk),.rst(rst),.out(out));
initial begin
    $dumpfile("synccounttb.vcd");
    $dumpvars(0,synccounttb);
    clk=0;
    rst=1;
    #10;
    rst=0;
    #300;
    $finish;
end

always #10 clk = ~clk;

endmodule