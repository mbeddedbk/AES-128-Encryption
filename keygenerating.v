`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 04:13:14 PM
// Design Name: 
// Module Name: keygenerating
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module keygenerating(
input [3:0] rc,
input [127:0]key,
output reg [127:0] keyout);

   wire [31:0] w0,w1,w2,w3,tem;
   reg [31:0]rcon;


       assign w0 = key[127:96];
       assign w1 = key[95:64];
       assign w2 = key[63:32];
       assign w3 = key[31:0];


       sbox a1(.a(w3[23:16]),.c(tem[31:24]));
       sbox a2(.a(w3[15:8]),.c(tem[23:16]));
       sbox a3(.a(w3[7:0]),.c(tem[15:8]));
       sbox a4(.a(w3[31:24]),.c(tem[7:0]));

       always@*begin
      case(rc)
         4'h1: rcon=32'h01_00_00_00;
         4'h2: rcon=32'h02_00_00_00;
         4'h3: rcon=32'h04_00_00_00;
         4'h4: rcon=32'h08_00_00_00;
         4'h5: rcon=32'h10_00_00_00;
         4'h6: rcon=32'h20_00_00_00;
         4'h7: rcon=32'h40_00_00_00;
         4'h8: rcon=32'h80_00_00_00;
         4'h9: rcon=32'h1b_00_00_00;
         4'ha: rcon=32'h36_00_00_00;
         default: rcon=32'h00_00_00_00;
       endcase
       keyout[127:96]= w0 ^ tem ^ rcon;
       keyout[95:64] = w0 ^ tem ^ rcon^ w1;
       keyout[63:32] = w0 ^ tem ^ rcon^ w1 ^ w2;
       keyout[31:0]  = w0 ^ tem ^ rcon^ w1 ^ w2 ^ w3;
       end


endmodule