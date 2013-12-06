--
-- VHDL Architecture ece411.Splitter_ID.untitled
--
-- Created:
--          by - schen79.ews (linux-a3.ews.illinois.edu)
--          at - 21:44:08 10/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Splitter_ID IS
	PORT (
		CONTROL			: IN CONTROL_WORD;
		--DRMuxsel			: OUT std_logic;
		StoreMuxsel	: OUT std_logic
	);
		
END ENTITY Splitter_ID;

--
ARCHITECTURE untitled OF Splitter_ID IS
BEGIN
	--DRMuxsel 			<= CONTROL.DRMuxsel;
	StoreMuxsel <= CONTROL.StoreMuxsel;
END ARCHITECTURE untitled;

