/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ MIN_2 module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module MIN_2(clk,rst,d0,d1,d2,d3,d4,d5,d6,d7,w0,w1,w2,w3,w4,w5,w6,w7,index0,index1,index2,index3,index4,index5,index6,index7,X_c,Y_c,weight_c);

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
	input [2:0] index0;
	input [2:0] index1;
	input [2:0] index2;
	input [2:0] index3;
	input [2:0] index4;
	input [2:0] index5;
	input [2:0] index6;
	input [2:0] index7;

// ---------------------- output  ---------------------- //
	output [2:0] X_c;
	output [2:0] Y_c;
	output [23:0] weight_c;
	
// ---------------------- Write down Your design below  ---------------------- //

wire [10:0] d_temp1, d_temp2, d_temp3, d_temp4, d_temp5, d_temp6;
wire [2:0]  X_c_temp1, X_c_temp2, X_c_temp3, X_c_temp4, X_c_temp5, X_c_temp6;
wire [2:0]  Y_c_temp1, Y_c_temp2, Y_c_temp3, Y_c_temp4, Y_c_temp5, Y_c_temp6;
wire [23:0] w_temp1, w_temp2, w_temp3, w_temp4, w_temp5, w_temp6;

assign d_temp1 = (d0 < d1)? d0 : d1;
assign d_temp2 = (d2 < d3)? d2 : d3;
assign d_temp3 = (d4 < d5)? d4 : d5;
assign d_temp4 = (d6 < d7)? d6 : d7;
assign d_temp5 = (d_temp1 < d_temp2)? d_temp1 : d_temp2;
assign d_temp6 = (d_temp3 < d_temp4)? d_temp3 : d_temp4;

//找出min位於哪一個VEP中
assign X_c_temp1 = (d0 < d1)? 3'd0 : 3'd1;
assign X_c_temp2 = (d2 < d3)? 3'd2 : 3'd3;
assign X_c_temp3 = (d4 < d5)? 3'd4 : 3'd5;
assign X_c_temp4 = (d6 < d7)? 3'd6 : 3'd7;
assign X_c_temp5 = (d_temp1 < d_temp2)? X_c_temp1 : X_c_temp2;
assign X_c_temp6 = (d_temp3 < d_temp4)? X_c_temp3 : X_c_temp4;
assign X_c       = (d_temp5 < d_temp6)? X_c_temp5 : X_c_temp6;
 
//input的index0~7代表各個VEP最小距離的位置，即為Y座標
assign Y_c_temp1 = (d0 < d1)? index0 : index1;
assign Y_c_temp2 = (d2 < d3)? index2 : index3;
assign Y_c_temp3 = (d4 < d5)? index4 : index5;
assign Y_c_temp4 = (d6 < d7)? index6 : index7;
assign Y_c_temp5 = (d_temp1 < d_temp2)? Y_c_temp1 : Y_c_temp2;
assign Y_c_temp6 = (d_temp3 < d_temp4)? Y_c_temp3 : Y_c_temp4;
assign Y_c       = (d_temp5 < d_temp6)? Y_c_temp5 : Y_c_temp6;

assign w_temp1  = (d0 < d1)? w0 : w1;
assign w_temp2  = (d2 < d3)? w2 : w3;
assign w_temp3  = (d4 < d5)? w4 : w5;
assign w_temp4  = (d6 < d7)? w6 : w7;
assign w_temp5  = (d_temp1 < d_temp2)? w_temp1 : w_temp2;
assign w_temp6  = (d_temp3 < d_temp4)? w_temp3 : w_temp4;
assign weight_c = (d_temp5 < d_temp6)? w_temp5 : w_temp6;

endmodule

