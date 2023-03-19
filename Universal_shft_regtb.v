`timescale 1ns/1ns
`include "Universal_shft_reg.v"

module Universal_shft_regtb;
reg Rst,Clk;
reg S1,S0;
reg L,R;
reg [3:0] Datain;
wire [3:0] DataOut;
//input reg 
//output wire
Universal_shft_reg uut(.Rst(Rst),.Clk(Clk),.S1(S1),.S0(S0),.L(L),.R(R),.Datain(Datain),.DataOut(DataOut));
initial begin
    Rst=1;
    Clk=0;
    S1=0;
    S0=0;
    L=0;
    R=0;
end

initial begin
    $dumpfile("Universal_shft_regtb.vcd");
    $dumpvars(0,Universal_shft_regtb);
    #10;
    Rst = 0;
    #10; // data loading
    S0=1; S1=1;
    #10;
    Datain=4'b0101;
    #10;
    Rst=1;
    #10;//left shifting
     Rst = 0;
    S1=1; S0=0;
    #10;
    L = 1; #20; L = 1; #20; L = 0; #20; L = 1;
    #50;
    Rst=1;
    #10;
    Rst = 0;
    S1=0; S0=1;
    #10;
    R = 1; #20; R = 1; #20; R = 0; #20; R = 1;
    #100;
    $finish;
end

always #10 Clk=~Clk;
endmodule