`timescale 1ns/1ns

module Memoria_As (
    input [31:0] Datos,
    input [5:0] DE,
    input [5:0] DL,
    input WE,
    output reg [31:0] Q
);
    reg [31:0] mem [0:31];

    always @(*) begin
        if (WE) begin
            mem[DE] <= Datos;
        end else begin
            Q <= mem[DL];
        end
    end
endmodule
