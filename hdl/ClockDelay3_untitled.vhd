--
-- VHDL Architecture ece411.ClockDelay3.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-18.ews.illinois.edu)
--          at - 01:53:54 12/06/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ClockDelay3 IS
   PORT( 
      A : IN     std_logic;
      F : OUT    std_logic
   );

-- Declarations

END ClockDelay3 ;

--
ARCHITECTURE untitled OF ClockDelay3 IS
BEGIN
  F <= A'delayed(26ns);
END ARCHITECTURE untitled;

