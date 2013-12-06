--
-- VHDL Architecture ece411.Splitter_Stall_Unit.untitled
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 01:01:30 11/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter_Stall_Unit IS
  PORT (
    CONTROL   : IN CONTROL_WORD;
    RegWrite  : OUT std_logic
  );
END ENTITY Splitter_Stall_Unit;

--
ARCHITECTURE untitled OF Splitter_Stall_Unit IS
BEGIN
  RegWrite <= CONTROL.RegWrite;
END ARCHITECTURE untitled;

