module display;
	initial
	begin
	$dumpfile("lab2.vcd");
	$dumpvars(0,display);
	
	$display("Name:Rakita Rimal");
	$display("Roll No:27");
	$display("Address:Kathmandu");
	end
endmodule