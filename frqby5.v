module frqby5(clk,rst,f,Q);
input clk,rst;
output [2:0]Q;
output f;
wire w,w1,w2,w3,r;
wire dout;
assign w = Q[1] && Q[0];
assign w1 = Q[1] ^ Q[0];
assign w2 = (~Q[2]) && (~Q[0]);
assign w3 = Q[1] && (~Q[0]);
assign r = w2 || w3;
// and o(w,Q[1],Q[0]);
// xor y(w1,Q[1],Q[0]);
// and o1(w2,(~Q[2]),(~Q[0]));
// and y1(w3,Q[1], (~Q[0]));
// or u(r,w2,w3);

dff A(.d(r),.clk(clk),.rst(rst),.q(Q[0]));
dff B(.d(w1),.clk(clk),.rst(rst),.q(Q[1]));
dff C(.d(w),.clk(clk),.rst(rst),.q(Q[2]));
dff1 W(.d(~Q[1]),.clk(clk),.q(dout));
and tt(f,dout,(~Q[1]));

endmodule



module dff1(d,clk,q);
input d,clk;
output reg q;

always @(negedge clk ) begin
  q<=d;
end
  
endmodule


module dff(d,clk,rst,q);
input clk,rst,d;
output reg q;
always@(posedge clk or posedge rst) begin
if(rst==1) begin
    q<=1'b0;
end
else begin
  q<=d;
end

end
endmodule