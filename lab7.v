module even_parity(data,parity);
	input [3:0] data;
	output parity;
	assign parity= data[0]^data[1]^data[2]^data[3]^1'b1;
endmodule
module even_parity_test;
	reg [3:0] data;
	wire parity;
	
	even_parity dut(.data,.parity);
	initial
	begin
	$dumpfile("lab7.vcd");
	$dumpvars(0,even_parity_test);
	$monitor($time,"data=%b,parity=%b",data,parity);
	data=4'b0100;
	#10 data=4'b1010;
	#10 data=4'b0110;
	#10 data=4'b0111;
	#10 data=4'b1111;
	#10 $finish;
	end
endmodule
