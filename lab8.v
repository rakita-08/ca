module eightbit_adder(a,b,sum,ovf);
    input [7:0] a;  // First 8-bit number
    input [7:0] b;  // Second 8-bit number
    output [7:0] sum;  // Sum of a and b
    output ovf;// Overflow flag

    assign sum = a + b;
    assign ovf = (a[7] == b[7]) && (a[7] != sum[7]);

endmodule
module testbench;
    reg [7:0] a, b; 
    wire [7:0] sum;  
    wire ovf;  
    eightbit_adder dut(.a(a),.b(b),.sum(sum),.ovf(ovf));

    initial 
	begin
		$dumpfile("lab8.vcd");
		$dumpvars(0,testbench);
		$monitor($time,"Sum=%d,Overflow=%b",sum,ovf);
        a = 8'b00000000;b = 8'b00000000;
        #10 a = 8'b00000001;b = 8'b00000001;
        #10 a = 8'b01111111;b = 8'b00000001;  
        #10 a = 8'b10000000;b = 8'b10000000;
        #10 a = 8'b10000000;b = 8'b01111111;
        #10 $display("Name:Rakita Rimal, Roll No:27, Lab-8");
        #10 $finish;
    end
endmodule
