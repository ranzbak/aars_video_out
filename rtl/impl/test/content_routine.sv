`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 09:52:37 PM
// Design Name: 
// Module Name: content_routine
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


module content_routine(
    input clk,
    input [11:0] i_x_in,
    input [11:0] i_y_in,
    input        i_frame_in,
    input        pix_enable,
    output [7:0] o_r_out,
    output [7:0] o_g_out,
    output [7:0] o_b_out,
    output [10:0] o_fcount
    );
    
    // Parameters
    parameter h_res = 320;
    //parameter v_res = 72;
    
    // Output registers
    reg [7:0] r_r_out = 0;
    reg [7:0] r_g_out = 0;
    reg [7:0] r_b_out = 0;
    
    // Frame counter
    reg [10:0] r_fcount = 0;

    reg [15:0] r_addra;
    wire [23:0] w_douta;
    blk_mem_gen_0 your_instance_name (
        .clka(clk),    // input wire clka
        .ena(1'b1),      // input wire ena
        .addra(r_addra),  // input wire [15 : 0] addra
        .douta(w_douta)  // output wire [23 : 0] douta
    );


    // Just put out white all the time
    always @(posedge clk) begin
          if (i_frame_in == 1'b1) begin
            r_fcount = r_fcount + 1;
          end
    
        r_r_out <= 8'h00;
        r_g_out <= 8'h00;
        r_b_out <= 8'h00;
        case (r_fcount[9:8])
            2'b00: begin
                // Colored bars
                if (i_x_in <= (h_res/5)) begin
                    r_r_out <= 8'hFF;
                    r_g_out <= 8'hFF;
                    r_b_out <= 8'hFF;     
                end
                if (i_x_in <= ((h_res/5)*2) & i_x_in > (h_res/5) ) begin
                    r_r_out <= 8'hFF;
                    r_g_out <= 8'h00;
                    r_b_out <= 8'h00;     
                end
                if (i_x_in <= ((h_res/5)*3) & i_x_in > ((h_res/5)*2) ) begin
                    r_r_out <= 8'h00;
                    r_g_out <= 8'hFF;
                    r_b_out <= 8'h00;     
                end
                if (i_x_in <= ((h_res/5)*4) & i_x_in > ((h_res/5)*3) ) begin
                    r_r_out <= 8'h00;
                    r_g_out <= 8'h00;
                    r_b_out <= 8'hFF;     
                end
                if (i_x_in > ((h_res/5)*4) ) begin
                    r_r_out <= 8'h00;
                    r_g_out <= 8'h00;
                    r_b_out <= 8'h00;     
                end
            end
            2'b01: begin
                // Moving diamond patterns
                r_r_out <= i_x_in[7:0] + (i_y_in[7:0] + r_fcount[7:0]);
                r_g_out <= i_x_in[7:0] - i_y_in[7:0];
                r_b_out <= (i_x_in[8:1] + r_fcount[7:0]) + ~i_y_in[9:2];
            end
            2'b10: begin
                // // Grid pattern with green diagonal lines
                // if ((i_x_in[4:0] <= 2) | (i_y_in[4:0] <= 2)) begin
                //     r_r_out <= 7'hFF;
                //     r_g_out <= 7'hFF;
                //     r_b_out <= 7'hFF;
                // end
                // if ((i_x_in[5:0] - i_y_in[5:0]) <= 2 | (i_x_in[5:0] - ~i_y_in[5:0]) <= 2) begin
                //     r_r_out <= 7'h00;
                //     r_g_out <= 7'hFF;
                //     r_b_out <= 7'h00;
                // end
                //if (i_x_in[1:0] == 2'b00) begin
                if (i_y_in >= 40) begin
                    r_addra <= 320*(i_y_in[7:0]-40)+{6'b0, i_x_in[9:0]};
                end
                r_r_out <= w_douta[16 +: 8];
                r_g_out <= w_douta[8 +: 8];
                r_b_out <= w_douta[0 +: 8];

                // Try to get rid of artifacts
                if (i_y_in > 240 || i_x_in > 320) begin
                    r_r_out <= 8'b0;
                    r_g_out <= 8'b0;
                    r_b_out <= 8'b0;
                end
            end
            2'b11: begin
                // Thick white lines on black backdrop
                if ((i_x_in[4:0] > 10) & (i_x_in[4:0] < 15)) begin
                    r_r_out <= 8'hFF;
                    r_g_out <= 8'hFF;
                    r_b_out <= 8'hFF;
                end
                if ((i_y_in[4:0] > 10) & (i_y_in[4:0] < 15)) begin
                    r_r_out <= 8'hFF;
                    r_g_out <= 8'hFF;
                    r_b_out <= 8'hFF;
                end
            end
        endcase
    end
    
    // Assign generated value to the output
    assign o_r_out = r_r_out;
    assign o_g_out = r_g_out;
    assign o_b_out = r_b_out;
    
    // Frame count
    assign o_fcount = r_fcount[7:0];
endmodule
