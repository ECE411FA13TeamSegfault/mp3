--
-- VHDL Architecture ece411.DEMUX2_1.untitled
--
-- Created:
--          by - chao16.ews (dcl-l520-09.ews.illinois.edu)
--          at - 18:37:17 11/14/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DEMUX2_1 IS
   PORT( 
      F   : IN     std_logic;
      Sel : IN     std_logic;
      A   : OUT    std_logic;
      B   : OUT    std_logic
   );

-- Declarations

END DEMUX2_1 ;

--
ARCHITECTURE untitled OF DEMUX2_1 IS
BEGIN
	DEMUX2_1: PROCESS(F, SEL)
	BEGIN
		CASE SEL IS
		WHEN '0' =>
			A <= F AFTER DELAY_MUX2;
			B <= '0' AFTER DELAY_MUX2;
		WHEN '1' =>
			B <= F AFTER DELAY_MUX2;
			A <= '0' AFTER DELAY_MUX2;
		WHEN OTHERS =>
			A <= '0' AFTER DELAY_MUX2;
			B <= '0' AFTER DELAY_MUX2;
		END CASE;
	END PROCESS DEMUX2_1;
END ARCHITECTURE untitled;

