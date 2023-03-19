`timescale 1ns/1ns
`include "module10.v"

module mod10tb;
wire [3:0] Count_Out;
reg clk,reset;

mod_10_counter uut(.clk(clk),.reset(reset),.Count_Out(Count_Out));

initial begin
  $dumpfile("module10tb.vcd");
    $dumpvars(0,mod10tb);
    clk = 0;
    reset=1;
    #10;
    reset = 0;
    #500;
    $finish;
end

always #10 clk = ~clk;

endmodule