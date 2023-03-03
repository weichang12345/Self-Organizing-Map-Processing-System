/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// --------------------- Controller module ------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module Controller(clk, rst, D_update, W_update, RAM_IF_A, RAM_IF_OE, RAM_W_A, RAM_W_WE, RAM_RESULT_A, RAM_RESULT_WE, done);


input clk;
input rst;

output reg D_update;
output reg W_update;
output reg [17:0] RAM_IF_A;
output reg RAM_IF_OE;
output reg [17:0] RAM_W_A;
output reg RAM_W_WE;
output reg [17:0] RAM_RESULT_A;
output reg RAM_RESULT_WE;
output reg done;

reg [3:0] cur_st,next_st;
	
parameter [3:0] INI      = 3'd0,
				READ     = 3'd1,
				MAN      = 3'd2,
				MIN      = 3'd3,
				SEL      = 3'd4,
				UPDATE   = 3'd5,
				W_WEIGHT = 3'd6,
				W_PIC    = 3'd7;
				//DONE   = 3'd8, 


always @(posedge clk or posedge rst) begin

	if (rst) begin
	    D_update      <= 1'b1;    //D一直都要計算，不太懂這個訊號的意義(?)
	    W_update      <= 1'b0;
		RAM_IF_OE     <= 1'b0;
		RAM_W_WE      <= 1'b0;
		RAM_RESULT_WE <= 1'b0;
		done          <= 1'b0;
		RAM_IF_A      <= 18'd0;
		RAM_W_A       <= 18'd0-18'd1;
		RAM_RESULT_A  <= 18'd0-18'd1;
		cur_st        <= INI;
	end

	else begin

		cur_st <= next_st ;
		case(cur_st )
			INI:begin               //開始要資料
				RAM_IF_OE <= 1'b1;
				W_update  <= 1'b0;
				D_update  <= 1'b1;
			end

			READ:begin              //讀 RAM_IF_A 的資料

				RAM_IF_A <= RAM_IF_A + 1'b1;              //資料會存在 RAM_IF_D 在top的地方把線接起來
				W_update  <= 1'b0;
				D_update  <= 1'b0;
			end

			MAN:begin               //其實就是跑 VEP 模組 的 d 值計算
				D_update  <= 1'b1;
				W_update  <= 1'b0;
			end

			MIN:begin
				D_update  <= 1'b0;
			end

			SEL:begin
				
			end

			UPDATE:begin
				W_update  <= 1'b1;
			end

			W_WEIGHT:begin
			    W_update  <= 1'b0;
			    D_update  <= 1'b1;
				RAM_W_WE  <= 1'b1;
				RAM_IF_A  <= 18'd0;    //等等要重新開始要資料
				if(RAM_W_WE)
					RAM_W_A   <= RAM_W_A +1'b1;
			end

			W_PIC:begin
				RAM_IF_A  <= RAM_IF_A + 1'b1;
				RAM_RESULT_WE <= 1;
				RAM_RESULT_A <= RAM_RESULT_A +1'b1;
				if(RAM_IF_A==18'd4095)
					done <= 1;
			end

		endcase
		
	end
	
end


always@(*)begin

	case(cur_st)

		INI:begin
			next_st = MAN;
		end

		READ:begin
			next_st = MAN;
		end

		MAN:begin
			next_st = MIN;
		end

		MIN:begin
			next_st = SEL;
		end

		SEL:begin
			next_st = UPDATE;
		end

		UPDATE:begin
			next_st = (RAM_IF_A == 18'd4095)? W_WEIGHT : READ;
		end

		W_WEIGHT:begin
			next_st = (RAM_W_A == 18'd63)? W_PIC : W_WEIGHT;
		end

		W_PIC:begin
			
		end

	endcase
	
end


endmodule 