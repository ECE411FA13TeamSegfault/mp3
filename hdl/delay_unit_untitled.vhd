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

ENTITY delay_unit IS
   PORT( 
      clk : IN     STD_LOGIC;
      A2  : OUT    STD_LOGIC
   );

-- Declarations

END delay_unit ;

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

