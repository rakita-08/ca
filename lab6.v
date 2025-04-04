module odd_parity(data,parity);
	input [3:0] data;
	output parity;
	assign parity= data[0]^data[1]^data[2]^data[3]^1'b1;
endmodule
module odd_parity_test;
	reg [3:0] data;
	wire parity;
	
	odd_parity dut(.data,.parity);
	initial
	begin
	$dumpfile("lab6.vcd");
	$dumpvars(0,odd_parity_test);
	$monitor($time,"data=%b,parity=%b",data,parity);
	data=4'b0000;
	#10 data=4'b0001;
	#10 data=4'b0010;
	#10 data=4'b0111;
	#10 data=4'b1111;
	#10 $finish;
	end
endmodule
