--
-- VHDL Architecture ece411.R7.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 01:33:52 09/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY R7 IS
   PORT( 
      R7_sig : out LC3b_reg
   );

-- Declarations

END R7 ;

--
ARCHITECTURE untitled OF R7 IS
BEGIN
	R7_sig <= "111";
END ARCHITECTURE untitled;

