--
-- VHDL Architecture ece411.ENCODE8_3.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:24:15 11/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ENCODE8_3 IS
   PORT( 
      x0 : IN     std_logic;
      x1 : IN     std_logic;
      x2 : IN     std_logic;
      x3 : IN     std_logic;
      x4 : IN     std_logic;
      x5 : IN     std_logic;
      x6 : IN     std_logic;
      x7 : IN     std_logic;
      F  : OUT    LC3B_C_SET
   );

-- Declarations

END ENCODE8_3 ;

--
ARCHITECTURE untitled OF ENCODE8_3 IS
BEGIN
	ENCODE8_3: PROCESS(x0, x1, x2, x3, x4, x5, x6, x7)
	VARIABLE INPUTS : LC3B_BYTE;
	VARIABLE STATE  : LC3B_C_SET;
	BEGIN
	  INPUTS := x7 & x6 & x5 & x4 & x3 & x2 & x1 & x0;
		CASE INPUTS IS
			WHEN "00000001" => STATE := "000";
			WHEN "00000010" => STATE := "001"; 
			WHEN "00000100" => STATE := "010"; 
			WHEN "00001000" => STATE := "011"; 
			WHEN "00010000" => STATE := "100"; 
			WHEN "00100000" => STATE := "101"; 
			WHEN "01000000" => STATE := "110"; 
			WHEN "10000000" => STATE := "111"; 
			WHEN OTHERS => STATE := (OTHERS => 'X');
		END CASE;
		F <= STATE AFTER DELAY_DECODE3;
	END PROCESS ENCODE8_3;
END ARCHITECTURE untitled;

