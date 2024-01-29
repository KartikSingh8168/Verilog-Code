module counter32(in,rst,clk,out,rt);
input clk,rst,in;
output reg rt;
output reg [4:0] out;

always @(posedge clk) begin
    if(in == 1) begin
    tff A(.t(1),.rst(rst),.clk(clk),.q(out[0]));
    tff B(.t(1),.rst(rst),.clk(clk),.q(out[1]));
    tff C(.t(1),.rst(rst),.clk(clk),.q(out[2]));
    tff D(.t(1),.rst(rst),.clk(clk),.q(out[3]));
    tff D(.t(1),.rst(rst),.clk(clk),.q(out[4]));
     if(out == 31) begin 
     out <= 5'b00000;
     rt <= 1'b1;
     end
  else begin
     rt <= 1'b0;
    end
    end
end
endmodule

//tanish has added the command
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

