--
-- VHDL Architecture ece411.DelayRegister16.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 01:04:50 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayRegister16 IS
  PORT (
    A :   IN LC3b_word;
    F :   OUT LC3b_word
  );
END ENTITY DelayRegister16;

--
ARCHITECTURE untitled OF DelayRegister16 IS
BEGIN
  ----------------------
  delayreg : PROCESS (A)
  ----------------------
  variable temp : LC3b_word;
  BEGIN
    temp := A;
    
    F <= temp after delay_reg;
  END PROCESS delayreg;
END ARCHITECTURE untitled;

