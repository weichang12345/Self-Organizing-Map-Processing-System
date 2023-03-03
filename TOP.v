/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ TOP module ----------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

`include "VEP.v"
`include "MIN_1.v"
`include "MIN_2.v"
`include "USS.v"
`include "Controller.v"

module TOP(clk, rst, RAM_IF_Q, RAM_W_Q, RAM_RESULT_Q, RAM_IF_OE, RAM_IF_WE, RAM_IF_A, RAM_IF_D,
		RAM_W_OE, RAM_W_WE, RAM_W_A, RAM_W_D, RAM_RESULT_OE, RAM_RESULT_WE, RAM_RESULT_A, RAM_RESULT_D, done);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [23:0] RAM_IF_Q;
	input [23:0] RAM_W_Q;
	input [23:0] RAM_RESULT_Q;
	
// ---------------------- output  ---------------------- //	
	output RAM_IF_OE;
	output RAM_IF_WE;
	output [17:0] RAM_IF_A;
	output [23:0] RAM_IF_D;
	output RAM_W_OE;
	output RAM_W_WE;
	output [17:0] RAM_W_A;
	output [23:0] RAM_W_D;
	output RAM_RESULT_OE;
	output RAM_RESULT_WE;
	output [17:0] RAM_RESULT_A;
	output [23:0] RAM_RESULT_D;
	output done;

// ---------------------- Write down Your design below  ---------------------- //
wire D_update_wire, W_update_wire;
wire [10:0] d_primary [63:0];
wire [23:0] w_primary [63:0];
wire [10:0] d_min_wire [7:0];
wire [2:0] index_wire [7:0];
wire [23:0] w_min_wire [7:0];
wire [2:0] X_c_wire;
wire [2:0] Y_c_wire;
wire [15:0] neighbor_sel_wire [7:0];
//wire [17:0] RAM_RESULT_A_wire;


Controller controller0(.clk(clk), 
                       .rst(rst), 
					   .D_update(D_update_wire), 
					   .W_update(W_update_wire), 
					   .RAM_IF_A(RAM_IF_A), 
					   .RAM_IF_OE(RAM_IF_OE), 
					   .RAM_W_A(RAM_W_A), 
					   .RAM_W_WE(RAM_W_WE), 
					   .RAM_RESULT_A(RAM_RESULT_A), 
					   .RAM_RESULT_WE(RAM_RESULT_WE), 
					   .done(done)
);

VEP VEP0(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[0]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[0]), .d1(d_primary[1]), .d2(d_primary[2]), .d3(d_primary[3]), .d4(d_primary[4]), .d5(d_primary[5]), .d6(d_primary[6]), .d7(d_primary[7]), 
		 .w0(w_primary[0]), .w1(w_primary[1]), .w2(w_primary[2]), .w3(w_primary[3]), .w4(w_primary[4]), .w5(w_primary[5]), .w6(w_primary[6]), .w7(w_primary[7])
);

VEP VEP1(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[1]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[8]), .d1(d_primary[9]), .d2(d_primary[10]), .d3(d_primary[11]), .d4(d_primary[12]), .d5(d_primary[13]), .d6(d_primary[14]), .d7(d_primary[15]), 
		 .w0(w_primary[8]), .w1(w_primary[9]), .w2(w_primary[10]), .w3(w_primary[11]), .w4(w_primary[12]), .w5(w_primary[13]), .w6(w_primary[14]), .w7(w_primary[15])
);

VEP VEP2(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[2]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[16]), .d1(d_primary[17]), .d2(d_primary[18]), .d3(d_primary[19]), .d4(d_primary[20]), .d5(d_primary[21]), .d6(d_primary[22]), .d7(d_primary[23]), 
		 .w0(w_primary[16]), .w1(w_primary[17]), .w2(w_primary[18]), .w3(w_primary[19]), .w4(w_primary[20]), .w5(w_primary[21]), .w6(w_primary[22]), .w7(w_primary[23])
);

VEP VEP3(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[3]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[24]), .d1(d_primary[25]), .d2(d_primary[26]), .d3(d_primary[27]), .d4(d_primary[28]), .d5(d_primary[29]), .d6(d_primary[30]), .d7(d_primary[31]), 
		 .w0(w_primary[24]), .w1(w_primary[25]), .w2(w_primary[26]), .w3(w_primary[27]), .w4(w_primary[28]), .w5(w_primary[29]), .w6(w_primary[30]), .w7(w_primary[31])
);

VEP VEP4(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[4]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[32]), .d1(d_primary[33]), .d2(d_primary[34]), .d3(d_primary[35]), .d4(d_primary[36]), .d5(d_primary[37]), .d6(d_primary[38]), .d7(d_primary[39]), 
		 .w0(w_primary[32]), .w1(w_primary[33]), .w2(w_primary[34]), .w3(w_primary[35]), .w4(w_primary[36]), .w5(w_primary[37]), .w6(w_primary[38]), .w7(w_primary[39])
);

VEP VEP5(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[5]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[40]), .d1(d_primary[41]), .d2(d_primary[42]), .d3(d_primary[43]), .d4(d_primary[44]), .d5(d_primary[45]), .d6(d_primary[46]), .d7(d_primary[47]), 
		 .w0(w_primary[40]), .w1(w_primary[41]), .w2(w_primary[42]), .w3(w_primary[43]), .w4(w_primary[44]), .w5(w_primary[45]), .w6(w_primary[46]), .w7(w_primary[47])
);

VEP VEP6(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[6]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[48]), .d1(d_primary[49]), .d2(d_primary[50]), .d3(d_primary[51]), .d4(d_primary[52]), .d5(d_primary[53]), .d6(d_primary[54]), .d7(d_primary[55]), 
		 .w0(w_primary[48]), .w1(w_primary[49]), .w2(w_primary[50]), .w3(w_primary[51]), .w4(w_primary[52]), .w5(w_primary[53]), .w6(w_primary[54]), .w7(w_primary[55])
);

VEP VEP7(.clk(clk), 
         .rst(rst), 
		 .W_update(W_update_wire), 
		 .D_update(D_update_wire), 
		 .neighbor_sel(neighbor_sel_wire[7]), 
		 .pixel(RAM_IF_Q),
		 .d0(d_primary[56]), .d1(d_primary[57]), .d2(d_primary[58]), .d3(d_primary[59]), .d4(d_primary[60]), .d5(d_primary[61]), .d6(d_primary[62]), .d7(d_primary[63]), 
		 .w0(w_primary[56]), .w1(w_primary[57]), .w2(w_primary[58]), .w3(w_primary[59]), .w4(w_primary[60]), .w5(w_primary[61]), .w6(w_primary[62]), .w7(w_primary[63])
);

MIN_1 MIN_1_0(.clk(clk),
              .rst(rst),
			  .d0(d_primary[0]), .d1(d_primary[1]), .d2(d_primary[2]), .d3(d_primary[3]), .d4(d_primary[4]), .d5(d_primary[5]), .d6(d_primary[6]), .d7(d_primary[7]),
			  .w0(w_primary[0]), .w1(w_primary[1]), .w2(w_primary[2]), .w3(w_primary[3]), .w4(w_primary[4]), .w5(w_primary[5]), .w6(w_primary[6]), .w7(w_primary[7]),
			  .d_min(d_min_wire[0]),
			  .d_min_index(index_wire[0]),
			  .w_min(w_min_wire[0])
);

MIN_1 MIN_1_1(.clk(clk),
              .rst(rst),
			  .d0(d_primary[8]), .d1(d_primary[9]), .d2(d_primary[10]), .d3(d_primary[11]), .d4(d_primary[12]), .d5(d_primary[13]), .d6(d_primary[14]), .d7(d_primary[15]),
			  .w0(w_primary[8]), .w1(w_primary[9]), .w2(w_primary[10]), .w3(w_primary[11]), .w4(w_primary[12]), .w5(w_primary[13]), .w6(w_primary[14]), .w7(w_primary[15]),
			  .d_min(d_min_wire[1]),
			  .d_min_index(index_wire[1]),
			  .w_min(w_min_wire[1])
);

MIN_1 MIN_1_2(.clk(clk),
              .rst(rst),
			  .d0(d_primary[16]), .d1(d_primary[17]), .d2(d_primary[18]), .d3(d_primary[19]), .d4(d_primary[20]), .d5(d_primary[21]), .d6(d_primary[22]), .d7(d_primary[23]),
			  .w0(w_primary[16]), .w1(w_primary[17]), .w2(w_primary[18]), .w3(w_primary[19]), .w4(w_primary[20]), .w5(w_primary[21]), .w6(w_primary[22]), .w7(w_primary[23]),
			  .d_min(d_min_wire[2]),
			  .d_min_index(index_wire[2]),
			  .w_min(w_min_wire[2])
);

MIN_1 MIN_1_3(.clk(clk),
              .rst(rst),
			  .d0(d_primary[24]), .d1(d_primary[25]), .d2(d_primary[26]), .d3(d_primary[27]), .d4(d_primary[28]), .d5(d_primary[29]), .d6(d_primary[30]), .d7(d_primary[31]),
			  .w0(w_primary[24]), .w1(w_primary[25]), .w2(w_primary[26]), .w3(w_primary[27]), .w4(w_primary[28]), .w5(w_primary[29]), .w6(w_primary[30]), .w7(w_primary[31]),
			  .d_min(d_min_wire[3]),
			  .d_min_index(index_wire[3]),
			  .w_min(w_min_wire[3])
);

MIN_1 MIN_1_4(.clk(clk),
              .rst(rst),
			  .d0(d_primary[32]), .d1(d_primary[33]), .d2(d_primary[34]), .d3(d_primary[35]), .d4(d_primary[36]), .d5(d_primary[37]), .d6(d_primary[38]), .d7(d_primary[39]),
			  .w0(w_primary[32]), .w1(w_primary[33]), .w2(w_primary[34]), .w3(w_primary[35]), .w4(w_primary[36]), .w5(w_primary[37]), .w6(w_primary[38]), .w7(w_primary[39]),
			  .d_min(d_min_wire[4]),
			  .d_min_index(index_wire[4]),
			  .w_min(w_min_wire[4])
);

MIN_1 MIN_1_5(.clk(clk),
              .rst(rst),
			  .d0(d_primary[40]), .d1(d_primary[41]), .d2(d_primary[42]), .d3(d_primary[43]), .d4(d_primary[44]), .d5(d_primary[45]), .d6(d_primary[46]), .d7(d_primary[47]),
			  .w0(w_primary[40]), .w1(w_primary[41]), .w2(w_primary[42]), .w3(w_primary[43]), .w4(w_primary[44]), .w5(w_primary[45]), .w6(w_primary[46]), .w7(w_primary[47]),
			  .d_min(d_min_wire[5]),
			  .d_min_index(index_wire[5]),
			  .w_min(w_min_wire[5])
);

MIN_1 MIN_1_6(.clk(clk),
              .rst(rst),
			  .d0(d_primary[48]), .d1(d_primary[49]), .d2(d_primary[50]), .d3(d_primary[51]), .d4(d_primary[52]), .d5(d_primary[53]), .d6(d_primary[54]), .d7(d_primary[55]),
			  .w0(w_primary[48]), .w1(w_primary[49]), .w2(w_primary[50]), .w3(w_primary[51]), .w4(w_primary[52]), .w5(w_primary[53]), .w6(w_primary[54]), .w7(w_primary[55]),
			  .d_min(d_min_wire[6]),
			  .d_min_index(index_wire[6]),
			  .w_min(w_min_wire[6])
);

MIN_1 MIN_1_7(.clk(clk),
              .rst(rst),
			  .d0(d_primary[56]), .d1(d_primary[57]), .d2(d_primary[58]), .d3(d_primary[59]), .d4(d_primary[60]), .d5(d_primary[61]), .d6(d_primary[62]), .d7(d_primary[63]),
			  .w0(w_primary[56]), .w1(w_primary[57]), .w2(w_primary[58]), .w3(w_primary[59]), .w4(w_primary[60]), .w5(w_primary[61]), .w6(w_primary[62]), .w7(w_primary[63]),
			  .d_min(d_min_wire[7]),
			  .d_min_index(index_wire[7]),
			  .w_min(w_min_wire[7])
);

MIN_2 MIN_2_0(.clk(clk),
              .rst(rst),
			  .d0(d_min_wire[0]), .d1(d_min_wire[1]), .d2(d_min_wire[2]), .d3(d_min_wire[3]), .d4(d_min_wire[4]), .d5(d_min_wire[5]), .d6(d_min_wire[6]), .d7(d_min_wire[7]), 
			  .w0(w_min_wire[0]), .w1(w_min_wire[1]), .w2(w_min_wire[2]), .w3(w_min_wire[3]), .w4(w_min_wire[4]), .w5(w_min_wire[5]), .w6(w_min_wire[6]), .w7(w_min_wire[7]), 
			  .index0(index_wire[0]), .index1(index_wire[1]), .index2(index_wire[2]), .index3(index_wire[3]), .index4(index_wire[4]), .index5(index_wire[5]), .index6(index_wire[6]), .index7(index_wire[7]), 
			  .X_c(X_c_wire), 
			  .Y_c(Y_c_wire), 
			  .weight_c(RAM_RESULT_D)
);

USS USS0(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd0), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[0])
);

USS USS1(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd1), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[1])
);

USS USS2(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd2), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[2])
);

USS USS3(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd3), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[3])
);

USS USS4(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd4), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[4])
);

USS USS5(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd5), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[5])
);

USS USS6(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd6), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[6])
);

USS USS7(.clk(clk), 
         .rst(rst), 
		 .X_in(3'd7), 
		 .X_c(X_c_wire), 
		 .Y_c(Y_c_wire), 
		 .neighbor_sel(neighbor_sel_wire[7])
);


WR_CODEBOOK WR_CODEBOOK0(
    .RAM_W_WE(RAM_W_WE),     //從controller來
    .RAM_W_A(RAM_W_A),
    .RAM_W_D(RAM_W_D),
	.clk(clk), 
    .rst(rst),
    .w0(w_primary[0])  ,.w1(w_primary[1]) ,.w2(w_primary[2])  ,.w3(w_primary[3])  ,.w4(w_primary[4])  ,.w5(w_primary[5])  ,.w6(w_primary[6])  ,.w7(w_primary[7]) ,
	.w8(w_primary[8])  ,.w9(w_primary[9])  ,.w10(w_primary[10]),.w11(w_primary[11]),.w12(w_primary[12]),.w13(w_primary[13]),.w14(w_primary[14]),.w15(w_primary[15]),      
	.w16(w_primary[16]),.w17(w_primary[17]),.w18(w_primary[18]),.w19(w_primary[19]),.w20(w_primary[20]),.w21(w_primary[21]),.w22(w_primary[22]),.w23(w_primary[23]),
	.w24(w_primary[24]),.w25(w_primary[25]),.w26(w_primary[26]),.w27(w_primary[27]),.w28(w_primary[28]),.w29(w_primary[29]),.w30(w_primary[30]),.w31(w_primary[31]),
	.w32(w_primary[32]),.w33(w_primary[33]),.w34(w_primary[34]),.w35(w_primary[35]),.w36(w_primary[36]),.w37(w_primary[37]),.w38(w_primary[38]),.w39(w_primary[39]),
	.w40(w_primary[40]),.w41(w_primary[41]),.w42(w_primary[42]),.w43(w_primary[43]),.w44(w_primary[44]),.w45(w_primary[45]),.w46(w_primary[46]),.w47(w_primary[47]), 
	.w48(w_primary[48]),.w49(w_primary[49]),.w50(w_primary[50]),.w51(w_primary[51]),.w52(w_primary[52]),.w53(w_primary[53]),.w54(w_primary[54]),.w55(w_primary[55]), 
	.w56(w_primary[56]),.w57(w_primary[57]),.w58(w_primary[58]),.w59(w_primary[59]),.w60(w_primary[60]),.w61(w_primary[61]),.w62(w_primary[62]),.w63(w_primary[63])
);

endmodule