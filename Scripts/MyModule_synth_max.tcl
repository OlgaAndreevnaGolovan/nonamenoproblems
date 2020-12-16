## Setup technology files
include ../Scripts/X-FAB_max.tcl
## Setup variables
set DESIGN Filter
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Source/Filter.v
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Source/Filter_synth.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental
## Write out area and timing reports
report area > ../Reports/Filter_synth_area_report_max
report timing > ../Reports/Filter_synth_timing_report_max
## Write out synthesized Verilog netlist
write_hdl -mapped > ../Outputs/Synthesis/Filter_synth_max.v
## Write out the SDC file we will take into the place n route tool
write_sdc > ../Outputs/Synthesis/Filter_out_max.sdc
gui_show


