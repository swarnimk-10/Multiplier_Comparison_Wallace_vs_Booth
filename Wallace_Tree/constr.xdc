# ================= CLOCK =================
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]

# ================= INPUTS =================
set_property PACKAGE_PIN D4 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN C5 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

# Apply realistic input delays
set_input_delay -clock clk 0.5 [get_ports rst]
set_input_delay -clock clk 2 [get_ports start]

# ========== Multiplicand [15:0] ==========
set_property IOSTANDARD LVCMOS33 [get_ports multiplicand[*]]
set_input_delay -clock clk 2 [get_ports multiplicand[*]]

set_property PACKAGE_PIN H2 [get_ports {multiplicand[0]}]
set_property PACKAGE_PIN H1 [get_ports {multiplicand[1]}]
set_property PACKAGE_PIN G4 [get_ports {multiplicand[2]}]
set_property PACKAGE_PIN G3 [get_ports {multiplicand[3]}]
set_property PACKAGE_PIN F4 [get_ports {multiplicand[4]}]
set_property PACKAGE_PIN F3 [get_ports {multiplicand[5]}]
set_property PACKAGE_PIN E2 [get_ports {multiplicand[6]}]
set_property PACKAGE_PIN E1 [get_ports {multiplicand[7]}]
set_property PACKAGE_PIN D2 [get_ports {multiplicand[8]}]
set_property PACKAGE_PIN D1 [get_ports {multiplicand[9]}]
set_property PACKAGE_PIN C2 [get_ports {multiplicand[10]}]
set_property PACKAGE_PIN C1 [get_ports {multiplicand[11]}]
set_property PACKAGE_PIN B2 [get_ports {multiplicand[12]}]
set_property PACKAGE_PIN B1 [get_ports {multiplicand[13]}]
set_property PACKAGE_PIN A2 [get_ports {multiplicand[14]}]
set_property PACKAGE_PIN A1 [get_ports {multiplicand[15]}]

# ========== Multiplier [15:0] ==========
set_property IOSTANDARD LVCMOS33 [get_ports multiplier[*]]
set_input_delay -clock clk 2 [get_ports multiplier[*]]

set_property PACKAGE_PIN T2 [get_ports {multiplier[0]}]
set_property PACKAGE_PIN T1 [get_ports {multiplier[1]}]
set_property PACKAGE_PIN R3 [get_ports {multiplier[2]}]
set_property PACKAGE_PIN R2 [get_ports {multiplier[3]}]
set_property PACKAGE_PIN P3 [get_ports {multiplier[4]}]
set_property PACKAGE_PIN P2 [get_ports {multiplier[5]}]
set_property PACKAGE_PIN N3 [get_ports {multiplier[6]}]
set_property PACKAGE_PIN N2 [get_ports {multiplier[7]}]
set_property PACKAGE_PIN M3 [get_ports {multiplier[8]}]
set_property PACKAGE_PIN M2 [get_ports {multiplier[9]}]
set_property PACKAGE_PIN L3 [get_ports {multiplier[10]}]
set_property PACKAGE_PIN L2 [get_ports {multiplier[11]}]
set_property PACKAGE_PIN K3 [get_ports {multiplier[12]}]
set_property PACKAGE_PIN K2 [get_ports {multiplier[13]}]
set_property PACKAGE_PIN J3 [get_ports {multiplier[14]}]
set_property PACKAGE_PIN J2 [get_ports {multiplier[15]}]

# ================= OUTPUTS =================
# Show only lower 16 bits of result
set_property IOSTANDARD LVCMOS33 [get_ports result[*]]
set_output_delay -clock clk 2 [get_ports result[*]]

set_property PACKAGE_PIN U16 [get_ports {result[0]}]
set_property PACKAGE_PIN E19 [get_ports {result[1]}]
set_property PACKAGE_PIN U19 [get_ports {result[2]}]
set_property PACKAGE_PIN V19 [get_ports {result[3]}]
set_property PACKAGE_PIN W18 [get_ports {result[4]}]
set_property PACKAGE_PIN W19 [get_ports {result[5]}]
set_property PACKAGE_PIN Y18 [get_ports {result[6]}]
set_property PACKAGE_PIN Y19 [get_ports {result[7]}]
set_property PACKAGE_PIN T18 [get_ports {result[8]}]
set_property PACKAGE_PIN T19 [get_ports {result[9]}]
set_property PACKAGE_PIN R18 [get_ports {result[10]}]
set_property PACKAGE_PIN R19 [get_ports {result[11]}]
set_property PACKAGE_PIN P18 [get_ports {result[12]}]
set_property PACKAGE_PIN P19 [get_ports {result[13]}]
set_property PACKAGE_PIN N18 [get_ports {result[14]}]
set_property PACKAGE_PIN N19 [get_ports {result[15]}]

# Output: done signal to LED
set_property PACKAGE_PIN M19 [get_ports done]
set_property IOSTANDARD LVCMOS33 [get_ports done]
set_output_delay -clock clk 2 [get_ports done]
