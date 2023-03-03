
module WR_CODEBOOK(clk, rst, RAM_W_WE, RAM_W_A, w0 ,w1 ,w2 ,w3 ,w4 ,w5 ,w6 ,w7 ,
	                         					w8, w9 ,w10,w11,w12,w13,w14,w15,      
	                         					w16,w17,w18,w19,w20,w21,w22,w23,
	                         					w24,w25,w26,w27,w28,w29,w30,w31,
	                         					w32,w33,w34,w35,w36,w37,w38,w39,
	                         					w40,w41,w42,w43,w44,w45,w46,w47, 
	                         					w48,w49,w50,w51,w52,w53,w54,w55, 
	                         					w56,w57,w58,w59,w60,w61,w62,w63,                             
	                         					RAM_W_D                              );

input clk;
input rst;
input RAM_W_WE ;          //可以/不能 寫入
input [17:0] RAM_W_A  ;   //位址
input [23:0] w0, w1, w2, w3, w4, w5, w6, w7,
			 w8, w9, w10,w11,w12,w13,w14,w15,
			 w16,w17,w18,w19,w20,w21,w22,w23,
			 w24,w25,w26,w27,w28,w29,w30,w31,
			 w32,w33,w34,w35,w36,w37,w38,w39,
			 w40,w41,w42,w43,w44,w45,w46,w47,
			 w48,w49,w50,w51,w52,w53,w54,w55,
			 w56,w57,w58,w59,w60,w61,w62,w63;

output reg [23:0] RAM_W_D;     //寫入的資料

wire [1535:0] all_weights  ;
reg  [11:0]   index;

assign all_weights = {w0, w1, w2, w3, w4, w5, w6, w7,
					  w8, w9, w10,w11,w12,w13,w14,w15,
					  w16,w17,w18,w19,w20,w21,w22,w23,
					  w24,w25,w26,w27,w28,w29,w30,w31,
					  w32,w33,w34,w35,w36,w37,w38,w39,
					  w40,w41,w42,w43,w44,w45,w46,w47,
					  w48,w49,w50,w51,w52,w53,w54,w55,
					  w56,w57,w58,w59,w60,w61,w62,w63};


always@(posedge clk or posedge rst)begin
	if(rst)begin
		index <= 12'd1535;
	end
    else begin
    	if(RAM_W_WE) begin
        	RAM_W_D <= all_weights[index-:24];
        	index <= index - 12'd24;
        end
    end
end

endmodule