module shi(si_ir, si_il, a0, a1, a2, a3, inreg1, sel, H0, H1, H2, H3);

input si_ir;

input si_il;

input a0;
input a1;
input a2;
input a3;

input[1:0] inreg1;
input[1:0] inreg2;
input[1:0] inreg3;
input[1:0] inreg4;

input sel;

output H0;
output H1;
output H2;
output H3;
	
	assign inreg1={si_ir, a1};
	assign inreg2={a0, a2};
	assign inreg3={a1, a3};
	assign inreg4={a2, si_il};
	
	assign H0=inreg1[sel];
	assign H1=inreg2[sel];
	assign H2=inreg3[sel];
	assign H3=inreg4[sel];
	
endmodule
module shiftest;

	reg a0;
	reg a1;
	reg a2;
	reg a3; 

	reg s;

	reg IR=0;
	reg IL=0;

	wire H0;
	wire H1;
	wire H2;
	wire H3;

	shi SH(.si_ir(IR), .si_il(IL), .a0(a0), .a1(a1), .a2(a2), .a3(a3), .sel(s), .H0(H0), .H1(H1), .H2(H2), .H3(H3) );
	initial
	begin
		$dumpfile("lab10.vcd");
		$dumpvars(0,shiftest);
		$monitor($time, "a0=%b,a1=%b,a2=%b,a3=%b,IL=%b,IR=%b, S=%b,H0=%b, H1=%b, H2=%b, H3=%b",a0,a1,a2,a3,IL,IR,s, H0, H1, H2, H3);
		a0=0; a1=1; a2=1; a3=0; s=0;
		#5 a1=0;
		#5 a2=0;
		#5 a3=1;
		#5 a0=1; s=1;
		#5 $display("Name:Rakita Rimal, Roll No:27, Lab-10");
		#5 $finish;
	end
endmodule