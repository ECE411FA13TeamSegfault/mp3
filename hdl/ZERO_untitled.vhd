--
-- VHDL Architecture ece411.ZERO.untitled
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 00:19:11 11/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZERO IS
  PORT (
    ZEROS : OUT LC3B_WORD
  );
END ENTITY ZERO;

--
ARCHITECTURE untitled OF ZERO IS
BEGIN
  ZEROS <= (OTHERS => '0');
END ARCHITECTURE untitled;

