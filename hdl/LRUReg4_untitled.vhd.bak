--
-- VHDL Architecture ece411.LRUReg4.untitled
--
-- Created:
--          by - chao16.ews (siebl-0403-36.ews.illinois.edu)
--          at - 17:29:22 11/22/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUReg4 IS
   PORT( 
      LRUReg4EN : IN     STD_LOGIC;
      LRUReg3In : OUT    LC3B_C_SET;
      LRUReg4In : IN     LC3B_C_SET;
      RESET_L   : IN     STD_LOGIC;
      CLK       : IN     STD_LOGIC
   );

-- Declarations

END LRUReg4 ;

--
ARCHITECTURE untitled OF LRUReg4 IS
BEGIN
	PROCESS(CLK, RESET_L, LRUReg4In, LRUReg4EN)
	VARIABLE STATE : LC3B_C_SET;
	BEGIN
		IF(RESET_L = '0') THEN
			STATE := "100";  -- DEFAULT VALUE
		ELSIF(CLK = '1' AND CLK'EVENT AND LRUReg4EN = '1') THEN -- HIGH ENABLE
			STATE := LRUReg4In;
		ELSIF(LRUReg4EN /= '0' AND LRUReg4EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
			STATE := "XXX";
		END IF;
		LRUReg3In <= STATE AFTER DELAY_REG;
	END PROCESS;
END ARCHITECTURE untitled;

