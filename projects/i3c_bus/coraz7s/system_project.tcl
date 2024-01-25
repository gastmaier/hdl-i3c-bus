###############################################################################
## Copyright (C) 2024 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

source ../../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

# get_env_param retrieves parameter value from the environment if exists,
# other case use the default value.
#
#   How to use over-writable parameters from the environment:
#
#    e.g.
#      make OFFLOAD=1
#
# Parameter description:
#
# OFFLOAD : Enable offload mode, includes AXI_DMAC and AXI_PWM to the design
#       1 - enabled
#       0 - disabled (default)

adi_project i3c_bus_coraz7s 0 [list \
  OFFLOAD [get_env_param OFFLOAD 0]]

adi_project_files i3c_bus_coraz7s [list \
    "$ad_hdl_dir/library/common/ad_iobuf.v" \
    "system_top.v" \
    "system_constr.xdc" \
    "$ad_hdl_dir/projects/common/coraz7s/coraz7s_system_constr.xdc"]

adi_project_run i3c_bus_coraz7s
