#!/usr/bin/env bash

# Test GHDL itself
ghdl --version

# List the files (validating the fileshare/mount)
ls

# Analyse the source
ghdl -a mux_2to1.vhd

# Analyse the tb
ghdl -a mux_2to1_tb.vhd

# Elaborate the top-level
ghdl -e mux_2to1

# Run the simulation and output to .vcd
ghdl -r mux_2to1_tb --vcd=mux_2to1.vcd

