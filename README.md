To compile the file and run the simulation , use the following commands ( can be referred from the bsc_usr_guide )
1. bsc -sim -u -g mkTb mac_8bit.bsv
2. bsc -sim -keep-fires -e mkTb -o Tb

To use build.sh, use the following command

source build.sh file_name.bsv mk_module_name sim_executable_name


Important components in bluespec : 

Modules
Intefaces
functions
package

Rules
Methods - can be seen as specialized rules
State elements - Reg, Fifo etc.
 
