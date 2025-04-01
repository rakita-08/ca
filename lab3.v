module ckt_one(A, B, Y);
    input A, B;
    output Y;
    wire w, x, y, z;

    not g1(w, A);
    not g2(x, B);
    and g3(y, w, x);
    and g4(z, A, B);
	or g5(Y,y,z);
    
endmodule	

module ckt_one_testbench;
    reg A, B;
    wire Y;
    ckt_one dut(.A(A), .B(B), .Y(Y));

    initial 
	begin
        $dumpfile("lab3.vcd");
        $dumpvars(0, ckt_one_testbench);
        $monitor($time, "A=%b, B=%b, Y=%b", A, B, Y);
        A = 1; B = 1;
        #10 B = 0;
        #10 A = 0;
        #10 B = 1;
        #10 $finish;
		end
endmodule
