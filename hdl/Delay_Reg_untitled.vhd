--
-- VHDL Architecture ece411.Delay_Reg.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 10:18:19 10/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Delay_RegA IS
	PORT (
		INPUT			: IN std_logic;
		OUTPUT			: OUT std_logic
	);
END ENTITY Delay_RegA;

--
ARCHITECTURE untitled OF Delay_RegA IS
BEGIN
	OUTPUT <= INPUT after delay_reg;
END ARCHITECTURE untitled;

