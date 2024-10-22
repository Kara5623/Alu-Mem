`timescale 1ns/1ns
module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output reg [31:0] R,
    output reg ZF
);
    always @(*) begin
        case (ALU_Sel)
            3'b000: R = A & B;       
            3'b001: R = A | B;      
            3'b010: R = A + B;       
            3'b011: R = A - B; 
            3'b100: R = (A < B) ? 32'b1 : 32'b0; // Comparación
            3'b101: R = ~(A | B);    // NOT
            default: R = 32'b0; 
        endcase
        
        ZF = (R == 32'b0); // Establecer ZF si el resultado es cero
    end
endmodule
`timescale 1ns/1ns
module ALU_tb();
    reg [31:0] A;
    reg [31:0] B;
    reg [2:0] ALU_Sel;
    wire [31:0] R;
    wire ZF;

    ALU alu_inst (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .R(R),
        .ZF(ZF)
    );

    initial begin
        A = 32'b00000000000000000000000000000001;
        B = 32'b00000000000000000000000000000001;

        ALU_Sel = 3'b010; // Suma
        #100;

        ALU_Sel = 3'b011; // Resta
        #100;

        ALU_Sel = 3'b000; // AND
        #100;

        ALU_Sel = 3'b001; // OR
        #100;

        ALU_Sel = 3'b100; // Comparación
        #100;

        ALU_Sel = 3'b101; // NOT
        #100;

        A = 32'b00000000000000000000000000000010;
        B = 32'b00000000000000000000000000000001;

        ALU_Sel = 3'b010; // Suma
        #100;

        ALU_Sel = 3'b011; // Resta
        #100;

        ALU_Sel = 3'b000; // AND
        #100;

        ALU_Sel = 3'b001; // OR
        #100;

        ALU_Sel = 3'b100; // Comparación
        #100;

        ALU_Sel = 3'b101; // NOT
        #100;

        A = 32'b00000000000000000000000000000000; // Prueba de cero
        B = 32'b00000000000000000000000000000000;

        ALU_Sel = 3'b010; // Suma
        #100;

        ALU_Sel = 3'b011; // Resta
        #100;

        ALU_Sel = 3'b100; // Comparación
        #100;
    end
endmodule

