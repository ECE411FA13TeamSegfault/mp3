--
-- VHDL Architecture ece411.LRUReg2.untitled
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

ENTITY LRUReg2 IS
   PORT( 
      LRUReg2EN : IN     STD_LOGIC;
      LRUReg1In : OUT    LC3B_C_SET;
      LRUReg2In : IN     LC3B_C_SET;
      RESET_L   : IN     STD_LOGIC;
      CLK       : IN     STD_LOGIC
   );

-- Declarations

END LRUReg2 ;

--
ARCHITECTURE untitled OF LRUReg2 IS
BEGIN
	PROCESS(CLK, RESET_L, LRUReg2In, LRUReg2EN)
	VARIABLE STATE : LC3B_C_SET;
	BEGIN
		IF(RESET_L = '0') THEN
			STATE := "010";  -- DEFAULT VALUE
		ELSIF(CLK = '1' AND CLK'EVENT AND LRUReg2EN = '1') THEN -- HIGH ENABLE
			STATE := LRUReg2In;
		ELSIF(LRUReg2EN /= '0' AND LRUReg2EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
			STATE := "XXX";
		END IF;
		LRUReg1In <= STATE AFTER DELAY_REG;
	END PROCESS;
END ARCHITECTURE untitled;

