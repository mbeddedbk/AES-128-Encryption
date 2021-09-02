`timescale 1ns / 1ps



module mix_column(input [127:0]girdi,
output[127:0]cikti

    );
    // 2 3 1 1
    // 1 2 3 1
    // 1 1 2 3
    // 3 1 1 2      
 reg[7:0] carp_2_3d[0:15][0:15];
 reg[7:0] carp_3_3d[0:15][0:15];
 reg[255:0]carp_2[15:0];
 reg[255:0]carp_3[15:0];
 reg [127:0]sabit_matris;
 reg [7:0] sabit_3d[0:3][0:3];
 reg[7:0]girdi_3d[0:3][0:3];
 reg[7:0]cikti_3d[0:3][0:3];
 
 integer i,j,k,a,b;
 
 initial begin 
 
 sabit_matris = 128'b00000010_00000011_00000001_00000001_00000001_00000010_00000011_00000001_00000001_00000001_00000010_00000011_00000011_00000001_00000001_00000010;
 
 
 carp_2[0]= 256'h00_02_04_06_08_0a_0c_0e_10_12_14_16_18_1a_1c_1e;
    carp_2[1]= 256'h20_22_24_26_28_2a_2c_2e_30_32_34_36_38_3a_3c_3e;
    carp_2[2]= 256'h40_42_44_46_48_4a_4c_4e_50_52_54_56_58_5a_5c_5e;
    carp_2[3]= 256'h60_62_64_66_68_6a_6c_6e_70_72_74_76_78_7a_7c_7e;
    carp_2[4]= 256'h80_82_84_86_88_8a_8c_8e_90_92_94_96_98_9a_9c_9e;
    carp_2[5]= 256'ha0_a2_a4_a6_a8_aa_ac_ae_b0_b2_b4_b6_b8_ba_bc_be;
    carp_2[6]= 256'hc0_c2_c4_c6_c8_ca_cc_ce_d0_d2_d4_d6_d8_da_dc_de;
    carp_2[7]= 256'he0_e2_e4_e6_e8_ea_ec_ee_f0_f2_f4_f6_f8_fa_fc_fe;
    carp_2[8]= 256'h1b_19_1f_1d_13_11_17_15_0b_09_0f_0d_03_01_07_05;
    carp_2[9]= 256'h3b_39_3f_3d_33_31_37_35_2b_29_2f_2d_23_21_27_25;
    carp_2[10]= 256'h5b_59_5f_5d_53_51_57_55_4b_49_4f_4d_43_41_47_45;
    carp_2[11]= 256'h7b_79_7f_7d_73_71_77_75_6b_69_6f_6d_63_61_67_65;
    carp_2[12]= 256'h9b_99_9f_9d_93_91_97_95_8b_89_8f_8d_83_81_87_85;
    carp_2[13]= 256'hbb_b9_bf_bd_b3_b1_b7_b5_ab_a9_af_ad_a3_a1_a7_a5;
    carp_2[14]= 256'hdb_d9_df_dd_d3_d1_d7_d5_cb_c9_cf_cd_c3_c1_c7_c5;
    carp_2[15]= 256'hfb_f9_ff_fd_f3_f1_f7_f5_eb_e9_ef_ed_e3_e1_e7_e5;

    carp_3[0]=256'h00_03_06_05_0c_0f_0a_09_18_1b_1e_1d_14_17_12_11;
    carp_3[1]=256'h30_33_36_35_3c_3f_3a_39_28_2b_2e_2d_24_27_22_21;
    carp_3[2]=256'h60_63_66_65_6c_6f_6a_69_78_7b_7e_7d_74_77_72_71;
    carp_3[3]=256'h50_53_56_55_5c_5f_5a_59_48_4b_4e_4d_44_47_42_41;
    carp_3[4]=256'hc0_c3_c6_c5_cc_cf_ca_c9_d8_db_de_dd_d4_d7_d2_d1;
    carp_3[5]=256'hf0_f3_f6_f5_fc_ff_fa_f9_e8_eb_ee_ed_e4_e7_e2_e1;
    carp_3[6]=256'ha0_a3_a6_a5_ac_af_aa_a9_b8_bb_be_bd_b4_b7_b2_b1;
    carp_3[7]=256'h90_93_96_95_9c_9f_9a_99_88_8b_8e_8d_84_87_82_81;
    carp_3[8]=256'h9b_98_9d_9e_97_94_91_92_83_80_85_86_8f_8c_89_8a;
    carp_3[9]=256'hab_a8_ad_ae_a7_a4_a1_a2_b3_b0_b5_b6_bf_bc_b9_ba;
    carp_3[10]=256'hfb_f8_fd_fe_f7_f4_f1_f2_e3_e0_e5_e6_ef_ec_e9_ea;
    carp_3[11]=256'hcb_c8_cd_ce_c7_c4_c1_c2_d3_d0_d5_d6_df_dc_d9_da;
    carp_3[12]=256'h5b_58_5d_5e_57_54_51_52_43_40_45_46_4f_4c_49_4a;
    carp_3[13]=256'h6b_68_6d_6e_67_64_61_62_73_70_75_76_7f_7c_79_7a;
    carp_3[14]=256'h3b_38_3d_3e_37_34_31_32_23_20_25_26_2f_2c_29_2a;
    carp_3[15]=256'h0b_08_0d_0e_07_04_01_02_13_10_15_16_1f_1c_19_1a;
 
 
 
 
 end
 
 always @* begin 
 
 for(a=0;a<16;a=a+1)begin
    {carp_2_3d[a][0],carp_2_3d[a][1],carp_2_3d[a][2],carp_2_3d[a][3],
    carp_2_3d[a][4],carp_2_3d[a][5],carp_2_3d[a][6],carp_2_3d[a][7],
    carp_2_3d[a][8],carp_2_3d[a][9],carp_2_3d[a][10],carp_2_3d[a][11],
    carp_2_3d[a][12],carp_2_3d[a][13],carp_2_3d[a][14],carp_2_3d[a][15]}=carp_2[a];
    end
    
    for(b=0;b<16;b=b+1)begin
    {carp_3_3d[b][0],carp_3_3d[b][1],carp_3_3d[b][2],carp_3_3d[b][3],
    carp_3_3d[b][4],carp_3_3d[b][5],carp_3_3d[b][6],carp_3_3d[b][7],
    carp_3_3d[b][8],carp_3_3d[b][9],carp_3_3d[b][10],carp_3_3d[b][11],
    carp_3_3d[b][12],carp_3_3d[b][13],carp_3_3d[b][14],carp_3_3d[b][15]}=carp_3[b];
    end
 

 {sabit_3d[0][0],sabit_3d[0][1],sabit_3d[0][2],sabit_3d[0][3],
 sabit_3d[1][0],sabit_3d[1][1],sabit_3d[1][2],sabit_3d[1][3],
 sabit_3d[2][0],sabit_3d[2][1],sabit_3d[2][2],sabit_3d[2][3],
 sabit_3d[3][0],sabit_3d[3][1],sabit_3d[3][2],sabit_3d[3][3]}=sabit_matris;
 
 {girdi_3d[0][0],girdi_3d[1][0],girdi_3d[2][0],girdi_3d[3][0],
 girdi_3d[0][1],girdi_3d[1][1],girdi_3d[2][1],girdi_3d[3][1],
 girdi_3d[0][2],girdi_3d[1][2],girdi_3d[2][2],girdi_3d[3][2],
 girdi_3d[0][3],girdi_3d[1][3],girdi_3d[2][3],girdi_3d[3][3]}=girdi;
 
 {cikti_3d[0][0],cikti_3d[0][1],cikti_3d[0][2],cikti_3d[0][3],
 cikti_3d[1][0],cikti_3d[1][1],cikti_3d[1][2],cikti_3d[1][3],
 cikti_3d[2][0],cikti_3d[2][1],cikti_3d[2][2],cikti_3d[2][3],
 cikti_3d[3][0],cikti_3d[3][1],cikti_3d[3][2],cikti_3d[3][3]}=128'd0;
 
 for(i=0; i<4; i = i+1)begin
    for(j=0; j<4; j = j+1)begin
        for(k=0; k<4; k = k+1)begin
       if(sabit_3d[i][k]==2)begin 
       cikti_3d[i][j] = cikti_3d[i][j] ^ carp_2_3d[girdi_3d[k][j][7-:4]][girdi_3d[k][j][3-:4]];
       end
       
       else if(sabit_3d[i][k]==3)begin 
       cikti_3d[i][j] = cikti_3d[i][j] ^ carp_3_3d[girdi_3d[k][j][7-:4]][girdi_3d[k][j][3-:4]];
       end
       
       else if(sabit_3d[i][k]==1)begin
        cikti_3d[i][j] = cikti_3d[i][j] ^ (sabit_3d[i][k]*girdi_3d[k][j]);
       end 
           
                              end
                          end
                       end
                       
 
 
 end
 
 
 assign cikti = {cikti_3d[0][0],cikti_3d[1][0],cikti_3d[2][0],cikti_3d[3][0],
 cikti_3d[0][1],cikti_3d[1][1],cikti_3d[2][1],cikti_3d[3][1],
 cikti_3d[0][2],cikti_3d[1][2],cikti_3d[2][2],cikti_3d[3][2],
 cikti_3d[0][3],cikti_3d[1][3],cikti_3d[2][3],cikti_3d[3][3]};
 
   
    
endmodule
