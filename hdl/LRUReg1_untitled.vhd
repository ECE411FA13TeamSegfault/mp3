--
-- VHDL Architecture ece411.LRUReg1.untitled
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

ENTITY LRUReg1 IS
   PORT( 
      LRUReg1EN : IN     STD_LOGIC;
      LRUReg0In : OUT    LC3B_C_SET;
      LRUReg1In : IN     LC3B_C_SET;
      RESET_L   : IN     STD_LOGIC;
      CLK       : IN     STD_LOGIC
   );

-- Declarations

END LRUReg1 ;

--
ARCHITECTURE untitled OF LRUReg1 IS
BEGIN
	PROCESS(CLK, RESET_L, LRUReg1In, LRUReg1EN)
	VARIABLE STATE : LC3B_C_SET;
	BEGIN
		IF(RESET_L = '0') THEN
			STATE := "001";  -- DEFAULT VALUE
		ELSIF(CLK = '1' AND CLK'EVENT AND LRUReg1EN = '1') THEN -- HIGH ENABLE
			STATE := LRUReg1In;
		ELSIF(LRUReg1EN /= '0' AND LRUReg1EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
			STATE := "XXX";
		END IF;
		LRUReg0In <= STATE AFTER DELAY_REG;
	END PROCESS;
END ARCHITECTURE untitled;
