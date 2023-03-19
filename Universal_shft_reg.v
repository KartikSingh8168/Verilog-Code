module Universal_shft_reg (
    input Rst,
    input Clk,
    input S1,S0,
    input L,R,
    input [3:0] Datain,
    output [3:0] DataOut 
);
    

    Shft W0(.S1(S1),.S0(S0),.Clr(Rst),.Clk(Clk),.A3(Datain[3]),.A2(DataOut[2]),.A1(R),.A0(DataOut[3]),.Out(DataOut[3]));
    Shft W1(.S1(S1),.S0(S0),.Clr(Rst),.Clk(Clk),.A3(Datain[2]),.A2(DataOut[1]),.A1(DataOut[3]),.A0(DataOut[2]),.Out(DataOut[2]));
    Shft W2(.S1(S1),.S0(S0),.Clr(Rst),.Clk(Clk),.A3(Datain[1]),.A2(DataOut[0]),.A1(DataOut[2]),.A0(DataOut[1]),.Out(DataOut[1]));
    Shft W3(.S1(S1),.S0(S0),.Clr(Rst),.Clk(Clk),.A3(Datain[0]),.A2(L),.A1(DataOut[1]),.A0(DataOut[0]),.Out(DataOut[0]));

 

endmodule

module Shft(S1,S0,Clr,Clk,A3,A2,A1,A0,Out);
input S1,S0,Clr,Clk;
input A3,A2,A1,A0;
output Out;
wire Cont;

mux41 OP(.S1(S1),.S0(S0),.Din3(A3),.Din2(A2),.Din1(A1),.Din0(A0),.Dout(Cont));
dff KO(.D(Cont),.Rst(Clr),.Clk(Clk),.Q(Out));

endmodule

module dff(
    input D,
    input Rst,
    input Clk,
    output reg Q
);
always @(posedge Clk) begin
  if (Rst == 1) begin
    Q <= 0;
  end
  else begin
    Q <= D;
  end
end
endmodule

module mux41(S1,S0,Din3,Din2,Din1,Din0,Dout);
input S1,S0;
input Din3,Din2,Din1,Din0;
output Dout;

assign Dout = S1 ?(S0 ? Din3 : Din2):(S0 ? Din1 : Din0);

endmodule
