`timescale 1ps/1ps
`include "frqby23.v"

module frqby23tb;

reg clk,rst;
wire [1:0]T;
wire f,m,k;

frqby23 uut(.clk(clk),.rst(rst),.f(f),.T(T),.m(m),.k(k));

initial  begin
    $dumpfile("frqby23tb.vcd");
    $dumpvars(0,frqby23tb);
    clk=0;
    rst=1;
    #5;
    rst=0;
    #10;
    #600;
    $finish;
end

always #10 clk = ~clk;

endmodule