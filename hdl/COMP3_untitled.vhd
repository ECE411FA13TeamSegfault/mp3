--
-- VHDL Architecture ece411.COMP3.untitled
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 23:37:36 11/17/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY COMP3 IS
  PORT (
    A   : IN LC3B_REG;
    B   : IN LC3B_REG;
    F   : OUT std_logic
  );
END ENTITY COMP3;

--
ARCHITECTURE untitled OF COMP3 IS
BEGIN
  COMP3: PROCESS (A, B)
	BEGIN 
		IF (A = B) THEN
			F <= '1' AFTER DELAY_COMPARE8;
		ELSE
			F <= '0' AFTER DELAY_COMPARE8;
		END IF;
	END PROCESS COMP3;
END ARCHITECTURE untitled;

