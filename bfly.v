module bfly(di1, di2, i, n, do1, do2);

input [24:0] di1, di2;
input [6:0] i;	//from 0 to 127
input [8:0] n;	//from 2 to 256
output [24:0] do1, do2;

reg [24:0] do1_;
reg [46:0] do2_;	//25-bit di times 22-bit tw
reg [21:0] tw;
reg sign;
reg [24:0] temp;
reg [46:0] temp2;

assign do1 = do1_;
assign do2 = do2_;

always@(*) begin
	case(n)
		256: begin
			case(i)
                		0:   tw = 22'b      0100000000000000;
                		1:   tw = 22'b      0100000000000011;
                		2:   tw = 22'b      0100000000001000;
                		3:   tw = 22'b      0100000000001111;
                		4:   tw = 22'b      0100000000011001;
                		5:   tw = 22'b      0100000000100101;
                		6:   tw = 22'b      0100000000110100;
                		7:   tw = 22'b      0100000001000110;
                		8:   tw = 22'b      0100000001011010;
                		9:   tw = 22'b      0100000001110000;
                		10:  tw = 22'b      0100000010001001;
                		11:  tw = 22'b      0100000010100101;
                		12:  tw = 22'b      0100000011000011;
                		13:  tw = 22'b      0100000011100011;
                		14:  tw = 22'b      0100000100000111;
                		15:  tw = 22'b      0100000100101101;
                		16:  tw = 22'b      0100000101010110;
                		17:  tw = 22'b      0100000110000001;
                		18:  tw = 22'b      0100000110101111;
                		19:  tw = 22'b      0100000111100001;
                		20:  tw = 22'b      0100001000010100;
                		21:  tw = 22'b      0100001001001011;
                		22:  tw = 22'b      0100001010000101;
                		23:  tw = 22'b      0100001011000010;
                		24:  tw = 22'b      0100001100000001;
                		25:  tw = 22'b      0100001101000100;
                		26:  tw = 22'b      0100001110001010;
                		27:  tw = 22'b      0100001111010011;
                		28:  tw = 22'b      0100010000100000;
                		29:  tw = 22'b      0100010001110000;
                		30:  tw = 22'b      0100010011000011;
                		31:  tw = 22'b      0100010100011001;
                		32:  tw = 22'b      0100010101110011;
                		33:  tw = 22'b      0100010111010001;
                		34:  tw = 22'b      0100011000110011;
                		35:  tw = 22'b      0100011010011000;
                		36:  tw = 22'b      0100011100000001;
                		37:  tw = 22'b      0100011101101110;
                		38:  tw = 22'b      0100011111100000;
                		39:  tw = 22'b      0100100001010101;
                		40:  tw = 22'b      0100100011001111;
                		41:  tw = 22'b      0100100101001101;
                		42:  tw = 22'b      0100100111010000;
                		43:  tw = 22'b      0100101001011000;
                		44:  tw = 22'b      0100101011100100;
                		45:  tw = 22'b      0100101101110110;
                		46:  tw = 22'b      0100110000001101;
                		47:  tw = 22'b      0100110010101001;
                		48:  tw = 22'b      0100110101001010;
                		49:  tw = 22'b      0100110111110010;
                		50:  tw = 22'b      0100111010011111;
                		51:  tw = 22'b      0100111101010010;
                		52:  tw = 22'b      0101000000001100;
                		53:  tw = 22'b      0101000011001100;
                		54:  tw = 22'b      0101000110010011;
                		55:  tw = 22'b      0101001001100001;
                		56:  tw = 22'b      0101001100110111;
                		57:  tw = 22'b      0101010000010100;
                		58:  tw = 22'b      0101010011111001;
                		59:  tw = 22'b      0101010111100110;
                		60:  tw = 22'b      0101011011011100;
                		61:  tw = 22'b      0101011111011011;
                		62:  tw = 22'b      0101100011100011;
                		63:  tw = 22'b      0101100111110110;
                		64:  tw = 22'b      0101101100010010;
                		65:  tw = 22'b      0101110000111001;
                		66:  tw = 22'b      0101110101101011;
                		67:  tw = 22'b      0101111010101001;
                		68:  tw = 22'b      0101111111110100;
                		69:  tw = 22'b      0110000101001011;
                		70:  tw = 22'b      0110001010110000;
                		71:  tw = 22'b      0110010000100011;
                		72:  tw = 22'b      0110010110100101;
                		73:  tw = 22'b      0110011100110111;
                		74:  tw = 22'b      0110100011011010;
                		75:  tw = 22'b      0110101010001111;
                		76:  tw = 22'b      0110110001010110;
                		77:  tw = 22'b      0110111000110001;
                		78:  tw = 22'b      0111000000100001;
                		79:  tw = 22'b      0111001000100111;
                		80:  tw = 22'b      0111010001000100;
                		81:  tw = 22'b      0111011001111011;
                		82:  tw = 22'b      0111100011001101;
                		83:  tw = 22'b      0111101100111011;
                		84:  tw = 22'b      0111110111000111;
                		85:  tw = 22'b      1000000001110101;
                		86:  tw = 22'b      1000001101000101;
                		87:  tw = 22'b      1000011000111010;
                		88:  tw = 22'b      1000100101011001;
                		89:  tw = 22'b      1000110010100010;
                		90:  tw = 22'b      1001000000011011;
                		91:  tw = 22'b      1001001111000110;
                		92:  tw = 22'b      1001011110101001;
                		93:  tw = 22'b      1001101111000111;
                		94:  tw = 22'b      1010000000100111;
                		95:  tw = 22'b      1010010011001101;
                		96:  tw = 22'b      1010100111000010;
                		97:  tw = 22'b      1010111100001100;
                		98:  tw = 22'b      1011010010110101;
                		99:  tw = 22'b      1011101011000110;
                		100: tw = 22'b      1100000101001011;
                		101: tw = 22'b      1100100001010000;
                		102: tw = 22'b      1100111111100101;
                		103: tw = 22'b      1101100000011011;
                		104: tw = 22'b      1110000100000111;
                		105: tw = 22'b      1110101011000010;
                		106: tw = 22'b      1111010101101000;
                		107: tw = 22'b     10000000100011010;
                		108: tw = 22'b     10000111000000100;
                		109: tw = 22'b     10001110001010111;
                		110: tw = 22'b     10010110001010000;
                		111: tw = 22'b     10011111000111110;
                		112: tw = 22'b     10101001010000000;
                		113: tw = 22'b     10110100110010011;
                		114: tw = 22'b     11000010000010101;
                		115: tw = 22'b     11010001011011011;
                		116: tw = 22'b     11100011100000001;
                		117: tw = 22'b     11111001000010000;
                		118: tw = 22'b    100010011000110110;
                		119: tw = 22'b    100110011010101010;
                		120: tw = 22'b    101011100001010111;
                		121: tw = 22'b    110010001100110000;
                		122: tw = 22'b    111011010011110000;
                		123: tw = 22'b   1001000011110000101;
                		124: tw = 22'b   1011101001010000011;
                		125: tw = 22'b  10000010011001100111;
                		126: tw = 22'b  11011001010011111101;
                		127: tw = 22'b1010001011111001110010;
			endcase
		end
		128: begin
			case(i)
                		0:  tw = 22'b      0100000000000001;
                		1:  tw = 22'b      0100000000001011;
                		2:  tw = 22'b      0100000000011111;
                		3:  tw = 22'b      0100000000111101;
                		4:  tw = 22'b      0100000001100100;
                		5:  tw = 22'b      0100000010010110;
                		6:  tw = 22'b      0100000011010011;
                		7:  tw = 22'b      0100000100011010;
                		8:  tw = 22'b      0100000101101011;
                		9:  tw = 22'b      0100000111001000;
                		10: tw = 22'b      0100001000110000;
                		11: tw = 22'b      0100001010100011;
                		12: tw = 22'b      0100001100100011;
                		13: tw = 22'b      0100001110101110;
                		14: tw = 22'b      0100010001000111;
                		15: tw = 22'b      0100010011101110;
                		16: tw = 22'b      0100010110100010;
                		17: tw = 22'b      0100011001100101;
                		18: tw = 22'b      0100011100110111;
                		19: tw = 22'b      0100100000011010;
                		20: tw = 22'b      0100100100001110;
                		21: tw = 22'b      0100101000010100;
                		22: tw = 22'b      0100101100101101;
                		23: tw = 22'b      0100110001011010;
                		24: tw = 22'b      0100110110011101;
                		25: tw = 22'b      0100111011111000;
                		26: tw = 22'b      0101000001101011;
                		27: tw = 22'b      0101000111111001;
                		28: tw = 22'b      0101001110100100;
                		29: tw = 22'b      0101010101101111;
                		30: tw = 22'b      0101011101011011;
                		31: tw = 22'b      0101100101101011;
                		32: tw = 22'b      0101101110100100;
                		33: tw = 22'b      0101111000001001;
                		34: tw = 22'b      0110000010011110;
                		35: tw = 22'b      0110001101101000;
                		36: tw = 22'b      0110011001101100;
                		37: tw = 22'b      0110100110110010;
                		38: tw = 22'b      0110110101000001;
                		39: tw = 22'b      0111000100100001;
                		40: tw = 22'b      0111010101011100;
                		41: tw = 22'b      0111101000000000;
                		42: tw = 22'b      0111111100011010;
                		43: tw = 22'b      1000010010111011;
                		44: tw = 22'b      1000101011111000;
                		45: tw = 22'b      1001000111101010;
                		46: tw = 22'b      1001100110110000;
                		47: tw = 22'b      1010001001110001;
                		48: tw = 22'b      1010110001011100;
                		49: tw = 22'b      1011011110110000;
                		50: tw = 22'b      1100010010111100;
                		51: tw = 22'b      1101001111101011;
                		52: tw = 22'b      1110010111001001;
                		53: tw = 22'b      1111101100011101;
                		54: tw = 22'b     10001010011111101;
                		55: tw = 22'b     10011010100000011;
                		56: tw = 22'b     10101110110100111;
                		57: tw = 22'b     11001001011100000;
                		58: tw = 22'b     11101101110001101;
                		59: tw = 22'b    100100010010100101;
                		60: tw = 22'b    101110100111110010;
                		61: tw = 22'b   1000001001110110001;
                		62: tw = 22'b   1101100101011001010;
                		63: tw = 22'b 101000101111101010010;	//A2F9 in hex
			endcase
		end
		64: begin
			case(i)
                		0:  tw = 22'b      0100000000000101;
                		1:  tw = 22'b      0100000000101101;
                		2:  tw = 22'b      0100000001111100;
                		3:  tw = 22'b      0100000011110101;
                		4:  tw = 22'b      0100000110011000;
                		5:  tw = 22'b      0100001001101000;
                		6:  tw = 22'b      0100001101100111;
                		7:  tw = 22'b      0100010010011001;
                		8:  tw = 22'b      0100011000000001;
                		9:  tw = 22'b      0100011110100111;
                		10: tw = 22'b      0100100110001110;
                		11: tw = 22'b      0100101111000001;
                		12: tw = 22'b      0100111001001000;
                		13: tw = 22'b      0101000100101111;
                		14: tw = 22'b      0101010010000101;
                		15: tw = 22'b      0101100001011110;
                		16: tw = 22'b      0101110011010001;
                		17: tw = 22'b      0110000111111100;
                		18: tw = 22'b      0110100000000111;
                		19: tw = 22'b      0110111100100110;
                		20: tw = 22'b      0111011110100000;
                		21: tw = 22'b      1000000111011000;
                		22: tw = 22'b      1000111001011000;
                		23: tw = 22'b      1001110111101110;
                		24: tw = 22'b      1011000111010100;
                		25: tw = 22'b      1100110000000111;
                		26: tw = 22'b      1110111111110101;
                		27: tw = 22'b     10010010000011010;
                		28: tw = 22'b     10111011001011010;
                		29: tw = 22'b    100000101011010101;
                		30: tw = 22'b    110110010111111100;
                		31: tw = 22'b  10100010111111011011;
			endcase
		end
		32: begin	//n=3
			case(i)
                		0:  tw = 22'b      0100000000010100;
                		1:  tw = 22'b      0100000010110011;
                		2:  tw = 22'b      0100000111111010;
                		3:  tw = 22'b      0100001111111001;
                		4:  tw = 22'b      0100011011001100;
                		5:  tw = 22'b      0100101010011110;
                		6:  tw = 22'b      0100111110101110;
                		7:  tw = 22'b      0101011001100000;
                		8:  tw = 22'b      0101111101001101;
                		9:  tw = 22'b      0110101101110000;
                		10: tw = 22'b      0111110001111101;
                		11: tw = 22'b      1001010110110000;
                		12: tw = 22'b      1011110111111001;
                		13: tw = 22'b     10000011101100101;
                		14: tw = 22'b     11011010000101101;
                		15: tw = 22'b   1010001100001010010;
			endcase
		end
		16: begin	//n=4
			case(i)
                		0:  tw = 22'b      0100000001001111;
                		1:  tw = 22'b      0100001011100001;
                		2:  tw = 22'b      0100100010010010;
                		3:  tw = 22'b      0101001011001011;
                		4:  tw = 22'b      0110010011100010;
                		5:  tw = 22'b      1000011111000100;
                		6:  tw = 22'b      1101110001111001;
                		7:  tw = 22'b    101000110011110010;
			endcase
		end
		8: begin	//n=5
			case(i)
                		0:  tw = 22'b      0100000101000001;
                		1:  tw = 22'b      0100110011111001;
                		2:  tw = 22'b      0111001100110010;
                		3:  tw = 22'b     10100100000001110;
			endcase
		end
		4: begin	//n=6
			case(i)
                		0:  tw = 22'b      0100010101000110;
                		1:  tw = 22'b      1010011100111101;
			endcase
		end
		2:	tw = 22'b      0101101010000010;		//n=7
		1:	tw = 22'b      1;
	endcase

//	do2_ = sign ? ~(temp*tw>>30)+1 : (temp*tw)>>30;

	temp = di1 - di2;
	sign = temp[24];
	temp = sign ? ~temp+1 : temp;

	do1_ = di1 + di2;

	temp2 = temp * tw;
	if(temp2[14]==1) do2_ = sign ? ~(temp2>>15) : (temp2>>15)+1;
	else do2_ = sign ? ~(temp2>>15)+1 : temp2>>15;

end
endmodule
