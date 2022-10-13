`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2022 11:27:07
// Design Name: 
// Module Name: sine_gen
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
module counter(
    input reset,
    input[1:0] mode,
    input[12:0] start,
    input clk,
    output reg[12:0] out
    );
    
   
   always @(posedge clk or posedge reset) begin
   if (reset)
    out <= start;
   else if (out == 8192)
    out <= 0;
   else
   case(mode)
    2'b00: out<=out+8; 
    2'b01: out<=out+4; 
    2'b10: out<=out+2; 
    2'b11: out<=out+1; 
    endcase
   end    
 
         
endmodule


module sine_gen(input clk, reset, input [1:0] samp_freq, input [2:0] phase_sh, output reg [15:0] wave_out);

parameter SIZE = 8192;

reg [15:0] lut [SIZE-1:0];
reg [12:0] phase [7:0];

initial begin
    $readmemh("E:/project_2/project_2.srcs/sources_1/new/sine_lut.mem"  ,lut);
    $readmemh("E:/project_2/project_2.srcs/sources_1/new/phase_lut.mem"  ,phase); 
    
end  


wire [12:0] counter_start ; 
wire [12:0] i;

assign counter_start = phase[phase_sh];

counter dut_1(.reset(reset),
              .clk(clk),
              .mode(samp_freq),
              .start(counter_start),
              .out(i));       

always @ *
begin
    wave_out <= lut[i];
end

endmodule
