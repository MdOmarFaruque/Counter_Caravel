`default_nettype none

module user_proj_example (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply  
    inout vssd1,	// User area 1 digital ground  
`endif  
    input  wb_clk_i,
    input  wb_rst_i,
    
    output reg [3:0] io_out,
    output wire [3:0] io_oeb
);
    assign io_oeb = 4'b0000000;
   
   

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile ("user_proj_example.vcd");
            $dumpvars (0, user_proj_example);
            #1;
        end
        localparam MAX_COUNT = 100;
    `else
        localparam MAX_COUNT = 100;
    `endif


     always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
           io_out <= 4'd0; // Reset to 0 on rising edge of rst
        end else begin
           io_out <= io_out + 4'd1; // Increment on rising edge of clk
        end
    end

    endmodule
`default_nettype wire
