module synccount(clk,rst,out);
input clk,rst;
output [2:0] out;
wire w,w1;

and O(w,out[0],out[1]);
or T(w1,w,out[2]);      

tff A(.t(w1),.clk(clk),.rst(rst),.q(out[2]));
tff B(.t(out[0]),.clk(clk),.rst(rst),.q(out[1]));
tff C(.t(~out[2]),.clk(clk),.rst(rst),.q(out[0]));
endmodule

module tff(t,clk,rst,q);
input clk,rst,t;
output reg q;
always@(posedge clk or posedge rst) begin
if(rst == 1) begin
    q <= 1'b0;
end
else begin
  if(t==1)
   q <= ~q;
   else 
   q <= q;
end
end
endmodule
