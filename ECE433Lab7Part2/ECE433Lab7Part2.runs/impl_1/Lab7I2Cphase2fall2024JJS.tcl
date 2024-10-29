# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param chipscope.maxJobs 3
  set_param synth.incrementalSynthesisCache C:/Users/zamoraad/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-22672-RHIT-R912N07F/incrSyn
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a100tcsg324-1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.cache/wt [current_project]
  set_property parent.project_path C:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.xpr [current_project]
  set_property ip_output_repo C:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet C:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.runs/synth_1/Lab7I2Cphase2fall2024JJS.dcp
  read_ip -quiet c:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.srcs/sources_1/ip/Clock80MHz/Clock80MHz.xci
  read_xdc C:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.srcs/constrs_1/new/constr_1.xdc
  link_design -top Lab7I2Cphase2fall2024JJS -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Lab7I2Cphase2fall2024JJS_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file Lab7I2Cphase2fall2024JJS_drc_opted.rpt -pb Lab7I2Cphase2fall2024JJS_drc_opted.pb -rpx Lab7I2Cphase2fall2024JJS_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force Lab7I2Cphase2fall2024JJS_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file Lab7I2Cphase2fall2024JJS_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file Lab7I2Cphase2fall2024JJS_utilization_placed.rpt -pb Lab7I2Cphase2fall2024JJS_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file Lab7I2Cphase2fall2024JJS_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design 
  write_checkpoint -force Lab7I2Cphase2fall2024JJS_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Lab7I2Cphase2fall2024JJS_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file Lab7I2Cphase2fall2024JJS_drc_routed.rpt -pb Lab7I2Cphase2fall2024JJS_drc_routed.pb -rpx Lab7I2Cphase2fall2024JJS_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file Lab7I2Cphase2fall2024JJS_methodology_drc_routed.rpt -pb Lab7I2Cphase2fall2024JJS_methodology_drc_routed.pb -rpx Lab7I2Cphase2fall2024JJS_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file Lab7I2Cphase2fall2024JJS_power_routed.rpt -pb Lab7I2Cphase2fall2024JJS_power_summary_routed.pb -rpx Lab7I2Cphase2fall2024JJS_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file Lab7I2Cphase2fall2024JJS_route_status.rpt -pb Lab7I2Cphase2fall2024JJS_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file Lab7I2Cphase2fall2024JJS_timing_summary_routed.rpt -pb Lab7I2Cphase2fall2024JJS_timing_summary_routed.pb -rpx Lab7I2Cphase2fall2024JJS_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file Lab7I2Cphase2fall2024JJS_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file Lab7I2Cphase2fall2024JJS_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file Lab7I2Cphase2fall2024JJS_bus_skew_routed.rpt -pb Lab7I2Cphase2fall2024JJS_bus_skew_routed.pb -rpx Lab7I2Cphase2fall2024JJS_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Lab7I2Cphase2fall2024JJS_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  catch { write_mem_info -force Lab7I2Cphase2fall2024JJS.mmi }
  write_bitstream -force Lab7I2Cphase2fall2024JJS.bit 
  catch {write_debug_probes -quiet -force Lab7I2Cphase2fall2024JJS}
  catch {file copy -force Lab7I2Cphase2fall2024JJS.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

