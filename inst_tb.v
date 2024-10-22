`timescale 1ns/1ns

module Inst_tb();
    reg [19:0] instruccion;
    wire [31:0] ALU_Result;

    Inst utt(.instruccion(instruccion), .ALU_Result(ALU_Result));

    initial begin
        #100;
        instruccion = 20'b01_00100_010_00000_00011;
        #100;
        instruccion = 20'b01_00101_011_00000_00011;
        #100;
        instruccion = 20'b01_00100_010_00000_00000;
        #100;
        instruccion = 20'b01_00101_011_00000_00000;
        #100;
        instruccion = 20'b01_00110_010_00000_00000;
        #100;
        instruccion = 20'b01_00111_011_00000_00000;
        #100;
        instruccion = 20'b01_01000_010_00000_00000;
        #100;
        instruccion = 20'b01_01001_011_00000_00000;
        #100;
        instruccion = 20'b01_01010_000_00000_00000;
        #100;
        instruccion = 20'b01_01011_001_00000_00000;
        #100;
        instruccion = 20'b01_01100_010_00000_00000;
        #100;
    end
endmodule

