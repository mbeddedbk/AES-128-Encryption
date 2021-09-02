`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 04:25:03 PM
// Design Name: 
// Module Name: round_on
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


module round_on(
    input [3:0]roundConstant,
    input [127:0] key,
    input [127:0] veri,
    output [127:0] cikis,
    output [127:0] anahtarcikis
    );
    
    // keygenerate -> Bayt deistir -> shiftrows
    
    wire [127:0] cikan_anahtar, bayt_degistir_cikis, shiftrows_cikis;
    
    keygenerating k10 (
    .rc(roundConstant),
    .key(key),
    .keyout(cikan_anahtar));
    
    BaytDegistir b10 (
    .girisler(veri),
    .cikislar(bayt_degistir_cikis));
    
    shiftrows s10(
    .giris(bayt_degistir_cikis),
    .cikis(shiftrows_cikis));
    
    assign cikis = shiftrows_cikis ^ cikan_anahtar;
    assign anahtarcikis = shiftrows_cikis;
    
endmodule
