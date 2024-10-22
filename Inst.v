`timescale 1ns/1ns
module Inst (
    input [19:0] instruccion,
    output [31:0] ALU_Result
);

    wire [31:0] Dato1;
    wire [31:0] Dato2;
    wire [31:0] ResALU;
    wire WE;
    wire ZF;
    wire [2:0] ALU_Sel;
    wire [4:0] OperA;
    wire [4:0] OperB;
    wire [4:0] ResMem;

    assign WE = instruccion[19];
    assign ALU_Sel = instruccion[17:15];
    assign OperA = instruccion[14:10];
    assign OperB = instruccion[9:5];
    assign ResMem = instruccion[4:0];

    Mem mem_operandos (
        .DatoEs(32'b0),
        .DirLec(OperA),
        .Dir2Lec(OperB),
        .DirEs(5'b0),
        .WE(WE),
        .Dato1(Dato1),
        .Dato2(Dato2)
    );

    ALU alu_inst (
        .A(Dato1),
        .B(Dato2),
        .ALU_Sel(ALU_Sel),
        .R(ResALU),
        .ZF(ZF)
    );

    Memoria_As mem_res (
        .Datos(ResALU),
        .DE(ResMem),
        .DL(ResMem),
        .WE(instruccion[18]),
        .Q(ALU_Result)
    );
endmodule

