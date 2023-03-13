//Serial In Serial Out Shift Register
module shiftregister(Din,Clk,Rst,Dout); 
input Din,Clk,Rst;
output Dout;
wire w,w1,w2;

dff A(.Din(Din),.Clk(Clk),.Rst(Rst),.Q(w));
dff B(.Din(w),.Clk(Clk),.Rst(Rst),.Q(w1));
dff C(.Din(w1),.Clk(Clk),.Rst(Rst),.Q(w2));
dff D(.Din(w2),.Clk(Clk),.Rst(Rst),.Q(Dout));


endmodule

module dff(Din,Clk,Rst,Q);
input Din,Clk,Rst;
output reg Q;

always @(posedge Clk ) begin

    if(Rst == 1 ) begin
     Q <= 1'b0; 
     end
     else begin
     Q <= Din; 
     end

end
endmodule