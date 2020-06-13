#!/usr/bin/env bash
# Test GHDL itself
ghdl --version

# List the files (validating the fileshare/mount)
ls

# Analyse the source
ghdl -a vga_sync.vhd


ghdl -a tb_vga_sync.vhd
# Elaborate the top-level
ghdl -e vga_sync

# Run the simulation
ghdl -r tb_vga_sync --vcd=tb_vga_sync.vcd --stop-time=20ms
