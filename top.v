module top(A, B, quotient, remainder, clk1, rst_n, in_valid, out_valid);
input clk1, rst_n;
input [7:0] A;
input [7:0] B;
input in_valid;
output reg out_valid;
output reg [7:0] quotient;
output reg [7:0] remainder;

reg [7:0] input_A;
reg [7:0] input_B;
reg [7:0] quotient_reg;
reg [7:0] remainder_reg;
reg [2:0] c_state, n_state;
reg [3:0] count, i;
parameter IDLE = 3'b000;
parameter START = 3'b001;
parameter Q1 = 3'b010;
parameter Q0 = 3'b011;
parameter OUTPUT = 3'b100;

always @(posedge clk1 or negedge rst_n) begin
if(!rst_n)begin
	input_A <= 0;
	input_B <= 0;
end
else begin
	if(in_valid)begin
	input_A <= A;
	input_B <= B;
	end
end
end

always@(posedge clk1 or negedge rst_n)begin
	if(!rst_n) c_state<=IDLE;
	else c_state<=n_state;
end




always @(*) begin
	if(!rst_n) begin
		n_state = IDLE;
	end
	
	else begin
		case(c_state)
			
			IDLE: begin
			
				if(in_valid) n_state = START;
				else n_state = IDLE;
			end
			
			START: begin
			
				if(remainder_reg >= input_B) n_state = Q1;
				else n_state = Q0;
			end
			
			Q1: begin
			
				if(count==9) n_state = OUTPUT;
				else n_state = START;	
			end
			
			Q0: begin
			
				if(count==9) n_state = OUTPUT;
				else n_state = START;	
			end
			
			OUTPUT:begin
				n_state = IDLE;
			
			end
			
			default: n_state = c_state;
		endcase			
	end
end



always @(posedge clk1 or negedge rst_n) begin
	if(!rst_n) count <= 0;
	
	else begin
		if(n_state==IDLE) count<=0;
		else if(n_state == START) begin
			count <= count + 1;
		end
		else count<=count;
	end
end

always @(posedge clk1 or negedge rst_n) begin
	if(!rst_n) quotient<=0;
	else begin
		if(n_state==IDLE) quotient<=0;
		else if(n_state==OUTPUT) quotient<=quotient_reg;
		else quotient<=quotient;
	end
end

always @(posedge clk1 or negedge rst_n) begin
	if(!rst_n) remainder<=0;
	else begin
		if(n_state==IDLE) remainder<=0;
		else if(n_state==OUTPUT) remainder<=remainder_reg;
		else remainder<=remainder;
	end
end

always @(posedge clk1 or negedge rst_n) begin
	if(!rst_n) quotient_reg<=0;
	else begin
		if(n_state==IDLE) quotient_reg<=0;
		else if(n_state == Q1) quotient_reg[9-count] <= 1;
		else if(n_state == Q0) quotient_reg[9-count] <= 0;
		else quotient_reg <= quotient_reg;
	end
end

always @(posedge clk1 or negedge rst_n) begin
	if(!rst_n) remainder_reg<=0;
	else begin
		if(n_state==IDLE) remainder_reg<=0;
		else if(n_state == START) begin
			if (count == 0) remainder_reg <= 0;
			else remainder_reg <= {remainder_reg[6:0], input_A[8-count]};
		end
		else if(n_state == Q1) remainder_reg<=remainder_reg - input_B;
		else if(n_state == Q0) remainder_reg<=remainder_reg;
	end
end

always @(posedge clk1 or negedge rst_n)begin
	if(!rst_n) out_valid<=0;
	else begin
		if(n_state == OUTPUT) out_valid<=1;
		else out_valid <= 0;
	end

end
		
endmodule

