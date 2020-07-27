# Core board pins
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property PACKAGE_PIN U22 [get_ports sys_clk]
set_property PACKAGE_PIN H19 [get_ports sys_rst_n]

# Fix to get the clock to get routed correctly
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets instance_name/inst/clk_in1_clk_wiz_0]

# Indicate the SPI path count to the Flash chip
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# Main clock constraint
create_clock -period 20.000 -name sys_clk -waveform {0.000 10.000} [get_ports sys_clk]

create_clock -period 5.000 -name VIRTUAL_clk_out1_clk_wiz_0 -waveform {0.000 2.500}
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports {o_b[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports {o_b[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports {o_g[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports {o_g[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports {o_leds[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports {o_leds[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports {o_r[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports {o_r[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports o_adv_clk]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports o_adv_clk]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports o_adv_de]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports o_adv_de]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports o_hsync]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports o_hsync]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.000 [get_ports o_vsync]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay -2.500 [get_ports o_vsync]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
