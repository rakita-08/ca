module priority_encoder(in,out,valid);
    input [3:0] in;  // 4-bit input
    output reg [1:0] out; // 2-bit output for encoding the highest-priority active input
    output reg valid ;    // 1 if any input is active

    always @(in) begin	// block runs if the value of in changes
		
    // Default values
        out = 3'b000;  // Default to zero
        valid = 0;     // Default to invalid (no input is active)

        // Priority Encoding Logic
        casez (in)
            4'b1??? : begin out = 2'b11; valid = 1; end // in[7] is high
            4'b01?? : begin out = 2'b10; valid = 1; end // in[6] is high
            4'b001? : begin out = 2'b01; valid = 1; end // in[5] is high
            4'b0001 : begin out = 2'b00; valid = 1; end // in[4] is high
            
            default: begin out = 2'b00; valid = 0; end // No input is high
        endcase
    end

endmodule

module tb_priority_encoder;

    // Inputs to the DUT (Device Under Test)
    reg [3:0] in;     // 4-bit input for the encoder
    wire [1:0] out;   // 2-bit output from the encoder
    wire valid;       // Valid signal from the encoder

    // Instantiate the priority_encoder module
    priority_encoder uut (
        .in, 
        .out,
        .valid
    );

    // Testbench stimulus
    initial begin
		$dumpfile("lab12.vcd");
		$dumpvars(0,tb_priority_encoder);
        // Initialize input
        in = 4'b0000;  // All inputs are inactive (valid should be 0)

        // Monitor the outputs
        $monitor("Time = %0t | in = %b | out = %b | valid = %b", $time, in, out, valid);

        // Test case 1: No input is active
        #10 in = 4'b0000; // no inputs are inactive
  
        // Test case 2: Only the lowest priority input (in[0]) is active
        #10 in = 4'b0001; // Only in[0] is active

        // Test case 3: Middle priority input (in[2]) is active
        #10 in = 4'b0100; // Only in[4] is active

        // Test case 4: High priority input (in[3]) is active
        #10 in = 4'b1100; //  in[3] and in[2] is active

        // Test case 5: All inputs active
        #10 in = 8'b1111; // All inputs are active

        #10 $display("Rakita Rimal, Lab No:12,Roll No:27");
        #10 $finish;
    end

endmodule