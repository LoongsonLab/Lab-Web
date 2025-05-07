`timescale 1ns / 1ps
//*************************************************************************
//   > �ļ���: regfile.v
//   > ����  ���Ĵ�����ģ�飬ͬ��д���첽��
//   > ����  : LOONGSON
//   > ����  : 2016-04-14
//*************************************************************************
module regfile(
    input             clk,
    input             wen,
    input      [4 :0] raddr1,
    input      [4 :0] raddr2,
    input      [4 :0] waddr,
    input      [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2,
    input      [4 :0] test_addr,
    output reg [31:0] test_data
    );
    reg [31:0] rf[31:0];
     
    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clock
    // register 0 hardwired to 0

//��������첽��ͬ��д�Ĵ����ѵĴ���



endmodule
