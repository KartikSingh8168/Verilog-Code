`timescale 1ns/1ps
`include "shiftregister.v"

module shiftregistertb;

reg Din,Clk,Rst;
wire Dout;
shiftregister uut(.Din(Din),.Clk(Clk),.Rst(Rst),.Dout(Dout));

initial begin
    $dumpfile("shiftregistertb.vcd");
    $dumpvars(0,shiftregistertb);
    Rst=1;
    Clk=0;
    #20;
    Rst=0;
    Din=1;
    #10;
    #300;
    $finish;
end
always #10 Clk = ~Clk;

endmodule