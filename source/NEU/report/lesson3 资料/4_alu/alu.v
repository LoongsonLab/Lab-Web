`timescale 1ns / 1ps
//*************************************************************************
//   > �ļ���: alu.v
//   > ����  ��ALUģ�飬����12�ֲ���
//   > ����  : LOONGSON
//   > ����  : 2016-04-14
//*************************************************************************
module alu(
    input  [11:0] alu_control,  // ALU�����ź�
    input  [31:0] alu_src1,     // ALU������1,Ϊ����
    input  [31:0] alu_src2,     // ALU������2��Ϊ����
    output [31:0] alu_result    // ALU���
    );

    // ALU�����źţ�������
    wire alu_add;   //�ӷ�����
    wire alu_sub;   //��������
    wire alu_slt;   //�з��űȽϣ�С����λ�����üӷ���������
    wire alu_sltu;  //�޷��űȽϣ�С����λ�����üӷ���������
    wire alu_and;   //��λ��
    wire alu_nor;   //��λ���
    wire alu_or;    //��λ��
    wire alu_xor;   //��λ���
    wire alu_sll;   //�߼�����
    wire alu_srl;   //�߼�����
    wire alu_sra;   //��������
    wire alu_lui;   //��λ����

    assign alu_add  = alu_control[11];
    assign alu_sub  = alu_control[10];
    assign alu_slt  = alu_control[ 9];
    assign alu_sltu = alu_control[ 8];
    assign alu_and  = alu_control[ 7];
    assign alu_nor  = alu_control[ 6];
    assign alu_or   = alu_control[ 5];
    assign alu_xor  = alu_control[ 4];
    assign alu_sll  = alu_control[ 3];
    assign alu_srl  = alu_control[ 2];
    assign alu_sra  = alu_control[ 1];
    assign alu_lui  = alu_control[ 0];

    wire [31:0] add_sub_result;
    wire [31:0] slt_result;
    wire [31:0] sltu_result;
    wire [31:0] and_result;
    wire [31:0] nor_result;
    wire [31:0] or_result;
    wire [31:0] xor_result;
    wire [31:0] sll_result;
    wire [31:0] srl_result;
    wire [31:0] sra_result;
    wire [31:0] lui_result;

  
//-----{�ӷ���}begin
//add,sub,slt,sltu��ʹ�ø�ģ��
    wire [31:0] adder_operand1;
    wire [31:0] adder_operand2;
    wire        adder_cin     ;
    wire [31:0] adder_result  ;
    wire        adder_cout    ;
    assign adder_operand1 = alu_src1; 
    assign adder_operand2 = alu_add ? alu_src2 : ~alu_src2; 
    assign adder_cin      = ~alu_add; //������Ҫcin 
    adder adder_module(
    .operand1(adder_operand1),
    .operand2(adder_operand2),
    .cin     (adder_cin     ),
    .result  (adder_result  ),
    .cout    (adder_cout    )
    );

    //�Ӽ����
    assign add_sub_result = adder_result;

 
//�����в������������ʵ�ַ���


endmodule
