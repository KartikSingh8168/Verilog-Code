`timescale 1ps/1ps
`include "mod12counter.v"

module mod12countertb;

reg reset,cllk;
reg j,k;
wire [3:0]A;

mod12counter uut(.j(j),.k(k),.cllk(cllk),.reset(reset),.A(A));

initial begin
    $dumpfile("mod12countertb.vcd");
    $dumpvars(0,mod12countertb);
    cllk=0;
    j=1'b1;
    k=1'b1;
    #4;
    reset=1;
    #10;
    reset=0;
    #600;
    $finish;
end

always #10 cllk = ~cllk;
endmodule