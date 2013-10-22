--
-- VHDL Architecture ece411.RegMux2.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 01:34:39 09/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegMux2 IS
   PORT( 
      RegA : IN     LC3b_reg;
      RegB : IN     LC3b_reg;
      Sel  : IN     std_logic;
      F    : OUT    LC3b_reg
   );

-- Declarations

END RegMux2 ;

--
ARCHITECTURE untitled OF RegMux2 IS
BEGIN
	PROCESS (RegA, RegB, Sel)
	VARIABLE STATE : LC3B_REG;
	BEGIN
		CASE Sel IS
			WHEN '0' =>
				STATE := RegA;
			WHEN '1' =>
				STATE := RegB;
			WHEN OTHERS =>
				STATE := (OTHERS => 'X');
		END CASE;
	F <= STATE AFTER DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

