module MUX(in,sel,out);
	input [15:0] in;
	input [3:0] sel;
	output out;
	
	assign out=in[sel];
endmodule
module MUX_tb;
	reg [15:0] X;
	reg [3:0] S;
	wire Y;
	
	MUX meow(.in(X),.sel(S),.out(Y));
	initial
	begin
		$dumpfile("lab9.vcd");
		$dumpvars(0,MUX_tb);
		$monitor($time,"X=%b,S=%b,Y=%b",X,S,Y);
		X=16'h20a3;S=4'h6;
		#10 X=16'h10b3;S=4'h0;
		#10 X=16'hcd04;S=4'hf;
		#10 X=16'h691e;S=4'h3;
		#10 X=16'h00aa;S=4'hb;
		#10 $display("Name:Rakita Rimal, Roll No:27, Lab-9");
        #10 $finish;
	end
	
endmodule
