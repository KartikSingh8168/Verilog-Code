`timescale 1ns/1ns
`include "fsm0101nov.v"

module fsm0101novtb;

reg Clk,rst,In;

wire Out;
wire [1:0] State;


fsm0101nov uut(.Clk(Clk),.rst(rst),.In(In),.Out(Out),.State(State));
initial begin
    $dumpfile("fsm0101novtb.vcd");
    $dumpvars(0,fsm0101novtb);
    Clk=0;
    rst=1;
    #10;
    rst=0;
    #10;
    In=0; #20; In=0; #20; In=0; #20; In=1; #20; In=0; #20; In=1; #20;

    In=0; #20; In=1; #20; In=0; #20; In=1; #20; In=0; #20; In=0; #20;
    #500;
    $finish;
end
always #10 Clk = ~Clk;
endmodule