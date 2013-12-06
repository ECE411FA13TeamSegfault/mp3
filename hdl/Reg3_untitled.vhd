--
-- VHDL Architecture ece411.Reg3.untitled
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 23:28:00 11/17/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg3 IS
  PORT (
    clk     : IN std_logic;
    RESET   : IN std_logic;
    Input   : IN LC3B_REG;
    Load    : IN std_logic;
    Output  : OUT LC3B_REG
  );
END ENTITY Reg3;

--
ARCHITECTURE untitled OF Reg3 IS
SIGNAL PRE_OUT : LC3B_REG;
BEGIN
 	PROCESS (CLK, RESET, INPUT)
	BEGIN
		IF RESET = '0' THEN
			PRE_OUT <= (OTHERS => '0');
		ELSIF CLK'EVENT AND CLK = '1' THEN
			IF (LOAD = '1') THEN
				PRE_OUT <= INPUT;
			END IF;
		END IF;
	END PROCESS;
	OUTPUT <= PRE_OUT AFTER DELAY_REG;
END ARCHITECTURE untitled;

