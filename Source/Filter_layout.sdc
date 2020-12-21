
set FCLK   5;                  #desired Fclk
set UNCERT 5;                      #desired % from Fclk for clock uncertainty


set INPUTPORTS_CLK  [remove_from_collection [all_inputs]  [get_ports {clk reset}]]; #to exclude from input_delay setting
set OUTPUTPORTS_CLK [all_outputs]


################CLOCK SIGNAL SECTION####################

###CLOCK SIGNAL###
set PERIOD_CLK [expr (1000.0/$FCLK)] ;
set CLOCK_UNCERTAINTY_CLK [expr ($UNCERT/100.0) * $PERIOD_CLK]

### EXTERNAL DELAYS###
set INPUT_DELAY_CLK        [expr $PERIOD_CLK/3.0]; #33% from Tclk
set OUTPUT_DELAY_CLK       [expr $PERIOD_CLK/3.0]; #33% from Tclk


create_clock [get_ports clk] -name clk -period $PERIOD_CLK
set_clock_uncertainty $CLOCK_UNCERTAINTY_CLK [get_clocks {clk}]

set_input_delay  -clock "clk"       -max $INPUT_DELAY_CLK  $INPUTPORTS_CLK
set_output_delay -clock "clk"       -max $OUTPUT_DELAY_CLK $OUTPUTPORTS_CLK


