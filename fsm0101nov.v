//mealy machine
module fsm0101nov (
    input Clk,
    input rst,
    input In,
    output reg Out,
    output reg [1:0] State
);

parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;
parameter [1:0] S3 = 2'b11;

always @(posedge Clk or posedge rst ) begin
    if (rst == 1) begin
        State <= S0;
        Out <= 1'b0;
    end
    else begin 
        case(State)
        S0: begin
            if(In == 0) begin
                State <= S1;
                Out <= 1'b0;
            end
            else begin
                State <= S0;
                Out <= 1'b0;
            end
            end
        S1: begin
            if(In == 1) begin
                State <= S2;
                Out <= 1'b0;
            end
            else begin
                State <= S1;
                Out <= 1'b0;
            end
            end
        S2: begin
            if(In == 0) begin
                State <= S3;
                Out <= 1'b0;
            end
            else begin
                State <= S0;
                Out <= 1'b0;
            end
            end
        S3: begin
            if(In == 1) begin
                State <= S1;
                Out <= 1'b1;
            end
            else if(In == 0) begin
                State <= S0;
                Out <= 1'b0;
            end
            end

        endcase

    end
end
endmodule