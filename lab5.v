module ckt_three(x,y,S,C);
    input x,y;
    output S,C;
	
	xor g1(S,x,y);
    and g2(C,x,y);
    
endmodule	

module ckt_three_testbench;
    reg x,y;
    wire S,C;
    ckt_three dut(.x(x), .y(y), .S(S), .C(C));

    initial 
	begin
        $dumpfile("lab5.vcd");
        $dumpvars(0, ckt_three_testbench);
        $monitor($time, "x=%b, y=%b, S=%b, C=%b", x, y, S, C);
        x = 1; y = 1;
        #10 y = 0;
        #10 x = 0;
        #10 y = 1;
        #10 $finish;
		end
endmodule
