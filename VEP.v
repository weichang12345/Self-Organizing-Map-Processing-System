/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ VEP module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module VEP(clk, rst, W_update, D_update, neighbor_sel, pixel,
				d0, d1, d2, d3, d4, d5, d6, d7, w0, w1, w2, w3, w4, w5, w6, w7);

// ---------------------- input  ---------------------- //
	input clk; 
	input rst; 
	input W_update;
	input D_update;
	input [15:0] neighbor_sel; 
	input [23:0] pixel; 
	
// ---------------------- output  ---------------------- //
	output reg [10:0] d0;
	output reg [10:0] d1;
	output reg [10:0] d2;
	output reg [10:0] d3;
	output reg [10:0] d4;
	output reg [10:0] d5;
	output reg [10:0] d6;
	output reg [10:0] d7;
	output reg [23:0] w0;
	output reg [23:0] w1;
	output reg [23:0] w2;
	output reg [23:0] w3;
	output reg [23:0] w4;
	output reg [23:0] w5;
	output reg [23:0] w6;
	output reg [23:0] w7;
	
// ---------------------- Write down Your design below  ---------------------- //
reg [8:0] temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23;

always@(posedge clk or posedge rst)begin

	if(rst)begin
		w0 <= {8'd125, 8'd125, 8'd125};
		w1 <= {8'd125, 8'd125, 8'd125};
		w2 <= {8'd125, 8'd125, 8'd125};
		w3 <= {8'd125, 8'd125, 8'd125};
		w4 <= {8'd125, 8'd125, 8'd125};
		w5 <= {8'd125, 8'd125, 8'd125};
		w6 <= {8'd125, 8'd125, 8'd125};
		w7 <= {8'd125, 8'd125, 8'd125};
	end

    else begin
	    if(W_update) begin
			case(neighbor_sel[15:14]) //確保w0-pixel or pixel-wo 是正的，並且讓w趨向pixel
				2'b00 : begin 
					w0[7:0]   <= (pixel[7:0]  > w0[7:0])   ?  w0[7:0]   + ((pixel[7:0]-w0[7:0])  >> 2 )     :  w0[7:0] -  ((w0[7:0]-pixel[7:0])  >> 2);
					w0[15:8]  <= (pixel[15:8] > w0[15:8])  ?  w0[15:8]  + ((pixel[15:8]-w0[15:8])  >> 2 )   :  w0[15:8] - ((w0[15:8]-pixel[15:8])  >> 2);
					w0[23:16] <= (pixel[23:16] > w0[23:16])?  w0[23:16] + ((pixel[23:16]-w0[23:16])  >> 2 ) :  w0[23:16] - ((w0[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w0[7:0]   <= (pixel[7:0]  > w0[7:0])   ?  w0[7:0]   + ((pixel[7:0]-w0[7:0])  >> 4 )     :  w0[7:0] -  ((w0[7:0]-pixel[7:0])  >> 4);
					w0[15:8]  <= (pixel[15:8] > w0[15:8])  ?  w0[15:8]  + ((pixel[15:8]-w0[15:8])  >> 4 )   :  w0[15:8] - ((w0[15:8]-pixel[15:8])  >> 4);
					w0[23:16] <= (pixel[23:16] > w0[23:16])?  w0[23:16] + ((pixel[23:16]-w0[23:16])  >> 4 ) :  w0[23:16] - ((w0[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w0[7:0]   <= (pixel[7:0]  > w0[7:0])   ?  w0[7:0]   + ((pixel[7:0]-w0[7:0])  >> 5 )     :  w0[7:0] -  ((w0[7:0]-pixel[7:0])  >> 5);
					w0[15:8]  <= (pixel[15:8] > w0[15:8])  ?  w0[15:8]  + ((pixel[15:8]-w0[15:8])  >> 5)    :  w0[15:8] - ((w0[15:8]-pixel[15:8])  >> 5);
					w0[23:16] <= (pixel[23:16] > w0[23:16])?  w0[23:16] + ((pixel[23:16]-w0[23:16])  >> 5 ) :  w0[23:16] - ((w0[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w0 <= w0 ;
			endcase
			case(neighbor_sel[13:12]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w1[7:0]   <= (pixel[7:0]  > w1[7:0])   ?  w1[7:0]   + ((pixel[7:0]-w1[7:0])  >> 2 )     :  w1[7:0] -  ((w1[7:0]-pixel[7:0])  >> 2);
					w1[15:8]  <= (pixel[15:8] > w1[15:8])  ?  w1[15:8]  + ((pixel[15:8]-w1[15:8])  >> 2 )   :  w1[15:8] - ((w1[15:8]-pixel[15:8])  >> 2);
					w1[23:16] <= (pixel[23:16] > w1[23:16])?  w1[23:16] + ((pixel[23:16]-w1[23:16])  >> 2 ) :  w1[23:16] - ((w1[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w1[7:0]   <= (pixel[7:0]  > w1[7:0])   ?  w1[7:0]   + ((pixel[7:0]-w1[7:0])  >> 4 )     :  w1[7:0] -  ((w1[7:0]-pixel[7:0])  >> 4);
					w1[15:8]  <= (pixel[15:8] > w1[15:8])  ?  w1[15:8]  + ((pixel[15:8]-w1[15:8])  >> 4 )   :  w1[15:8] - ((w1[15:8]-pixel[15:8])  >> 4);
					w1[23:16] <= (pixel[23:16] > w1[23:16])?  w1[23:16] + ((pixel[23:16]-w1[23:16])  >> 4 ) :  w1[23:16] - ((w1[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w1[7:0]   <= (pixel[7:0]  > w1[7:0])   ?  w1[7:0]   + ((pixel[7:0]-w1[7:0])  >> 5 )     :  w1[7:0] -  ((w1[7:0]-pixel[7:0])  >> 5);
					w1[15:8]  <= (pixel[15:8] > w1[15:8])  ?  w1[15:8]  + ((pixel[15:8]-w1[15:8])  >> 5 )   :  w1[15:8] - ((w1[15:8]-pixel[15:8])  >> 5);
					w1[23:16] <= (pixel[23:16] > w1[23:16])?  w1[23:16] + ((pixel[23:16]-w1[23:16])  >> 5 ) :  w1[23:16] - ((w1[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w1 <= w1 ;
			endcase
			case(neighbor_sel[11:10]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w2[7:0]   <= (pixel[7:0]  > w2[7:0])   ?  w2[7:0]   + ((pixel[7:0]-w2[7:0])  >> 2 )     :  w2[7:0] -  ((w2[7:0]-pixel[7:0])  >> 2);
					w2[15:8]  <= (pixel[15:8] > w2[15:8])  ?  w2[15:8]  + ((pixel[15:8]-w2[15:8])  >> 2 )   :  w2[15:8] - ((w2[15:8]-pixel[15:8])  >> 2);
					w2[23:16] <= (pixel[23:16] > w2[23:16])?  w2[23:16] + ((pixel[23:16]-w2[23:16])  >> 2 ) :  w2[23:16] - ((w2[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w2[7:0]   <= (pixel[7:0]  > w2[7:0])   ?  w2[7:0]   + ((pixel[7:0]-w2[7:0])  >> 4 )     :  w2[7:0] -  ((w2[7:0]-pixel[7:0])  >> 4);
					w2[15:8]  <= (pixel[15:8] > w2[15:8])  ?  w2[15:8]  + ((pixel[15:8]-w2[15:8])  >> 4 )   :  w2[15:8] - ((w2[15:8]-pixel[15:8])  >> 4);
					w2[23:16] <= (pixel[23:16] > w2[23:16])?  w2[23:16] + ((pixel[23:16]-w2[23:16])  >> 4 ) :  w2[23:16] - ((w2[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w2[7:0]   <= (pixel[7:0]  > w2[7:0])   ?  w2[7:0]   + ((pixel[7:0]-w2[7:0])  >> 5 )     :  w2[7:0] -  ((w2[7:0]-pixel[7:0])  >> 5);
					w2[15:8]  <= (pixel[15:8] > w2[15:8])  ?  w2[15:8]  + ((pixel[15:8]-w2[15:8])  >> 5 )   :  w2[15:8] - ((w2[15:8]-pixel[15:8])  >> 5);
					w2[23:16] <= (pixel[23:16] > w2[23:16])?  w2[23:16] + ((pixel[23:16]-w2[23:16])  >> 5 ) :  w2[23:16] - ((w2[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w2 <= w2 ;
			endcase
			case(neighbor_sel[9:8]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w3[7:0]   <= (pixel[7:0]  > w3[7:0])   ?  w3[7:0]   + ((pixel[7:0]-w3[7:0])  >> 2 )     :  w3[7:0] -  ((w3[7:0]-pixel[7:0])  >> 2);
					w3[15:8]  <= (pixel[15:8] > w3[15:8])  ?  w3[15:8]  + ((pixel[15:8]-w3[15:8])  >> 2 )   :  w3[15:8] - ((w3[15:8]-pixel[15:8])  >> 2);
					w3[23:16] <= (pixel[23:16] > w3[23:16])?  w3[23:16] + ((pixel[23:16]-w3[23:16])  >> 2 ) :  w3[23:16] - ((w3[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w3[7:0]   <= (pixel[7:0]  > w3[7:0])   ?  w3[7:0]   + ((pixel[7:0]-w3[7:0])  >> 4 )     :  w3[7:0] -  ((w3[7:0]-pixel[7:0])  >> 4);
					w3[15:8]  <= (pixel[15:8] > w3[15:8])  ?  w3[15:8]  + ((pixel[15:8]-w3[15:8])  >> 4 )   :  w3[15:8] - ((w3[15:8]-pixel[15:8])  >> 4);
					w3[23:16] <= (pixel[23:16] > w3[23:16])?  w3[23:16] + ((pixel[23:16]-w3[23:16])  >> 4 ) :  w3[23:16] - ((w3[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w3[7:0]   <= (pixel[7:0]  > w3[7:0])   ?  w3[7:0]   + ((pixel[7:0]-w3[7:0])  >> 5 )     :  w3[7:0] -  ((w3[7:0]-pixel[7:0])  >> 5);
					w3[15:8]  <= (pixel[15:8] > w3[15:8])  ?  w3[15:8]  + ((pixel[15:8]-w3[15:8])  >> 5 )   :  w3[15:8] - ((w3[15:8]-pixel[15:8])  >> 5);
					w3[23:16] <= (pixel[23:16] > w3[23:16])?  w3[23:16] + ((pixel[23:16]-w3[23:16])  >> 5 ) :  w3[23:16] - ((w3[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w3 <= w3 ;
			endcase
			case(neighbor_sel[7:6]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w4[7:0]   <= (pixel[7:0]  > w4[7:0])   ?  w4[7:0]   + ((pixel[7:0]-w4[7:0])  >> 2 )     :  w4[7:0] -  ((w4[7:0]-pixel[7:0])  >> 2);
					w4[15:8]  <= (pixel[15:8] > w4[15:8])  ?  w4[15:8]  + ((pixel[15:8]-w4[15:8])  >> 2 )   :  w4[15:8] - ((w4[15:8]-pixel[15:8])  >> 2);
					w4[23:16] <= (pixel[23:16] > w4[23:16])?  w4[23:16] + ((pixel[23:16]-w4[23:16])  >> 2 ) :  w4[23:16] - ((w4[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w4[7:0]   <= (pixel[7:0]  > w4[7:0])   ?  w4[7:0]   + ((pixel[7:0]-w4[7:0])  >> 4 )     :  w4[7:0] -  ((w4[7:0]-pixel[7:0])  >> 4);
					w4[15:8]  <= (pixel[15:8] > w4[15:8])  ?  w4[15:8]  + ((pixel[15:8]-w4[15:8])  >> 4 )   :  w4[15:8] - ((w4[15:8]-pixel[15:8])  >> 4);
					w4[23:16] <= (pixel[23:16] > w4[23:16])?  w4[23:16] + ((pixel[23:16]-w4[23:16])  >> 4 ) :  w4[23:16] - ((w4[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w4[7:0]   <= (pixel[7:0]  > w4[7:0])   ?  w4[7:0]   + ((pixel[7:0]-w4[7:0])  >> 5 )     :  w4[7:0] -  ((w4[7:0]-pixel[7:0])  >> 5);
					w4[15:8]  <= (pixel[15:8] > w4[15:8])  ?  w4[15:8]  + ((pixel[15:8]-w4[15:8])  >> 5 )   :  w4[15:8] - ((w4[15:8]-pixel[15:8])  >> 5);
					w4[23:16] <= (pixel[23:16] > w4[23:16])?  w4[23:16] + ((pixel[23:16]-w4[23:16])  >> 5 ) :  w4[23:16] - ((w4[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w4 <= w4 ;
			endcase
			case(neighbor_sel[5:4]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w5[7:0]   <= (pixel[7:0]  > w5[7:0])   ?  w5[7:0]   + ((pixel[7:0]-w5[7:0])  >> 2 )     :  w5[7:0] -  ((w5[7:0]-pixel[7:0])  >> 2);
					w5[15:8]  <= (pixel[15:8] > w5[15:8])  ?  w5[15:8]  + ((pixel[15:8]-w5[15:8])  >> 2 )   :  w5[15:8] - ((w5[15:8]-pixel[15:8])  >> 2);
					w5[23:16] <= (pixel[23:16] > w5[23:16])?  w5[23:16] + ((pixel[23:16]-w5[23:16])  >> 2 ) :  w5[23:16] - ((w5[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w5[7:0]   <= (pixel[7:0]  > w5[7:0])   ?  w5[7:0]   + ((pixel[7:0]-w5[7:0])  >> 4 )     :  w5[7:0] -  ((w5[7:0]-pixel[7:0])  >> 4);
					w5[15:8]  <= (pixel[15:8] > w5[15:8])  ?  w5[15:8]  + ((pixel[15:8]-w5[15:8])  >> 4 )   :  w5[15:8] - ((w5[15:8]-pixel[15:8])  >> 4);
					w5[23:16] <= (pixel[23:16] > w5[23:16])?  w5[23:16] + ((pixel[23:16]-w5[23:16])  >> 4 ) :  w5[23:16] - ((w5[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w5[7:0]   <= (pixel[7:0]  > w5[7:0])   ?  w5[7:0]   + ((pixel[7:0]-w5[7:0])  >> 5 )     :  w5[7:0] -  ((w5[7:0]-pixel[7:0])  >> 5);
					w5[15:8]  <= (pixel[15:8] > w5[15:8])  ?  w5[15:8]  + ((pixel[15:8]-w5[15:8])  >> 5 )   :  w5[15:8] - ((w5[15:8]-pixel[15:8])  >> 5);
					w5[23:16] <= (pixel[23:16] > w5[23:16])?  w5[23:16] + ((pixel[23:16]-w5[23:16])  >> 5 ) :  w5[23:16] - ((w5[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w5 <= w5 ;
			endcase
			case(neighbor_sel[3:2]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w6[7:0]   <= (pixel[7:0]  > w6[7:0])   ?  w6[7:0]   + ((pixel[7:0]-w6[7:0])  >> 2 )     :  w6[7:0] -  ((w6[7:0]-pixel[7:0])  >> 2);
					w6[15:8]  <= (pixel[15:8] > w6[15:8])  ?  w6[15:8]  + ((pixel[15:8]-w6[15:8])  >> 2 )   :  w6[15:8] - ((w6[15:8]-pixel[15:8])  >> 2);
					w6[23:16] <= (pixel[23:16] > w6[23:16])?  w6[23:16] + ((pixel[23:16]-w6[23:16])  >> 2 ) :  w6[23:16] - ((w6[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w6[7:0]   <= (pixel[7:0]  > w6[7:0])   ?  w6[7:0]   + ((pixel[7:0]-w6[7:0])  >> 4 )     :  w6[7:0] -  ((w6[7:0]-pixel[7:0])  >> 4);
					w6[15:8]  <= (pixel[15:8] > w6[15:8])  ?  w6[15:8]  + ((pixel[15:8]-w6[15:8])  >> 4 )   :  w6[15:8] - ((w6[15:8]-pixel[15:8])  >> 4);
					w6[23:16] <= (pixel[23:16] > w6[23:16])?  w6[23:16] + ((pixel[23:16]-w6[23:16])  >> 4 ) :  w6[23:16] - ((w6[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w6[7:0]   <= (pixel[7:0]  > w6[7:0])   ?  w6[7:0]   + ((pixel[7:0]-w6[7:0])  >> 5 )     :  w6[7:0] -  ((w6[7:0]-pixel[7:0])  >> 5);
					w6[15:8]  <= (pixel[15:8] > w6[15:8])  ?  w6[15:8]  + ((pixel[15:8]-w6[15:8])  >> 5 )   :  w6[15:8] - ((w6[15:8]-pixel[15:8])  >> 5);
					w6[23:16] <= (pixel[23:16] > w6[23:16])?  w6[23:16] + ((pixel[23:16]-w6[23:16])  >> 5 ) :  w6[23:16] - ((w6[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w6 <= w6 ;
			endcase
			case(neighbor_sel[1:0]) //不確定要不要用signed or unsigned
				2'b00 : begin 
					w7[7:0]   <= (pixel[7:0]  > w7[7:0])   ?  w7[7:0]   + ((pixel[7:0]-w7[7:0])  >> 2 )     :  w7[7:0] -  ((w7[7:0]-pixel[7:0])  >> 2);
					w7[15:8]  <= (pixel[15:8] > w7[15:8])  ?  w7[15:8]  + ((pixel[15:8]-w7[15:8])  >> 2 )   :  w7[15:8] - ((w7[15:8]-pixel[15:8])  >> 2);
					w7[23:16] <= (pixel[23:16] > w7[23:16])?  w7[23:16] + ((pixel[23:16]-w7[23:16])  >> 2 ) :  w7[23:16] - ((w7[23:16]-pixel[23:16])  >> 2);
				end
				2'b01 : begin 
					w7[7:0]   <= (pixel[7:0]  > w7[7:0])   ?  w7[7:0]   + ((pixel[7:0]-w7[7:0])  >> 4 )     :  w7[7:0] -  ((w7[7:0]-pixel[7:0])  >> 4);
					w7[15:8]  <= (pixel[15:8] > w7[15:8])  ?  w7[15:8]  + ((pixel[15:8]-w7[15:8])  >> 4 )   :  w7[15:8] - ((w7[15:8]-pixel[15:8])  >> 4);
					w7[23:16] <= (pixel[23:16] > w7[23:16])?  w7[23:16] + ((pixel[23:16]-w7[23:16])  >> 4 ) :  w7[23:16] - ((w7[23:16]-pixel[23:16])  >> 4);
				end
				2'b10 : begin 
					w7[7:0]   <= (pixel[7:0]  > w7[7:0])   ?  w7[7:0]   + ((pixel[7:0]-w7[7:0])  >> 5 )     :  w7[7:0] -  ((w7[7:0]-pixel[7:0])  >> 5);
					w7[15:8]  <= (pixel[15:8] > w7[15:8])  ?  w7[15:8]  + ((pixel[15:8]-w7[15:8])  >> 5 )   :  w7[15:8] - ((w7[15:8]-pixel[15:8])  >> 5);
					w7[23:16] <= (pixel[23:16] > w7[23:16])?  w7[23:16] + ((pixel[23:16]-w7[23:16])  >> 5 ) :  w7[23:16] - ((w7[23:16]-pixel[23:16])  >> 5);
				end
				2'b11 : w7 <= w7 ;
			endcase
		end
    end
end

always@(*)begin

	if(D_update)begin

		temp0 = (w0[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w0[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w0[ 7: 0] });                                                               
		temp1 = (w0[15: 8]>pixel[15: 8]) ?({ 3'd0, w0[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w0[15: 8] });                                                         
		temp2 = (w0[23:16]>pixel[23:16]) ?({ 3'd0, w0[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w0[23:16] });
        d0 = temp0 + temp1 + temp2;   

        temp3 = (w1[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w1[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w1[ 7: 0] });                                                               
		temp4 = (w1[15: 8]>pixel[15: 8]) ?({ 3'd0, w1[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w1[15: 8] });                                                         
		temp5 = (w1[23:16]>pixel[23:16]) ?({ 3'd0, w1[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w1[23:16] });
        d1 = temp3 + temp4 + temp5;   

        temp6 = (w2[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w2[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w2[ 7: 0] });                                                               
		temp7 = (w2[15: 8]>pixel[15: 8]) ?({ 3'd0, w2[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w2[15: 8] });                                                         
		temp8 = (w2[23:16]>pixel[23:16]) ?({ 3'd0, w2[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w2[23:16] });
        d2 = temp6 + temp7 + temp8;   

        temp9 =  (w3[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w3[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w3[ 7: 0] });                                                               
		temp10 = (w3[15: 8]>pixel[15: 8]) ?({ 3'd0, w3[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w3[15: 8] });                                                         
		temp11 = (w3[23:16]>pixel[23:16]) ?({ 3'd0, w3[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w3[23:16] });
        d3 = temp9 + temp10 + temp11;   

        temp12 = (w4[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w4[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w4[ 7: 0] });                                                               
		temp13 = (w4[15: 8]>pixel[15: 8]) ?({ 3'd0, w4[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w4[15: 8] });                                                         
		temp14 = (w4[23:16]>pixel[23:16]) ?({ 3'd0, w4[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w4[23:16] });
        d4 = temp12 + temp13 + temp14;   

        temp15 = (w5[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w5[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w5[ 7: 0] });                                                               
		temp16 = (w5[15: 8]>pixel[15: 8]) ?({ 3'd0, w5[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w5[15: 8] });                                                         
		temp17 = (w5[23:16]>pixel[23:16]) ?({ 3'd0, w5[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w5[23:16] });
        d5 = temp15 + temp16 + temp17;   

        temp18 = (w6[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w6[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w6[ 7: 0] });                                                               
		temp19 = (w6[15: 8]>pixel[15: 8]) ?({ 3'd0, w6[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w6[15: 8] });                                                         
		temp20 = (w6[23:16]>pixel[23:16]) ?({ 3'd0, w6[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w6[23:16] });
        d6 = temp18 + temp19 + temp20;   

        temp21 = (w7[ 7: 0]>pixel[ 7: 0]) ?({ 3'd0, w7[ 7: 0] } - { 3'd0, pixel[ 7: 0] }): ({ 3'd0, pixel[ 7: 0] } - { 3'd0, w7[ 7: 0] });                                                               
		temp22 = (w7[15: 8]>pixel[15: 8]) ?({ 3'd0, w7[15: 8] } - { 3'd0, pixel[15: 8] }): ({ 3'd0, pixel[15: 8] } - { 3'd0, w7[15: 8] });                                                         
		temp23 = (w7[23:16]>pixel[23:16]) ?({ 3'd0, w7[23:16] } - { 3'd0, pixel[23:16] }): ({ 3'd0, pixel[23:16] } - { 3'd0, w7[23:16] });
        d7 = temp21 + temp22 + temp23;                                	
	end
end


endmodule
