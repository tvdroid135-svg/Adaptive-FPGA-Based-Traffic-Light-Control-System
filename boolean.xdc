## Clock
create_clock -period 10.000 -name clk [get_ports clk]
set_property PACKAGE_PIN F14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset Button (BTN0)
set_property PACKAGE_PIN J2 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Slide Switches
## Slide Switches
set_property PACKAGE_PIN V2 [get_ports ns_sensor]
set_property IOSTANDARD LVCMOS33 [get_ports ns_sensor]

set_property PACKAGE_PIN U2 [get_ports ew_sensor]
set_property IOSTANDARD LVCMOS33 [get_ports ew_sensor]

# Replace these with the actual SW2 and SW3 pins
set_property PACKAGE_PIN U1 [get_ports ns_emergency]
set_property IOSTANDARD LVCMOS33 [get_ports ns_emergency]

set_property PACKAGE_PIN T2 [get_ports ew_emergency]
set_property IOSTANDARD LVCMOS33 [get_ports ew_emergency]

## North LEDs
set_property PACKAGE_PIN G1 [get_ports {north_light[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {north_light[0]}]

set_property PACKAGE_PIN G2 [get_ports {north_light[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {north_light[1]}]

set_property PACKAGE_PIN F1 [get_ports {north_light[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {north_light[2]}]

## South LEDs
set_property PACKAGE_PIN F2 [get_ports {south_light[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {south_light[0]}]

set_property PACKAGE_PIN E1 [get_ports {south_light[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {south_light[1]}]

set_property PACKAGE_PIN E2 [get_ports {south_light[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {south_light[2]}]

## East LEDs
set_property PACKAGE_PIN E3 [get_ports {east_light[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {east_light[0]}]

set_property PACKAGE_PIN E5 [get_ports {east_light[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {east_light[1]}]

set_property PACKAGE_PIN E6 [get_ports {east_light[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {east_light[2]}]

## West LEDs
set_property PACKAGE_PIN C3 [get_ports {west_light[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {west_light[0]}]

set_property PACKAGE_PIN B2 [get_ports {west_light[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {west_light[1]}]

set_property PACKAGE_PIN A2 [get_ports {west_light[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {west_light[2]}]
