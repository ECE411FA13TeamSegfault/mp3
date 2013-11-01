--
-- VHDL Architecture ece411.COMP4.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 04:04:19 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY COMP4 IS
  PORT (
    A     : IN LC3b_opcode;
    BROpcode : OUT std_logic
  );
END ENTITY COMP4;

--
ARCHITECTURE untitled OF COMP4 IS
BEGIN
  PROCESS(A)
  BEGIN
    IF (A = "0000") THEN
      BROpcode <= '1';
    ELSE
      BROpcode <= '0';
    END IF;
  END PROCESS;
END ARCHITECTURE untitled;

