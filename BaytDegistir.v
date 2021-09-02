`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 04:17:20 PM
// Design Name: 
// Module Name: BaytDegistir
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


module BaytDegistir(girisler,cikislar);
input [127:0]   girisler;
output [127:0]  cikislar;



genvar index_tutucu;
generate
    for (index_tutucu=127; index_tutucu >=7; index_tutucu = index_tutucu -8) begin
     sbox tobb(.a(girisler[index_tutucu:index_tutucu-7]),.c(cikislar[index_tutucu:index_tutucu-7]));
    end
endgenerate

endmodule