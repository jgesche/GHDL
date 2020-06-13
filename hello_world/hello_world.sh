#!/usr/bin/env bash

# Test GHDL itself
ghdl --version

# List the files (validating the fileshare/mount)
ls

# Analyse the source
ghdl -a hello_world.vhd

# Elaborate the top-level
ghdl -e hello_world

# Run the simulation
ghdl -r hello_world
