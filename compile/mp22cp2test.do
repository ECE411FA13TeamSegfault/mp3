echo "--- Executing initialization force file for /home/li151/ece411_G18.work/mp22cp2test.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading /home/li151/ece411_G18.work/mp22cp2test.asm program code."
run 5
change /mp2_cpu/dram/pdram/vhdl_memory/mem(0) X"18"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(1) X"62"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(2) X"19"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(3) X"64"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(4) X"1A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(5) X"66"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(6) X"40"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(7) X"68"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(8) X"80"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(9) X"6A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(10) X"40"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(11) X"6C"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(12) X"C0"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(13) X"6E"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(14) X"C0"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(15) X"62"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(16) X"80"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(17) X"68"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(18) X"1A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(19) X"B4"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(20) X"80"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(21) X"6C"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(22) X"18"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(23) X"A6"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(24) X"1A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(25) X"6A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(26) X"1A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(27) X"AA"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(28) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(29) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(30) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(31) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(32) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(33) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(34) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(35) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(36) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(38) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(39) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(40) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(41) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(42) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(43) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(44) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(45) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(46) X"FF"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(47) X"0F"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(48) X"80"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(49) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(50) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(51) X"01"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(52) X"80"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(53) X"01"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(128) X"11"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(129) X"11"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(130) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(131) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(132) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(133) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(134) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(135) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(136) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(137) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(138) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(139) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(140) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(141) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(142) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(143) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(256) X"22"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(257) X"22"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(258) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(259) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(260) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(261) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(262) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(263) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(264) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(265) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(266) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(267) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(268) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(269) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(270) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(271) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(384) X"33"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(385) X"33"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(386) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(387) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(388) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(389) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(390) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(391) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(392) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(393) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(394) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(395) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(396) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(397) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(398) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(399) X"00"
run 5
echo "Done loading /home/li151/ece411_G18.work/mp22cp2test.asm program code."
