echo "--- Executing initialization force file for ../testcode/mp22.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp22.asm program code."
run 5
change mp2_cpu/dram/pdram/vhdl_memory/mem(0) X"1A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(1) X"AC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(2) X"1C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(3) X"2A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(4) X"19"
change mp2_cpu/dram/pdram/vhdl_memory/mem(5) X"68"
change mp2_cpu/dram/pdram/vhdl_memory/mem(6) X"1A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(7) X"B8"
change mp2_cpu/dram/pdram/vhdl_memory/mem(8) X"1C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(9) X"7C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(10) X"1E"
change mp2_cpu/dram/pdram/vhdl_memory/mem(11) X"3A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(12) X"1B"
change mp2_cpu/dram/pdram/vhdl_memory/mem(13) X"62"
change mp2_cpu/dram/pdram/vhdl_memory/mem(14) X"1C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(15) X"64"
change mp2_cpu/dram/pdram/vhdl_memory/mem(16) X"0F"
change mp2_cpu/dram/pdram/vhdl_memory/mem(17) X"66"
change mp2_cpu/dram/pdram/vhdl_memory/mem(18) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(19) X"76"
change mp2_cpu/dram/pdram/vhdl_memory/mem(20) X"13"
change mp2_cpu/dram/pdram/vhdl_memory/mem(21) X"B6"
change mp2_cpu/dram/pdram/vhdl_memory/mem(22) X"14"
change mp2_cpu/dram/pdram/vhdl_memory/mem(23) X"B4"
change mp2_cpu/dram/pdram/vhdl_memory/mem(24) X"15"
change mp2_cpu/dram/pdram/vhdl_memory/mem(25) X"B2"
change mp2_cpu/dram/pdram/vhdl_memory/mem(26) X"1C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(27) X"32"
change mp2_cpu/dram/pdram/vhdl_memory/mem(28) X"55"
change mp2_cpu/dram/pdram/vhdl_memory/mem(29) X"55"
change mp2_cpu/dram/pdram/vhdl_memory/mem(32) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(33) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(34) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(35) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(36) X"48"
change mp2_cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(38) X"5C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(39) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(40) X"6C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(41) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(42) X"7A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(43) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(44) X"86"
change mp2_cpu/dram/pdram/vhdl_memory/mem(45) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(46) X"06"
change mp2_cpu/dram/pdram/vhdl_memory/mem(47) X"01"
change mp2_cpu/dram/pdram/vhdl_memory/mem(48) X"86"
change mp2_cpu/dram/pdram/vhdl_memory/mem(49) X"01"
change mp2_cpu/dram/pdram/vhdl_memory/mem(50) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(51) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(52) X"36"
change mp2_cpu/dram/pdram/vhdl_memory/mem(53) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(54) X"66"
change mp2_cpu/dram/pdram/vhdl_memory/mem(55) X"66"
change mp2_cpu/dram/pdram/vhdl_memory/mem(58) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(59) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(60) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(61) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(62) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(63) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(64) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(65) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(66) X"FF"
change mp2_cpu/dram/pdram/vhdl_memory/mem(67) X"FF"
change mp2_cpu/dram/pdram/vhdl_memory/mem(68) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(69) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(70) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(71) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(72) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(73) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(74) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(75) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(76) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(77) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(78) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(79) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(80) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(81) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(82) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(83) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(84) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(85) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(86) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(87) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(88) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(89) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(90) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(91) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(92) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(93) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(94) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(95) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(96) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(97) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(98) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(99) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(100) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(101) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(102) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(103) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(104) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(105) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(106) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(107) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(108) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(109) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(110) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(111) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(112) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(113) X"AA"
change mp2_cpu/dram/pdram/vhdl_memory/mem(114) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(115) X"BB"
change mp2_cpu/dram/pdram/vhdl_memory/mem(116) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(117) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(118) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(119) X"DD"
change mp2_cpu/dram/pdram/vhdl_memory/mem(120) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(121) X"EE"
change mp2_cpu/dram/pdram/vhdl_memory/mem(122) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(123) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(124) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(125) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(126) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(127) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(128) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(129) X"44"
change mp2_cpu/dram/pdram/vhdl_memory/mem(134) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(135) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(136) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(137) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(138) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(139) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(140) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(141) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(142) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(143) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(144) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(145) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(146) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(147) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(148) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(149) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(262) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(263) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(264) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(265) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(266) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(267) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(268) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(269) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(270) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(271) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(272) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(273) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(274) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(275) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(276) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(277) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(390) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(391) X"33"
change mp2_cpu/dram/pdram/vhdl_memory/mem(392) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(393) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(394) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(395) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(396) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(397) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(398) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(399) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(400) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(401) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(402) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(403) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(404) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(405) X"00"
run 5
echo "Done loading ../testcode/mp22.asm program code."
