transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/denjo/mygit/experiment/cpu/cpu/src {/home/denjo/mygit/experiment/cpu/cpu/src/adder.v}
vlog -vlog01compat -work work +incdir+/home/denjo/mygit/experiment/cpu/cpu/src {/home/denjo/mygit/experiment/cpu/cpu/src/phase_gen.v}
vlog -vlog01compat -work work +incdir+/home/denjo/mygit/experiment/cpu/cpu/src {/home/denjo/mygit/experiment/cpu/cpu/src/register_file.v}
vlog -vlog01compat -work work +incdir+/home/denjo/mygit/experiment/cpu/cpu/src {/home/denjo/mygit/experiment/cpu/cpu/src/top_module.v}

vlog -vlog01compat -work work +incdir+/home/denjo/mygit/experiment/cpu/cpu/src {/home/denjo/mygit/experiment/cpu/cpu/src/dp_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone_ver -L rtl_work -L work -voptargs="+acc" dp_testbench

add wave *
view structure
view signals
run -all
