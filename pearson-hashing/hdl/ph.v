
// blah blah
module pearson();
//module pearson(input [7:0] key_byte, output [7:0] hash);

//64 bits to 8 bits hash
//input [7:0] key_byte[15:0]; 
//output [7:0] hash;

// LUT
wire [7:0] T, i;
always @(i)
begin
        case(i)
                0   : T = 251; 
                1   : T = 175; 
                2   : T = 119; 
                3   : T = 215; 
                4   : T = 81; 
                5   : T = 14; 
                6   : T = 79; 
                7   : T = 191; 
                8   : T = 103; 
                9   : T = 49; 
                10  : T = 181; 
                11  : T = 143; 
                12  : T = 186; 
                13  : T = 157; 
                14  : T = 0;
                15  : T = 232; 
                16  : T = 31; 
                17  : T = 32; 
                18  : T = 55; 
                19  : T = 60; 
                20  : T = 152; 
                21  : T = 58; 
                22  : T = 17; 
                23  : T = 237; 
                24  : T = 174; 
                25  : T = 70; 
                26  : T = 160; 
                27  : T = 144; 
                28  : T = 220; 
                29  : T = 90; 
                30  : T = 57;
                31  : T = 223; 
                32  : T = 59;  
                33  : T = 3; 
                34  : T = 18; 
                35  : T = 140; 
                36  : T = 111; 
                37  : T = 166; 
                38  : T = 203; 
                39  : T = 196; 
                40  : T = 134; 
                41  : T = 243; 
                42  : T = 124; 
                43  : T = 95; 
                44  : T = 222; 
                45  : T = 179;
                46  : T = 197; 
                47  : T = 65; 
                48  : T = 180; 
                49  : T = 48; 
                50  : T = 36; 
                51  : T = 15; 
                52  : T = 107; 
                53  : T = 46; 
                54  : T = 233; 
                55  : T = 130; 
                56  : T = 165; 
                57  : T = 30; 
                58  : T = 123; 
                59  : T = 161; 
                60  : T = 209; 
                61  : T = 23;
                62  : T = 97; 
                63  : T = 16; 
                64  : T = 40; 
                65  : T = 91; 
                66  : T = 219; 
                67  : T = 61; 
                68  : T = 100; 
                69  : T = 10; 
                70  : T = 210; 
                71  : T = 109; 
                72  : T = 250; 
                73  : T = 127; 
                74  : T = 22; 
                75  : T = 138; 
                76  : T = 29; 
                77  : T = 108;
                78  : T = 244; 
                79  : T = 67; 
                80  : T = 207; 
                81  : T = 9; 
                82  : T = 178; 
                83  : T = 204; 
                84  : T = 74; 
                85  : T = 98; 
                86  : T = 126; 
                87  : T = 249; 
                88  : T = 167; 
                89  : T = 116; 
                90  : T = 34; 
                91  : T = 77; 
                92  : T = 193;
                93  : T = 200; 
                94  : T = 121; 
                95  : T = 5; 
                96  : T = 20; 
                97  : T = 113; 
                98  : T = 71; 
                99  : T = 35; 
                100 : T = 128; 
                101 : T = 13; 
                102 : T = 182; 
                103 : T = 94; 
                104 : T = 25; 
                105 : T = 226; 
                106 : T = 227; 
                107 : T = 199; 
                108 : T = 75;
                109 : T = 27; 
                110 : T = 41; 
                111 : T = 245; 
                112 : T = 230; 
                113 : T = 224; 
                114 : T = 43; 
                115 : T = 225; 
                116 : T = 177; 
                117 : T = 26; 
                118 : T = 155; 
                119 : T = 150; 
                120 : T = 212; 
                121 : T = 142; 
                122 : T = 218; 
                123 : T = 115;
                124 : T = 241; 
                125 : T = 73; 
                126 : T = 88; 
                127 : T = 105; 
                128 : T = 39; 
                129 : T = 114; 
                130 : T = 62; 
                131 : T = 255; 
                132 : T = 192; 
                133 : T = 201; 
                134 : T = 145; 
                135 : T = 214; 
                136 : T = 168; 
                137 : T = 158; 
                138 : T = 221;
                139 : T = 148; 
                140 : T = 154; 
                141 : T = 122; 
                142 : T = 12; 
                143 : T = 84; 
                144 : T = 82; 
                145 : T = 163; 
                146 : T = 44; 
                147 : T = 139; 
                148 : T = 228; 
                149 : T = 236; 
                150 : T = 205; 
                151 : T = 242; 
                152 : T = 217; 
                153 : T = 11;
                154 : T = 187; 
                155 : T = 146; 
                156 : T = 159; 
                157 : T = 64; 
                158 : T = 86; 
                159 : T = 239; 
                160 : T = 195; 
                161 : T = 42; 
                162 : T = 106; 
                163 : T = 198; 
                164 : T = 118; 
                165 : T = 112; 
                166 : T = 184; 
                167 : T = 172; 
                168 : T = 87;
                169 : T = 2; 
                170 : T = 173; 
                171 : T = 117; 
                172 : T = 176; 
                173 : T = 229; 
                174 : T = 247; 
                175 : T = 253; 
                176 : T = 137; 
                177 : T = 185; 
                178 : T = 99; 
                179 : T = 164; 
                180 : T = 102; 
                181 : T = 147; 
                182 : T = 45; 
                183 : T = 66;
                184 : T = 231; 
                185 : T = 52; 
                186 : T = 141; 
                187 : T = 211; 
                188 : T = 194; 
                189 : T = 206; 
                190 : T = 246; 
                191 : T = 238; 
                192 : T = 56; 
                193 : T = 110; 
                194 : T = 78; 
                195 : T = 248; 
                196 : T = 63; 
                197 : T = 240; 
                198 : T = 189;
                199 : T = 93; 
                200 : T = 92; 
                201 : T = 51; 
                202 : T = 53; 
                203 : T = 183; 
                204 : T = 19; 
                205 : T = 171; 
                206 : T = 72; 
                207 : T = 50; 
                208 : T = 33; 
                209 : T = 104; 
                210 : T = 101; 
                211 : T = 69; 
                212 : T = 8; 
                213 : T = 252; 
                214 : T = 83; 
                215 : T = 120;
                216 : T = 76; 
                217 : T = 135; 
                218 : T = 85; 
                219 : T = 54; 
                220 : T = 202; 
                221 : T = 125; 
                222 : T = 188; 
                223 : T = 213; 
                224 : T = 96; 
                225 : T = 235; 
                226 : T = 136; 
                227 : T = 208; 
                228 : T = 162; 
                229 : T = 129; 
                230 : T = 190;
                231 : T = 132; 
                232 : T = 156; 
                233 : T = 38; 
                234 : T = 47; 
                235 : T = 1; 
                236 : T = 7; 
                237 : T = 254; 
                238 : T = 24; 
                239 : T = 4; 
                240 : T = 216; 
                241 : T = 131; 
                242 : T = 89; 
                243 : T = 21; 
                244 : T = 28; 
                245 : T = 133; 
                246 : T = 37; 
                247 : T = 153;
                248 : T = 149; 
                249 : T = 80; 
                250 : T = 170; 
                251 : T = 68; 
                252 : T = 6; 
                253 : T = 169; 
                254 : T = 234; 
                255 : T = 151;
                default: T = x;
    endcase
end

reg [7:0] hash = 0; 
always @(key_byte)
begin
        hash = T[hash ^ key_byte];
end
endmodule