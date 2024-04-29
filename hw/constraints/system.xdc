set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]

set_property -dict {PACKAGE_PIN AK11 IOSTANDARD LVCMOS33} [get_ports FPGA_FAN];

#PCIe rstn
set_property PACKAGE_PIN K22 [get_ports pcie_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_rst_n]

set_property PACKAGE_PIN E13 [get_ports user_lnk_up]
set_property IOSTANDARD LVCMOS18 [get_ports user_lnk_up]

# PCI Express reference clock 100MHz
set_property PACKAGE_PIN AB6 [get_ports {pcie_clk_clk_p[0]}]
set_property PACKAGE_PIN AB5 [get_ports {pcie_clk_clk_n[0]}]
create_clock -period 10.000 -name {pcie_clk_clk_p[0]} [get_ports {pcie_clk_clk_n[0]}]

set_property package_pin K22 [get_ports pcie_rst_n]

set_property package_pin AB2 [get_ports pcie_mgt_rxp[0]]
set_property package_pin AB1 [get_ports pcie_mgt_rxn[0]]
set_property package_pin AC4 [get_ports pcie_mgt_txp[0]]
set_property package_pin AC3 [get_ports pcie_mgt_txn[0]]

set_property package_pin AD2 [get_ports pcie_mgt_rxp[1]]
set_property package_pin AD1 [get_ports pcie_mgt_rxn[1]]
set_property package_pin AE4 [get_ports pcie_mgt_txp[1]]
set_property package_pin AE3 [get_ports pcie_mgt_txn[1]]

set_property package_pin AF2 [get_ports pcie_mgt_rxp[2]]
set_property package_pin AF1 [get_ports pcie_mgt_rxn[2]]
set_property package_pin AG4 [get_ports pcie_mgt_txp[2]]
set_property package_pin AG3 [get_ports pcie_mgt_txn[2]]

set_property package_pin AH2 [get_ports pcie_mgt_rxp[3]]
set_property package_pin AH1 [get_ports pcie_mgt_rxn[3]]
set_property package_pin AH6 [get_ports pcie_mgt_txp[3]]
set_property package_pin AH5 [get_ports pcie_mgt_txn[3]]

set_property package_pin AJ4 [get_ports pcie_mgt_rxp[4]]
set_property package_pin AJ3 [get_ports pcie_mgt_rxn[4]]
set_property package_pin AK6 [get_ports pcie_mgt_txp[4]]
set_property package_pin AK5 [get_ports pcie_mgt_txn[4]]

set_property package_pin AK2 [get_ports pcie_mgt_rxp[5]]
set_property package_pin AK1 [get_ports pcie_mgt_rxn[5]]
set_property package_pin AL4 [get_ports pcie_mgt_txp[5]]
set_property package_pin AL3 [get_ports pcie_mgt_txn[5]]

set_property package_pin AM2 [get_ports pcie_mgt_rxp[6]]
set_property package_pin AM1 [get_ports pcie_mgt_rxn[6]]
set_property package_pin AM6 [get_ports pcie_mgt_txp[6]]
set_property package_pin AM5 [get_ports pcie_mgt_txn[6]]

set_property package_pin AP2 [get_ports pcie_mgt_rxp[7]]
set_property package_pin AP1 [get_ports pcie_mgt_rxn[7]]
set_property package_pin AN4 [get_ports pcie_mgt_txp[7]]
set_property package_pin AN3 [get_ports pcie_mgt_txn[7]]

# False path constraints
# ----------------------------------------------------------------------------------------------------------------------

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_synchronizer*inst/i_in_meta_reg}] -quiet

##set_false_path -to [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*_reg}] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]] -quiet
