module ckt_two(x, y, cin, S, cout);
    input x,y,cin;
    output S,cout;
    wire a,b,c,d;
	
	xor g1(a,x,y);
    and g2(b,cin,x);
    and g3(c,cin,y);
	and g4(d,x,y);
	xor g5(S,cin,a);
	or g6(cout,b,c,d);
    
endmodule	

module ckt_two_testbench;
    reg x,y,cin;
    wire S,cout;
    ckt_two dut(.x(x), .y(y), .cin(cin), .S(S), .cout(cout));

    initial 
	begin
        $dumpfile("lab4.vcd");
        $dumpvars(0, ckt_two_testbench);
        $monitor($time, "x=%b, y=%b, cin=%b, S=%b, cout=%b", x, y, cin, S, cout);
        x = 1; y = 1; cin=1;
        #10 y = 0;
        #10 x = 0;
        #10 y = 1;
        #10 $finish;
		end
endmodule
