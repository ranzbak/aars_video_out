#
# Paul Honig 2020
#
# I/O Board
# Open AARS board V3
#
# Core board
# QMTech Artix-7XC7A100T Core Board

# ADV SDA/SCL
set_property PACKAGE_PIN G4 [get_ports i_adv_scl]
set_property IOSTANDARD LVCMOS33 [get_ports i_adv_scl]
set_property PACKAGE_PIN G2 [get_ports i_adv_sda]
set_property IOSTANDARD LVCMOS33 [get_ports i_adv_sda]

# CLOCK AND ENABLE SIGNALS
set_property PACKAGE_PIN D25 [get_ports o_adv_de]
set_property IOSTANDARD LVCMOS33 [get_ports o_adv_de]
set_property PACKAGE_PIN G21 [get_ports o_adv_clk]
set_property IOSTANDARD LVCMOS33 [get_ports o_adv_clk]
set_property DRIVE 8 [get_ports o_adv_clk]

# SYNC SIGNALS
set_property PACKAGE_PIN E26 [get_ports o_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports o_hsync]
set_property PACKAGE_PIN D26 [get_ports o_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports o_vsync]

# RED CHANNEL 
set_property PACKAGE_PIN C2 [get_ports {o_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[0]}]
set_property PACKAGE_PIN B2 [get_ports {o_r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[1]}]
set_property PACKAGE_PIN A2 [get_ports {o_r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[2]}]
set_property PACKAGE_PIN A3 [get_ports {o_r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[3]}]
set_property PACKAGE_PIN A4 [get_ports {o_r[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[4]}]
set_property PACKAGE_PIN B4 [get_ports {o_r[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[5]}]
set_property PACKAGE_PIN A5 [get_ports {o_r[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[6]}]
set_property PACKAGE_PIN B5 [get_ports {o_r[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_r[7]}]

# GREEN CHANNEL 
set_property PACKAGE_PIN J25 [get_ports {o_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[0]}]
set_property PACKAGE_PIN G20 [get_ports {o_g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[1]}]
set_property PACKAGE_PIN F2 [get_ports {o_g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[2]}]
set_property PACKAGE_PIN E1 [get_ports {o_g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[3]}]
set_property PACKAGE_PIN C1 [get_ports {o_g[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[4]}]
set_property PACKAGE_PIN E5 [get_ports {o_g[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[5]}]
set_property PACKAGE_PIN D5 [get_ports {o_g[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[6]}]
set_property PACKAGE_PIN C4 [get_ports {o_g[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_g[7]}]

# BLUE CHANNEL 
set_property PACKAGE_PIN E25 [get_ports {o_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[0]}]
set_property PACKAGE_PIN G26 [get_ports {o_b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[1]}]
set_property PACKAGE_PIN H26 [get_ports {o_b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[2]}]
set_property PACKAGE_PIN E23 [get_ports {o_b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[3]}]
set_property PACKAGE_PIN F23 [get_ports {o_b[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[4]}]
set_property PACKAGE_PIN F22 [get_ports {o_b[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[5]}]
set_property PACKAGE_PIN G22 [get_ports {o_b[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[6]}]
set_property PACKAGE_PIN J26 [get_ports {o_b[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_b[7]}]

# Constrain timing on the output ports
# RGB
# Control












