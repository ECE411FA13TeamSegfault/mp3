--
-- VHDL Architecture ece411.high.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 17:56:00 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY high IS
   PORT( 
      I_MREAD_L : OUT    STD_LOGIC
   );

-- Declarations

END high ;

--
ARCHITECTURE untitled OF high IS
BEGIN
  I_MREAD_L <= '0';
END ARCHITECTURE untitled;

