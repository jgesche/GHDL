
# Test GHDL itself
ghdl --version

# List the files (validating the fileshare/mount)
ls

# Analyse sources
ghdl -a adder.vhd
ghdl -a adder_tb.vhd

# Elaborate the top-level
ghdl -e adder_tb

# Run the simulation
ghdl -r adder_tb
