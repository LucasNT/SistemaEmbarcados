module mulMatrix(
	input [119:0] A,
	input [95:0] B,
	output wire [239:0] C,
	input clk);

	reg [1:0] contador;
	reg [2:0] contadorLinha;
	reg [1:0] contadorColuna;
	reg [11:0] D1[0:4][0:3];
	reg [11:0] D2[0:4][0:3];
	reg [11:0] A1[0:4][0:1];
	reg [11:0] B1[0:1][0:3];
    reg [11:0] P1[0:4];
    reg [11:0] P2[0:3];
    integer i , j;

    assign C = {D2[0][0],D2[0][1],D2[0][2],D2[0][3],D2[1][0],D2[1][1],D2[1][2],D2[1][3],D2[2][0],D2[2][1],D2[2][2],D2[2][3],D2[3][0],D2[3][1],D2[3][2],D2[3][3],D2[4][0],D2[4][1],D2[4][2],D2[4][3]};

	always@(posedge clk) begin
		{A1[0][0],A1[0][1],A1[1][0],A1[1][1],A1[2][0],A1[2][1],A1[3][0],A1[3][1],A1[4][0],A1[4][1]} = A;
        {B1[0][0],B1[0][1],B1[0][2],B1[0][3],B1[1][0],B1[1][1],B1[1][2],B1[1][3]} = B;
        for(i = 0 ; i < 5 ; i= i+1) begin
            P1[i] <= A1[i][1];
        end
        for(i = 0; i < 4; i= i+1) begin
            P2[i] <= B1[1][i];
        end
        for(i = 0 ; i < 5 ; i= i+1) begin
            for( j = 0 ; j < 4 ; j= j+1) begin
                D1[i][j] <= A1[i][0] * B1[0][j];
            end
        end
        for( i = 0 ; i < 5 ; i= i+1) begin
            for(j = 0 ; j < 4 ; j= j+1) begin
                D2[i][j] <= D1[i][j] + P1[i][1] * P2[1][j];
            end
        end


	end

endmodule
