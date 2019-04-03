module mulMatrix(
	input [159:0] A,
	input [95:0] B,
	output [239:0] C,
	input clk);

	reg [1:0] contador;
	reg [2:0] contadorLinha;
	reg [1:0] contadorColuna;
	reg [15:0] D1[5][4];
	reg [15:0] D2[5][4];
	reg [15:0] A1[5][2];
	reg [15:0] B1[2][4];
    reg [15:0] P1[5];
    reg [15:0] P2[4];
    integer i , j;


	always@(posedge clk) begin
		{A1[0][0],A1[0][1],A1[1][0],A1[1][1],A1[2][0],A1[2][1],A1[3][0],A1[3][1],A1[4][0],A1[4][1]} = A;
        {B1[0][0],B1[0][1],B1[0][2],B1[0][3],B1[1][0],B1[1][1],B1[1][2],B1[1][3]} = B;
        for(i = 0 ; i < 5 ; i= i+1) begin
            P1[i] = A1[i][1];
        end
        for(i = 0; i < 4; i= i+1) begin
            P2[i] = B1[1][i];
        end
        for(i = 0 ; i < 5 ; i= i+1) begin
            for( j = 0 ; j < 4 ; j= j+1) begin
                D1[i][j] = A1[i][0] * B1[0][j];
            end
        end
        for( i = 0 ; i < 5 ; i= i+1) begin
            for(j = 0 ; j < 4 ; j= j+1) begin
                D2[i][j] = D1[i][j] + A1[i][1] * B1[1][j];
            end
        end


	end

endmodule
