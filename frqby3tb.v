`timescale 1ps/1ps
`include "frqby3.v"

module frqby3tb;
    reg ck,rs;
    wire [1:0]Q;
    wire f;

    frqby3 uut(.ck(ck),.rs(rs),.Q(Q),.f(f));
    initial begin
        $dumpfile("frqby3tb.vcd");
        $dumpvars(0,frqby3tb);
        ck=1;
        rs=1;
        #10;
        rs=0;
        #10;
        #300;
        $finish;

    end
   always #10 ck = ~ck;

endmodule