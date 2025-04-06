module LogicOp(Ai, Bi, in, sel, out);
	input[3:0] in;
	input[1:0] sel;
	output out;
	
	wire a0;
	wire a1;
	wire a2;
	wire a3;
	
	input Ai;
	input Bi;
	
	and g0(a0,Ai,Bi);
	or  g1(a1,Ai,Bi);
	xor g2(a2,Ai,Bi); 
	not g3(a3,Ai);
			
		assign in={a3, a2, a1, a0};
		assign out=in[sel];
		
endmodule
module logicOp_tb;

	reg Ain, Bin;
	wire out;
	reg[1:0] sel;

	LogicOp meow(.Ai(Ain), .Bi(Bin), .sel(sel), .out(out));

	initial
	begin
		$dumpfile("lab11.vcd");
		$dumpvars(0,logicOp_tb);
		$monitor($time, "Ai=%b, Bi=%b, S=%b, out=%b", Ain, Bin, sel, out );
			Ain=0; Bin=1; sel=2'b00;
		#5 	Ain=1;sel=2'b01;
		#5 	Bin=0;sel=2'b10;
		#5 	Ain=0;sel=2'b11;
		#5 $display("Rakita Rimal,Roll No-27,Lab-11");	
		#5 $finish;
	end
endmodule