`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2022 13:16:26
// Design Name: 
// Module Name: tb_sine_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sine_gen();

reg clk ,reset;
reg [1:0] samp_freq;
reg [2:0] phase_sh;
wire [15:0] wave_out;


sine_gen dut2 (.clk(clk),.reset(reset),.samp_freq(samp_freq),.phase_sh(phase_sh),.wave_out(wave_out));

always #0.5 clk = ~clk;

initial begin

clk = 0;
reset = 0;
samp_freq = 0;
phase_sh = 0;

#2 reset = 1;
#2 reset = 0;

#20000 samp_freq = 1;
phase_sh = 0;

#2 reset = 1;
#2 reset = 0;

#20000 samp_freq = 2;
phase_sh = 0;

#2 reset = 1;
#2 reset = 0;

#20000 samp_freq = 3;
phase_sh = 0;

#2 reset = 1;
#2 reset = 0;



end
endmodule
