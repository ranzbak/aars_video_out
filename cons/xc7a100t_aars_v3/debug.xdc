#set_bus_skew -rise_from [get_pins -hierarchical -regexp {.*o_(([rgb]|adv)_.*|[hv]sync).*}] -to [get_clocks VIRTUAL_clk_out1_clk_wiz_0] 5.000

