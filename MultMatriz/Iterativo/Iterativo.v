module Iterative(
MatrixResult,
MatrixA,
MatrixB,
Clk,
Start,
Finished
);

output [224:0]MatrixResult; // 5x3(15bits each)
output Finished;

input [149:0]MatrixA; // 5x2(15bits each)
input [89:0]MatrixB; // 2x3(15bits each)
input Clk;
input Start;

reg [224:0]MatrixResult;
reg [14:0] A [4:0][1:0];
reg [14:0] B [1:0][2:0];
reg [14:0] Result [4:0][2:0];

reg [2:0] row;
reg [1:0] col;

assign Finished = (row == 5);

always @(posedge Clk)
begin
if(Start)
begin
row = 0;
col = 0;
{A[0][0], A[0][1], A[1][0], A[1][1], A[2][0], A[2][1], A[3][0], A[3][1], A[4][0], A[4][1]} = MatrixA;
{B[0][0], B[0][1], B[0][2], B[1][0], B[1][1], B[1][2]} = MatrixB;
{Result[0][0], Result[0][1], Result[0][2], Result[1][0], Result[1][1], Result[1][2], Result[2][0], Result[2][1], Result[2][2], Result[3][0], Result[3][1], Result[3][2], Result[4][0], Result[4][1], Result[4][2]} = 225'b0;
end
else if(!Finished)
begin
Result[row][col] = A[row][0] * B[0][col] + A[row][1] * B[1][col];

if (row == 4 && col == 2)
begin
MatrixResult = {Result[0][0], Result[0][1], Result[0][2], Result[1][0], Result[1][1], Result[1][2], Result[2][0], Result[2][1], Result[2][2], Result[3][0], Result[3][1], Result[3][2], Result[4][0], Result[4][1], Result[4][2]};
end
else if (col == 2)
begin
row = row + 1;
col = 0;
end
else
begin
col = col + 1;
end
end

end
endmodule