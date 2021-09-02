`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 07:49:28 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk, rst,
    input[127:0] blok,
    input [127:0] anahtar,
    input g_gecerli,
    output hazir,
    output [127:0] sifre,
    output c_gecerli
    );
    
    reg c_gecerli_next = 0;
    reg [3:0] count = 0,countnext = 0;
    reg [127:0] boru_hatti_veri[9:0];
    reg [127:0] boru_hatti_key[9:0];
    reg [127:0] baslangickutu ;
    wire [127:0] ilkroundanahtar[9:0];
    wire [127:0]roundcikislar[9:0];
    
    assign sifre = (count == 10 ) ? roundcikislar[9] : 128'bX;
    assign c_gecerli = (count == 10) ? 1 : 0;
    assign hazir = (count == 10 && g_gecerli) ? 1:0;
    
    always@* begin
    baslangickutu = anahtar ^ blok;
    end
    
    round_dokuzakadar birinciround (
    .roundConstant(1),
    .key(anahtar),
    .veri(baslangickutu),
    .cikis(roundcikislar[0]),
    .anahtar_cikis(ilkroundanahtar[0])
    );
    

    
    genvar i;
    
    generate
            for(i = 1 ; i <= 8 ; i = i + 1) begin
            round_dokuzakadar geri_kalan_sekizround(
            .roundConstant(i+1),
            .key(boru_hatti_key[i-1]),
            .veri(boru_hatti_veri[i-1]),
            .cikis(roundcikislar[i]),
            .anahtar_cikis(ilkroundanahtar[i])
            );            
            end
    endgenerate
    
    
    round_on son_round (
    .roundConstant(10),
    .key(boru_hatti_key[8]),
    .veri(boru_hatti_veri[8]),
    .cikis(roundcikislar[9]),
    .anahtarcikis(ilkroundanahtar[9])
    );
    
    always@* begin
    countnext = count + 1 ;    
    end
    
    always@(posedge clk) begin
    
        if(g_gecerli && count < 10 && rst == 0) begin
        
            boru_hatti_key[count] <= ilkroundanahtar[count];
            boru_hatti_veri[count] <= roundcikislar[count];
            
            count <= countnext; 
        
        end
        
        if (rst) begin
            
            count = 0;           
        
        
        end 
        
        if (count == 10) begin
            
            count = 0;         
        
        
        end 
      
      
    end
    
    
    
endmodule
