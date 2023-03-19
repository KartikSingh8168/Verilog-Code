`timescale 1ns/1ns
`include "fsm_0101.v"

module fsm_0101tb;
reg In,Clk,rst;
wire Out;
wire [1:0] state;

fsm_0101 uut(.In(In),.Clk(Clk),.rst(rst),.state(state),.Out(Out));

initial begin
    $dumpfile("fsm_0101tb.vcd");
    $dumpvars(0,fsm_0101tb);
    Clk=0;
    rst=1;
    #10;
    rst=0;
    #10;
    In=0; #20; In=0; #20; In=0; #20; In=1; #20; In=0; #20; In=1; #20;
    In=0;
    #50;
    $finish;
    
end

always #10 Clk = ~Clk;

endmodule