//implement in xilinx for confirmation :) 
module mod_10_counter(clk,reset,Count_Out);
input clk,reset;
output [3:0] Count_Out;
wor rt;
wire r;
assign rt = reset;
assign rt = r;
    and R(r,Count_Out[1],Count_Out[3]);

jkff A1(.j(1'b1),.k(1'b1),.clk(clk),.rst(rt),.q(Count_Out[0]));
jkff A2(.j(1'b1),.k(1'b1),.clk(Count_Out[0]),.rst(rt),.q(Count_Out[1]));
jkff A3(.j(1'b1),.k(1'b1),.clk(Count_Out[1]),.rst(rt),.q(Count_Out[2]));
jkff A4(.j(1'b1),.k(1'b1),.clk(Count_Out[2]),.rst(rt),.q(Count_Out[3]));


endmodule



module jkff(j,k,clk,rst,q);
input j,k,clk,rst;
output reg q;
initial begin
 q <= 1'b0;
end

always @(negedge clk or posedge rst ) begin
    if( rst == 1) begin
        q <= 1'b0;
    end
    else begin
    if( j == 0 && k == 0) begin
        q <= q;
    end
    else if( j == 0 && k == 1) begin
        q <= 1'b0;
    end
    else if( j == 1 && k == 0) begin
        q <= 1'b1;
    end
    else if( j == 1 && k == 1) begin
        q <= ~q;
    end
    end

end
endmodule


//using concatenation
// case({j,k})
//  2'b00: q <= q;
//  2'b01: q <= 0;
//  2'b10: q <= 1;
//  2'b11: q <= ~q;
// endcase
//where to take reg and where to not 