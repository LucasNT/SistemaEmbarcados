module Combinacional(
    MatrixResult,
    MatrixA,
    MatrixB
);

output [119:0]MatrixResult; // 5x3(15bits each)
input [79:0]MatrixA;       // 5x2(15bits each)
input [47:0]MatrixB;        // 2x3(15bits each)
reg [119:0]MatrixResult;
reg [7:0] A [4:0][1:0];
reg [7:0] B [1:0][2:0];
reg [7:0] Result [4:0][2:0];

/*
output [224:0]MatrixResult; // 5x3(15bits each)
input [149:0]MatrixA;       // 5x2(15bits each)
input [89:0]MatrixB;        // 2x3(15bits each)
reg [224:0]MatrixResult;
reg [14:0] A [4:0][1:0];
reg [14:0] B [1:0][2:0];
reg [14:0] Result [4:0][2:0];
*/
integer i, j;

always@(MatrixA or MatrixB) begin
    {A[0][0], A[0][1], A[1][0], A[1][1], A[2][0], A[2][1], A[3][0], A[3][1], A[4][0], A[4][1]} = MatrixA;
    {B[0][0], B[0][1], B[0][2], B[1][0], B[1][1], B[1][2]} = MatrixB;
    {Result[0][0], Result[0][1], Result[0][2], Result[1][0], Result[1][1], Result[1][2], Result[2][0], Result[2][1], Result[2][2], Result[3][0], Result[3][1], Result[3][2], Result[4][0], Result[4][1], Result[4][2]} = 119'b0;
    for(i = 0; i < 5; i = i + 1) begin
        for(j = 0; j < 3; j = j + 1) begin
            Result[i][j] = A[i][0] * B[0][j] + A[i][1] * B[1][j];
        end
    end
    MatrixResult = {Result[0][0], Result[0][1], Result[0][2], Result[1][0], Result[1][1], Result[1][2], Result[2][0], Result[2][1], Result[2][2], Result[3][0], Result[3][1], Result[3][2], Result[4][0], Result[4][1], Result[4][2]};
end
endmodule
