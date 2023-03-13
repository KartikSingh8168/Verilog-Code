module frqby23 (clk,rst,f,T,m,k);
    input clk,rst;
    output [1:0] T;
    output f,m,k;
    wire w,dout,dd,ddout;
    assign w = (~T[0]) && (~T[1]);

dff A(.d(T[1]),.clk(clk),.rst(rst),.q(T[0]));
dff B(.d(w),.clk(clk),.rst(rst),.q(T[1]));


dff1 C(.d(T[0]),.clk(clk),.q(dout));
or R(f,T[0],dout);
//multiplier circuit by 2

dff1 D(.d(f),.clk(clk),.q(k));
xor Y(m,f,k);
endmodule


module dff1(d,clk,q);
input d,clk;
output reg q;

always @(negedge clk) begin
    q <= d;
end
endmodule






//dff with pos clk pos rst
module dff(d,clk,rst,q);
input d,clk,rst;
output reg q;

always @(posedge clk or posedge rst) begin
    if(rst == 1) begin
        q<=1'b0;
    end
    else begin 
        q<=d;
    end
    
end
endmodule