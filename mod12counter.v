module mod12counter (j,k,cllk,reset,A);
    input reset,cllk;
    output [3:0] A;
    wire [3:0] qn;
    input j,k;
    wire r;
    wor rst; //jk module
    assign rst = r;
    assign rst = reset;
    // assign r = A[2] && A[3];
    and o(r,A[2],A[3]);
    //  and o(r,A[0],A[1]);
    // assign reset = r;
   jkflipflop A1(.j(j),.k(k),.clk(cllk),.rst(rst),.q(A[0]),.qn(qn[0]));
   jkflipflop A2(.j(j),.k(k),.clk(A[0]),.rst(rst),.q(A[1]),.qn(qn[1]));
   jkflipflop A3(.j(j),.k(k),.clk(A[1]),.rst(rst),.q(A[2]),.qn(qn[2]));
   jkflipflop A4(.j(j),.k(k),.clk(A[2]),.rst(rst),.q(A[3]),.qn(qn[3]));
    
endmodule 





module jkflipflop(j,k,clk,rst,q,qn);
input j,k;
input rst,clk;
output reg q,qn;
//use blocking as non-blocking will assign value at posedge but we what 
//value updated values after clk cycle.........
always @(negedge clk or posedge rst) begin //posedge rst
    if (rst == 1) begin
        q <= 1'b0;
    end
    else begin
        if ( j == 0 && k == 0) begin
            q<=q;
        end
        else if ( j == 0 && k == 1) begin
            q<=1'b0;
        end
        else if ( j == 1 && k == 0) begin
            q<=1'b1;
        end
        else if ( j == 1 && k == 1) begin
            q<=~q;
        end
        // case({j,k}) 
        //     2'b00: q = q;
        //     2'b01: q = 1'b0;
        //     2'b10: q = 1'b1;
        //     2'b11: q = qn;
        // endcase
    end
      qn <= ~q;
end
endmodule