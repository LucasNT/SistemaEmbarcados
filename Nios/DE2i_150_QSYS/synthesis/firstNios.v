module firstNios(
	CLOCK_50,
	LED
);

input			CLOCK_50;
output 	[7:0] LED;

DE2i_150_QSYS u0(
	.clk_clk (CLOCK_50),
	.led_export(LED),
	.reset_reset_n (1'b1)
	);
endmodule