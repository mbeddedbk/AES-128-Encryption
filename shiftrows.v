`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 04:28:34 PM
// Design Name: 
// Module Name: shiftrows
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


module shiftrows(
    input [127:0]giris,
    output [127:0]cikis
    );     
   
       
   
   assign cikis = {giris[127:120],giris[87:80],giris[47:40],giris[7:0],
                   giris[95:88],giris[55:48],giris[15:8],giris[103:96],
                   giris[63:56],giris[23:16],giris[111:104],giris[71:64],
                   giris[31:24],giris[119:112], giris[79:72], giris[39:32]};
    
  
    
endmodule