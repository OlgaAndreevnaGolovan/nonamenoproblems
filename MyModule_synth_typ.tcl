## Setup technology files
include ../Source/filter/X-FAB_typ.tcl
## Setup variables
set DESIGN Filter
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Source/filter/all_model_filt/Filter.v
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Source/filter/all_model_filt/Synthesis/Filter.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental
## Write out area and timing reports
report area > ../Reports/Filter_synth_area_report
report timing > ../Reports/Filter_synth_timing_report
## Write out synthesized Verilog netlist
write_hdl -mapped > ../Source/filter/all_model_filt/Synthesis/Filter_synth.v
## Write out the SDC file we will take into the place n route tool
write_sdc > ../Source/filter/all_model_filt/Synthesis/Filter_out.sdc
gui_show

