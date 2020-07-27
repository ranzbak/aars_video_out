`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 06:22:06 PM
// Design Name: 
// Module Name: aars_video_top
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


module aars_video_top(
    input            sys_clk,
    input            sys_rst_n,
    output reg [3:0] o_leds,
    output reg       o_hsync,
    output reg       o_vsync,
    output           o_adv_de,
    output           o_adv_clk,
    output [7:0]     o_r,
    output [7:0]     o_g,
    output [7:0]     o_b,
    // dummy port for the i2c bus
    // This test ignores the I2C bus between the ESP32 and the ADV7511
    input            i_adv_scl,
    input            i_adv_sda
    );
    
    // Core signals
    wire clk;
    wire locked;
    
    // Video interconnects
    
    // Generated RGB values
    wire [7:0] w_r;
    wire [7:0] w_g;
    wire [7:0] w_b;
    
    // Current video postion
    wire [11:0] w_x;
    wire [11:0] w_y;
    wire        w_frame_end;
    
    // Same for PAL signal
    wire [7:0]  w_pal_r;
    wire [7:0]  w_pal_g;
    wire [7:0]  w_pal_b;
    wire        w_pal_hsync;
    wire        w_pal_vsync;
    wire [11:0] w_pal_x;
    wire [11:0] w_pal_y;
    wire        w_pal_frame;
    wire        w_pal_de;
    wire        w_pal_clk;

    // content generator output
    wire [7:0]  w_src_r;
    wire [7:0]  w_src_g;
    wire [7:0]  w_src_b;
    
    // enable to indicate the next data point is needed
    reg r_adv_de;
    reg r_adv_clk;
    assign o_adv_de = r_adv_de;
    assign o_adv_clk = r_adv_clk;
    
    // delay loop
    parameter C_DELAY = 148000000/2;
    reg [$clog2(C_DELAY):0] count = C_DELAY;
    
    // Frame counter
    wire [10:0] w_fcount;
    
    // Debugging Logical analyzer
    ila_0 your_instance_name (
        .clk(clk), // input wire clk
    
    
        .probe0(o_adv_de), // input wire [0:0]  probe0  
        .probe1(o_adv_clk), // input wire [0:0]  probe1 
        .probe2(r_adv_de), // input wire [0:0]  probe2 
        .probe3(r_adv_clk) // input wire [0:0]  probe3
    );
    
    // Clock generation IP
    clk_wiz_0 instance_name
    (
       // Clock out ports
       .clk_out1(clk),     // output clk_out1
       // Status and control signals
       .resetn(sys_rst_n), // input resetn
       .locked(locked),       // output locked
       // Clock in ports
       .clk_in1(sys_clk)      // input clk_in1
     );
    
//    always @(posedge clk) begin
//        count <= count - 1;
//        if (count == '0) begin
//            count <= C_DELAY;
//            leds <= ~leds;
//        end
//    end
    
    // Generate test display data
    content_routine my_routine(
        .clk(clk),
        .i_x_in(w_pal_x),
        .i_y_in(w_pal_y),
        .i_frame_in(w_pal_frame),
        .pix_enable(),
        .o_r_out(w_src_r),
        .o_g_out(w_src_g),
        .o_b_out(w_src_b),
        .o_fcount(w_fcount)
    );
    
    // Convert the generated output data into video out signals
    signal_pal_generator pal_gen(
        .clk(clk),
        .o_hsync(w_pal_hsync),
        .o_vsync(w_pal_vsync),
        .i_r(w_src_r),
        .i_g(w_src_g),
        .i_b(w_src_b),
        .o_x(w_pal_x),
        .o_y(w_pal_y),
        .o_frame(w_pal_frame),
        .o_r(w_pal_r),
        .o_g(w_pal_g),
        .o_b(w_pal_b),
        .o_adv_clk(w_pal_clk),
        .o_adv_en(w_pal_de)
    );

    // Upsample routine
    wire [6:0] w_vblank_width;
    pal_to_hd_upsample myupsample(
        .clk(clk),
        // Pal input
        .i_pal_hsync(w_pal_hsync),
        .i_pal_vsync(w_pal_vsync),
        .i_pal_r(w_pal_r),
        .i_pal_g(w_pal_g),
        .i_pal_b(w_pal_b),
        // HD upsampled output
        .o_hd_r(w_r),
        .o_hd_g(w_g),
        .o_hd_b(w_b),
        //.o_vblank_width(w_vblank_width),
        .o_frame_end(w_frame_end),
        // HD sync pulse
        .i_hd_hsync(o_hsync),
        .i_hd_vsync(o_vsync),
        .i_hd_clk(r_adv_clk),
        .i_hd_four_three(1'b0)
    );
    
    // Convert the generated output data into video out signals
    signal_generator hd_gen(
        .clk(clk),
        .o_hsync(o_hsync),
        .o_vsync(o_vsync),
        //.i_vblank_width(w_vblank_width),
        .i_frame_end(w_frame_end),
        .i_r(w_r),
        .i_g(w_g),
        .i_b(w_b),
        .o_x(w_x),
        .o_y(w_y),
        .o_r(o_r),
        .o_g(o_g),
        .o_b(o_b),
        .o_adv_clk(r_adv_clk),
        .o_adv_en(r_adv_de)
    );
    
    // Frame count to leds
    assign o_leds = w_fcount[7:0];

endmodule
