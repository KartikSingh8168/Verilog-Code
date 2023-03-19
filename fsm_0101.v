//mealy machine
module fsm_0101(In,Clk,rst,state,Out);
input In;
input Clk,rst;
output reg Out;
output reg [1:0] state;

parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;
parameter [1:0] S3 = 2'b11;

always @(posedge Clk or posedge rst) begin
  if(rst == 1)begin
    state <= S0;
    Out <= 1'b0;
  end
  else begin 
case(state)
  S0:begin 
     if (In == 0)begin
        state <= S1;
        Out <= 1'b0;
     end
     else begin
        state <= S0;
        Out <= 1'b0;
     end
     end
  S1: begin
     if (In == 1) begin
        state <= S2;
        Out <= 1'b0;
     end
     else begin
        state <= S1;
        Out <= 1'b0;
     end
  end

   S2: begin
     if (In == 0) begin
        state <= S3;
        Out <= 1'b0;
     end
     else begin
        state <= S1;
        Out <= 1'b0;
     end
  end

   S3: begin
     if (In == 1) begin
        state <= S2;
        Out <= 1'b1;
     end
     else begin
        state <= S1;
        Out <= 1'b0;
     end
     end
endcase

  end
end


endmodule

//first consider the In the will change the state 
//to other state than go for the one that will not change
//during if and else condition of states in case statement