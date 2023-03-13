module frqby3(ck,rs,Q,f);
input ck,rs;
output [1:0]Q;
wire [1:0]Qn;
output f;
wire w;
wire w1;
assign w = (~Q[0]) && (~Q[1]);
// assign w = Qn[0] && Qn[1]; //why ??? 
//wire cant store value as we need to define it as wire to use Qbar 
//qbar will not work as parameters are only ck,rs,Q 
//have to use compliment of Q to use as Qbar if want to use
//have to define it as output...............
//instantaiting dff
and r(w,(~Q[0]),(~Q[1]));
dff A(.d(w),.clk(ck),.rst(rs),.q(Q[0]),.qn(Qn[0]));
dff B(.d(Q[0]),.clk(ck),.rst(rs),.q(Q[1]),.qn(Qn[1]));
dff1 C(.d(Q[1]),.clk(ck),.q(w1));
or T(f,w1,Q[1]);
//carefully assign value dont mistake again you fool
endmodule

module dff1(d,clk,q);
input clk,d;
output reg q;

always @(negedge clk ) begin
        q<=d;
end
    
endmodule


//qbar taking in module is not going to work 
//as verilog doesn't consider the value that is in 
//module instantiation
module dff(d,clk,rst,q,qn);
input d,clk,rst;
output reg q,qn;

always @(posedge clk or posedge rst) begin
    if(rst == 1) begin
        q<=1'b0;
    end
    else begin
        q<=d;
    end
    qn <= ~q;
end

endmodule