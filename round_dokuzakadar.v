`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 04:23:30 PM
// Design Name: 
// Module Name: round_dokuzakadar
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


module round_dokuzakadar(
    input [3:0]roundConstant,
    input [127:0] key,
    input [127:0] veri,
    output [127:0] cikis,
    output [127:0] anahtar_cikis
    );
    
    // keygenerate -> Bayt deistir -> deneme-> mix collum 
    
    wire [127:0] cikan_anahtar, bayt_degistir_cikis, shiftrows_cikis, mixcolumn_cikti;
   
    
    keygenerating k1(
    .rc(roundConstant),
    .key(key),
    .keyout(cikan_anahtar)
    );
    
    BaytDegistir b1(
    .girisler(veri),
    .cikislar(bayt_degistir_cikis)
    );
    
    shiftrows d1(
    .giris(bayt_degistir_cikis),
    .cikis(shiftrows_cikis)
    );
    
    mix_column m1(
    .girdi(shiftrows_cikis),
    .cikti(mixcolumn_cikti)
    );
    
    assign cikis = mixcolumn_cikti ^ cikan_anahtar;
    assign anahtar_cikis = cikan_anahtar;
    
endmodule
