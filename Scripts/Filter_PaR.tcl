#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Mon Nov 30 18:51:11 2020                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_qxconf_file NULL
set conf_qxlib_file NULL
set defHierChar /
set distributed_client_message_echo 1
set gpsPrivate::dpgNewAddBufsDBUpdate 1
set gpsPrivate::lsgEnableNewDbApiInRestruct 1
set init_design_settop 0
set init_gnd_net VSS
set init_io_file ../Source/Module_pins
set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v5_0/techLEF/v5_0_2/xt018_xx43_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_HD/v4_0/LEF/v4_0_0/xt018_D_CELLS_HD.lef}
set init_mmmc_file ../Scripts/MMMC.tcl
set init_pwr_net VDD
set init_verilog ../Outputs/Filter_synth.v
set lsgOCPGainMult 1.000000
set pegDefaultResScaleFactor 1.000000
set pegDetailResScaleFactor 1.000000
set timing_library_float_precision_tol 0.000010
set timing_library_load_pin_cap_indices {}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
#Begin Initializing Design
init_design
# Specify Floorplan
floorPlan -site core_hd -r 0.980859865639 0.699997 10.0 10.0 10.0 10.0
#Defining Power Global Nets
globalNetConnect VDD -type pgpin -pin vdd -inst * -module {}
globalNetConnect VDD -type tiehi -pin * -inst * -module {}
globalNetConnect VSS -type pgpin -pin gnd -inst * -module {}
globalNetConnect VSS -type tielo -pin * -inst * -module {}
#Create power and ground rings 
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -type core_rings -jog_distance 3.15 -threshold 3.15 -nets {VSS VDD} -follow core -stacked_via_bottom_layer MET1 -layer {bottom MET1 top MET1 right MET2 left MET2} -width 3 -spacing {bottom 0.23 top 0.23 right 0.28 left 0.28} -offset 3.15
# Create power grid
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit MET1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -padcore_ring_top_layer_limit MET3 -spacing 0.28 -merge_stripes_value 3.15 -layer MET2 -block_ring_bottom_layer_limit MET1 -width 3 -nets {VSS VDD} -stacked_via_bottom_layer MET1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 METTPL } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 METTPL } -nets { VSS VDD } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 METTPL }
#Create PrePlace setup Timing Report
timeDesign -prePlace -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix Filter_prePlace -outDir ../Reports
# Place Standard Cells
setPlaceMode -fp false
placeDesign -inPlaceOpt
#Create PreCTS setup Timing Report
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix Filter_preCTS -outDir ../Reports
#Create PreCTS hold Timing Report
timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix Filter_preCTS -outDir ../Reports
#PreCTS Optimization
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
#Clock Tree Synthesis
createClockTreeSpec -bufferList {BUHDX0 BUHDX1 BUHDX12 BUHDX2 BUHDX3 BUHDX4 BUHDX6 BUHDX8} -file Clock.ctstch
setCTSMode -engine ck
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
#Create PostCTS setup Timing Report
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix Filter_postCTS -outDir ../Reports
#Create PostCTS hold Timing Report
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix Filter_postCTS -outDir ../Reports
#PostCTS Optimization
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
optDesign -postCTS -hold
setOptMode -fixCap false -fixTran false -fixFanoutLoad false
optDesign -postCTS -incr
optDesign -postCTS -hold -incr
#Rooting
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl
#PostRoute Optimization
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute -hold
setOptMode -fixCap false -fixTran false -fixFanoutLoad false
optDesign -postRoute -incr
optDesign -postRoute -hold -incr
#Create PostRoute setup Timing Report
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix Elliptic_postRoute -outDir ../Reports
#Create PostRoute hold Timing Report
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix Elliptic_postRoute -outDir ../Reports
#SignOff
getFillerMode -quiet
addFiller -cell FEED7HD FEED5HD FEED3HD FEED2HD FEED25HD FEED1HD FEED15HD FEED10HD DECAP7HD DECAP5HD DECAP3HD DECAP25HD DECAP15HD DECAP10HD -prefix FILLER
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
#Create SignOff setup Timing Report
timeDesign -signoff -pathReports -drvReports -slackReports -numPaths 50 -prefix Elliptic_signOff -outDir ../Reports
#Create SignOff hold Timing Report
timeDesign -signoff -hold -pathReports -slackReports -numPaths 50 -prefix Elliptic_signOff -outDir ../Reports
#Verifications
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verify_drc -report Filter.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -reportfile Elliptic.antenna.rpt -error 1000
verifyACLimit -report Elliptic.aclimit.rpt -ruleFile Elliptic.aclimit.rul -toggle 1.0 -error 1000 -scaleIrms 1.0
verifyBusGuide -busMargin 0.0 -report Elliptic.busguide.rpt
verifyEndCap
setMetalFill -layer MET1 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer MET2 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer MET3 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer MET4 -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer METTP -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer METTPL -windowSize 200.000 200.000 -windowStep 100.000 100.000 -minDensity 20.000 -maxDensity 80.000
verifyMetalDensity -report Elliptic.density.rpt
setViaFill -layer VIA1 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer VIA2 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer VIA3 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer VIATP -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer VIATPL -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
verifyCutDensity
verifyPowerVia
all_hold_analysis_views 
all_setup_analysis_views 
#write outputs files
write_sdf ../Outputs/Filter.sdf
saveNetlist ../Outputs/Filter_netlist.v
getFillerMode -quiet
saveNetlist ../Outputs/Filter_physical_netlist.v -includePhysicalCell {FEED7HD FEED5HD FEED3HD FEED2HD FEED25HD FEED1HD FEED15HD FEED10HD DECAP7HD DECAP5HD DECAP3HD DECAP25HD DECAP15HD DECAP10HD}
defOut -floorplan -netlist -routing ../Outputs/Filter.def
saveDesign Filter.enc

