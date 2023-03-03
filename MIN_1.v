/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ MIN_1 module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module MIN_1(clk,rst,d0,d1,d2,d3,d4,d5,d6,d7,w0,w1,w2,w3,w4,w5,w6,w7,d_min,d_min_index,w_min);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [10:0] d0;
	input [10:0] d1;
	input [10:0] d2;
	input [10:0] d3;
	input [10:0] d4;
	input [10:0] d5;
	input [10:0] d6;
	input [10:0] d7;
	input [23:0] w0;
	input [23:0] w1;
	input [23:0] w2;
	input [23:0] w3;
	input [23:0] w4;
	input [23:0] w5;
	input [23:0] w6;
	input [23:0] w7;
	
// ---------------------- output  ---------------------- //
	output [10:0] d_min;
	output [2:0]  d_min_index;
	output [23:0] w_min;         // ? 

// ---------------------- Write down Your design below  ---------------------- //

wire [10:0] d_temp1, d_temp2, d_temp3, d_temp4, d_temp5, d_temp6;
wire [2:0]  index_temp1, index_temp2, index_temp3, index_temp4, index_temp5, index_temp6;
wire [23:0] w_temp1, w_temp2, w_temp3, w_temp4, w_temp5, w_temp6;

assign d_temp1 = (d0 < d1)? d0 : d1;
assign d_temp2 = (d2 < d3)? d2 : d3;
assign d_temp3 = (d4 < d5)? d4 : d5;
assign d_temp4 = (d6 < d7)? d6 : d7;
assign d_temp5 = (d_temp1 < d_temp2)? d_temp1 : d_temp2;
assign d_temp6 = (d_temp3 < d_temp4)? d_temp3 : d_temp4;
assign d_min   = (d_temp5 < d_temp6)? d_temp5 : d_temp6;

assign index_temp1 = (d0 < d1)? 3'd0 : 3'd1;
assign index_temp2 = (d2 < d3)? 3'd2 : 3'd3;
assign index_temp3 = (d4 < d5)? 3'd4 : 3'd5;
assign index_temp4 = (d6 < d7)? 3'd6 : 3'd7;
assign index_temp5 = (d_temp1 < d_temp2)? index_temp1 : index_temp2;
assign index_temp6 = (d_temp3 < d_temp4)? index_temp3 : index_temp4;
assign d_min_index = (d_temp5 < d_temp6)? index_temp5 : index_temp6;

assign w_temp1 = (d0 < d1)? w0 : w1;
assign w_temp2 = (d2 < d3)? w2 : w3;
assign w_temp3 = (d4 < d5)? w4 : w5;
assign w_temp4 = (d6 < d7)? w6 : w7;
assign w_temp5 = (d_temp1 < d_temp2)? w_temp1 : w_temp2;
assign w_temp6 = (d_temp3 < d_temp4)? w_temp3 : w_temp4;
assign w_min   = (d_temp5 < d_temp6)? w_temp5 : w_temp6;



endmodule

