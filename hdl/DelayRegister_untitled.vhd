--
-- VHDL Architecture ece411.DelayRegister.untitled
--
-- Created:
--          by - chng2.ews (linux-a1.ews.illinois.edu)
--          at - 00:00:54 10/31/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayRegister IS
  PORT (
    A :   IN std_logic;
    F :   OUT std_logic
  );
END ENTITY DelayRegister;

--
ARCHITECTURE untitled OF DelayRegister IS
BEGIN
  ----------------------
  delayreg : PROCESS (A)
  ----------------------
  variable temp : std_logic;
  BEGIN
    temp := A;
    
    F <= temp after delay_reg;
  END PROCESS delayreg;
END ARCHITECTURE untitled;

