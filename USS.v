/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------- USS module ---------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module USS(clk, rst, X_in, X_c, Y_c, neighbor_sel);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [2:0] X_in;
	input [2:0] X_c;
	input [2:0] Y_c;
	
// ---------------------- output  ---------------------- //
	output reg [15:0] neighbor_sel;
	
// ---------------------- Write down Your design below  ---------------------- //
always@(*)begin
	if(X_c==X_in)begin
		case(Y_c)
			3'd0 : neighbor_sel = 16'b00_01_10_11_11_11_11_11;
			3'd1 : neighbor_sel = 16'b01_00_01_10_11_11_11_11;
			3'd2 : neighbor_sel = 16'b10_01_00_01_10_11_11_11;
			3'd3 : neighbor_sel = 16'b11_10_01_00_01_10_11_11;
			3'd4 : neighbor_sel = 16'b11_11_10_01_00_01_10_11;
			3'd5 : neighbor_sel = 16'b11_11_11_10_01_00_01_10;
			3'd6 : neighbor_sel = 16'b11_11_11_11_10_01_00_01;
			3'd7 : neighbor_sel = 16'b11_11_11_11_11_10_01_00;
		endcase
	end
	else if( ((X_in>X_c)&&(X_in-X_c==3'd1)) || ((X_c>X_in)&&(X_c-X_in==3'd1)))begin
		case(Y_c)
			3'd0 : neighbor_sel = 16'b01_01_10_11_11_11_11_11;
			3'd1 : neighbor_sel = 16'b01_01_01_10_11_11_11_11;
			3'd2 : neighbor_sel = 16'b10_01_01_01_10_11_11_11;
			3'd3 : neighbor_sel = 16'b11_10_01_01_01_10_11_11;
			3'd4 : neighbor_sel = 16'b11_11_10_01_01_01_10_11;
			3'd5 : neighbor_sel = 16'b11_11_11_10_01_01_01_10;
			3'd6 : neighbor_sel = 16'b11_11_11_11_10_01_01_01;
			3'd7 : neighbor_sel = 16'b11_11_11_11_11_10_01_01;
		endcase
	end
	else if(((X_in>X_c)&&(X_in-X_c==3'd2)) || ((X_c>X_in)&&(X_c-X_in==3'd2)))begin
		case(Y_c)
			3'd0 : neighbor_sel = 16'b10_10_10_11_11_11_11_11;
			3'd1 : neighbor_sel = 16'b10_10_10_10_11_11_11_11;
			3'd2 : neighbor_sel = 16'b10_10_10_10_10_11_11_11;
			3'd3 : neighbor_sel = 16'b11_10_10_10_10_10_11_11;
			3'd4 : neighbor_sel = 16'b11_11_10_10_10_10_10_11;
			3'd5 : neighbor_sel = 16'b11_11_11_10_10_10_10_10;
			3'd6 : neighbor_sel = 16'b11_11_11_11_10_10_10_10;
			3'd7 : neighbor_sel = 16'b11_11_11_11_11_10_10_10;
		endcase
	end
	else begin
		neighbor_sel = 16'b11_11_11_11_11_11_11_11;
	end
end

endmodule

