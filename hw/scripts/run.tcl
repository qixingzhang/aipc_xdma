set device "xcku040-ffva1156-2-i"
set project_folder "vivado_project"
set overlay_name "xdma_ku042"
set design_name "xdma_ku042"

create_project $overlay_name $project_folder -part $device
add_files -fileset sources_1 [glob ./src/*.v]
create_bd_design $design_name
source ./scripts/ku042.tcl
make_wrapper -files [get_files ${project_folder}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ${project_folder}/${overlay_name}.gen/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.v
set_property top ${design_name}_wrapper [current_fileset]
add_files -fileset constrs_1 [glob ./constraints/system.xdc]
update_compile_order -fileset sources_1
launch_runs impl_1
wait_on_run impl_1

open_run impl_1
write_bitstream -force -file ${design_name}.bit
