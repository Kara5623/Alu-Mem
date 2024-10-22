`timescale 1ns/1ns

module Mem(
    input [31:0] DatoEs,       
    input [5:0] DirLec,           
    input [5:0] Dir2Lec,
	input [5:0] DirEs,
    input WE,                                 
    output reg [31:0] Dato1,
	output reg [31:0] Dato2
);

 reg [31:0] mem [0:31];
 
 initial
	begin
		$readmemh("datos.txt",mem);
		#10;
	end


    always @(*) begin
        if (WE) begin
            mem[DirEs] <= DatoEs;
        end
        else
		begin
        Dato1 <= mem[DirLec];
		Dato2 <= mem[Dir2Lec];
    end
	end

endmodule

`timescale 1ns/1ns

module Mem(
    input [31:0] DatoEs,       
    input [5:0] DirLec,           
    input [5:0] Dir2Lec,
	input [5:0] DirEs,
    input WE,                                 
    output reg [31:0] Dato1,
	output reg [31:0] Dato2
);

 reg [31:0] mem [0:31];
 
 initial
	begin
		$readmemh("datos.txt",mem);
		#10;
	end


    always @(*) begin
        if (WE) begin
            mem[DirEs] <= DatoEs;
        end
        else
		begin
        Dato1 <= mem[DirLec];
		Dato2 <= mem[Dir2Lec];
    end
	end

endmodule

module Memoria_Res (
    input [31:0] Datos,    
    input [4:0] Dir,       
    input WE,             
    output reg [31:0] Q    
);
    
    reg [31:0] mem [31:0];

    always @(*) begin
        if (WE) begin
            mem[Dir] = Datos;  
        end
        Q = mem[Dir];          
    end
endmodule