module RM_dec(input [15:0] rec, output [10:0] dec);
reg [15:0] v [10:0];
reg [15:0] vpos;
integer  count;
	 always @(rec)
	 begin
		 // Current position: 5
			 count = 0;
			 v[5][0] = ^(rec & 16'b1000100010001000);
			 count=count+v[5][0];
			 v[5][1] = ^(rec & 16'b0100010001000100);
			 count=count+v[5][1];
			 v[5][2] = ^(rec & 16'b0010001000100010);
			 count=count+v[5][2];
			 v[5][3] = ^(rec & 16'b0001000100010001);
			 count=count+v[5][3];
			 if(count > 2)
                     vpos[5] = 1;
			 else 
                     vpos[5] = 0;
		 // Current position: 6
			 count=0;
			 v[6][0]= ^(rec & 16'b1010000010100000);
			 count=count+v[6][0];
			 v[6][1]= ^(rec & 16'b0101000001010000);
			 count=count+v[6][1];
			 v[6][2]= ^(rec & 16'b0000101000001010);
			 count=count+v[6][2];
			 v[6][3]= ^(rec & 16'b0000010100000101);
			 count=count+v[6][3];
			 if(count> 2)
                     vpos[6]= 1;
			 else 
                     vpos[6]= 0;
		 // Current position: 7
			 count=0;
			 v[7][0]= ^(rec & 16'b1100000011000000);
			 count=count+v[7][0];
			 v[7][1]= ^(rec & 16'b0011000000110000);
			 count=count+v[7][1];
			 v[7][2]= ^(rec & 16'b0000110000001100);
			 count=count+v[7][2];
			 v[7][3]= ^(rec & 16'b0000001100000011);
			 count=count+v[7][3];
			 if(count> 2)
                     vpos[7]= 1;
			 else 
                     vpos[7]= 0;
		 // Current position: 8
			 count=0;
			 v[8][0]= ^(rec & 16'b1010101000000000);
			 count=count+v[8][0];
			 v[8][1]= ^(rec & 16'b0101010100000000);
			 count=count+v[8][1];
			 v[8][2]= ^(rec & 16'b0000000010101010);
			 count=count+v[8][2];
			 v[8][3]= ^(rec & 16'b0000000001010101);
			 count=count+v[8][3];
			 if(count> 2)
                     vpos[8]= 1;
			 else 
                     vpos[8]= 0;

		 // Current position: 9
			 count=0;
			 v[9][0]= ^(rec & 16'b1100110000000000);
			 count=count+v[9][0];
			 v[9][1]= ^(rec & 16'b0011001100000000);
			 count=count+v[9][1];
			 v[9][2]= ^(rec & 16'b0000000011001100);
			 count=count+v[9][2];
			 v[9][3]= ^(rec & 16'b0000000000110011);
			 count=count+v[9][3];
			 if(count> 2)
                     vpos[9]= 1;
			 else 
                     vpos[9]= 0;

		 // Current position: 10
			 count=0;
			 v[10][0]= ^(rec & 16'b1111000000000000);
			 count=count+v[10][0];
			 v[10][1]= ^(rec & 16'b0000111100000000);
			 count=count+v[10][1];
			 v[10][2]= ^(rec & 16'b0000000011110000);
			 count=count+v[10][2];
			 v[10][3]= ^(rec & 16'b0000000000001111);
			 count=count+v[10][3];

			 if(count> 2)
                     vpos[10]= 1;
			 else 
                     vpos[10]= 0;

		 // Current position: 1
			 count=0;
			 v[1][0]= ^(rec & 16'b1000000010000000);
			 count=count+v[1][0];
			 v[1][1]= ^(rec & 16'b0100000001000000);
			 count=count+v[1][1];
			 v[1][2]= ^(rec & 16'b0010000000100000);
			 count=count+v[1][2];
			 v[1][3]= ^(rec & 16'b0001000000010000);
			 count=count+v[1][3];
			 v[1][4]= ^(rec & 16'b0000100000001000);
			 count=count+v[1][4];
			 v[1][5]= ^(rec & 16'b0000010000000100);
			 count=count+v[1][5];
			 v[1][6]= ^(rec & 16'b0000001000000010);
			 count=count+v[1][6];
			 v[1][7]= ^(rec & 16'b0000000100000001);
			 count=count+v[1][7];
			 if(count> 4)
                     vpos[1]= 1;
			 else 
                     vpos[1]= 0;
		 // Current position: 2
			 count=0;
			 v[2][0]= ^(rec & 16'b1000100000000000);
			 count=count+v[2][0];
			 v[2][1]= ^(rec & 16'b0100010000000000);
			 count=count+v[2][1];
			 v[2][2]= ^(rec & 16'b0010001000000000);
			 count=count+v[2][2];
			 v[2][3]= ^(rec & 16'b0001000100000000);
			 count=count+v[2][3];
			 v[2][4]= ^(rec & 16'b0000000010001000);
			 count=count+v[2][4];
			 v[2][5]= ^(rec & 16'b0000000001000100);
			 count=count+v[2][5];
			 v[2][6]= ^(rec & 16'b0000000000100010);
			 count=count+v[2][6];
			 v[2][7]= ^(rec & 16'b0000000000010001);
			 count=count+v[2][7];
			 if(count> 4)
                     vpos[2]= 1;
			 else 
                     vpos[2]= 0;
		 // Current position: 3
			 count=0;
			 v[3][0]= ^(rec & 16'b1010000000000000);
			 count=count+v[3][0];
			 v[3][1]= ^(rec & 16'b0101000000000000);
			 count=count+v[3][1];
			 v[3][2]= ^(rec & 16'b0000101000000000);
			 count=count+v[3][2];
			 v[3][3]= ^(rec & 16'b0000010100000000);
			 count=count+v[3][3];
			 v[3][4]= ^(rec & 16'b0000000010100000);
			 count=count+v[3][4];
			 v[3][5]= ^(rec & 16'b0000000001010000);
			 count=count+v[3][5];
			 v[3][6]= ^(rec & 16'b0000000000001010);
			 count=count+v[3][6];
			 v[3][7]= ^(rec & 16'b0000000000000101);
			 count=count+v[3][7];
			 if(count> 4)
                     vpos[3]= 1;
			 else 
                     vpos[3]= 0;
		 // Current position: 4
			 count=0;
			 v[4][0]= ^(rec & 16'b1100000000000000);
			 count=count+v[4][0];
			 v[4][1]= ^(rec & 16'b0011000000000000);
			 count=count+v[4][1];
			 v[4][2]= ^(rec & 16'b0000110000000000);
			 count=count+v[4][2];
			 v[4][3]= ^(rec & 16'b0000001100000000);
			 count=count+v[4][3];
			 v[4][4]= ^(rec & 16'b0000000011000000);
			 count=count+v[4][4];
			 v[4][5]= ^(rec & 16'b0000000000110000);
			 count=count+v[4][5];
			 v[4][6]= ^(rec & 16'b0000000000001100);
			 count=count+v[4][6];
			 v[4][7]= ^(rec & 16'b0000000000000011);
			 count=count+v[4][7];
			 if(count> 4)
                     vpos[4]= 1;
			 else 
                     vpos[4]= 0;
		 // Current position: 0
			 count=0;
			 v[0][0]= ^(rec & 16'b1000000000000000);
			 count=count+v[0][0];
			 v[0][1]= ^(rec & 16'b0100000000000000);
			 count=count+v[0][1];
			 v[0][2]= ^(rec & 16'b0010000000000000);
			 count=count+v[0][2];
			 v[0][3]= ^(rec & 16'b0001000000000000);
			 count=count+v[0][3];
			 v[0][4]= ^(rec & 16'b0000100000000000);
			 count=count+v[0][4];
			 v[0][5]= ^(rec & 16'b0000010000000000);
			 count=count+v[0][5];
			 v[0][6]= ^(rec & 16'b0000001000000000);
			 count=count+v[0][6];
			 v[0][7]= ^(rec & 16'b0000000100000000);
			 count=count+v[0][7];
			 v[0][8]= ^(rec & 16'b0000000010000000);
			 count=count+v[0][8];
			 v[0][9]= ^(rec & 16'b0000000001000000);
			 count=count+v[0][9];
			 v[0][10]= ^(rec & 16'b0000000000100000);
			 count=count+v[0][10];
			 v[0][11]= ^(rec & 16'b0000000000010000);
			 count=count+v[0][11];
			 v[0][12]= ^(rec & 16'b0000000000001000);
			 count=count+v[0][12];
			 v[0][13]= ^(rec & 16'b0000000000000100);
			 count=count+v[0][13];
			 v[0][14]= ^(rec & 16'b0000000000000010);
			 count=count+v[0][14];
			 v[0][15]= ^(rec & 16'b0000000000000001);
			 count=count+v[0][15];
			 if(count> 8)
                     vpos[0]= 1;
			 else 
                     vpos[0]= 0;
	 end
      
     assign dec[0]=^(vpos & 11'b11111111111);
     assign dec[1]=^(vpos & 11'b11110110100);
     assign dec[2]=^(vpos & 11'b11101101010);
     assign dec[3]=^(vpos & 11'b11100100000);
     assign dec[4]=^(vpos & 11'b11011011001);
     assign dec[5]=^(vpos & 11'b11010010000);
     assign dec[6]=^(vpos & 11'b11001001000);
     assign dec[7]=^(vpos & 11'b11000000000);
     assign dec[8]=^(vpos & 11'b10111000111);
     assign dec[9]=^(vpos & 11'b10110000100);
     assign dec[10]=^(vpos & 11'b10101000010);
      
	 endmodule
