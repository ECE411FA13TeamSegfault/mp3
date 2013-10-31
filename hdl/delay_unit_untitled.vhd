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

ENTITY Delay_Unit IS
  PORT (
    clk :   IN std_logic;
    A2 :   OUT std_logic
  );
END ENTITY Delay_Unit;

--
ARCHITECTURE untitled OF Delay_Unit IS
BEGIN
  ----------------------
  delayreg : PROCESS (clk)
  ----------------------
  variable temp : std_logic;
  BEGIN
    temp := clk;
    
    A2 <= temp after 20 ns;
  END PROCESS delayreg;
END ARCHITECTURE untitled;

