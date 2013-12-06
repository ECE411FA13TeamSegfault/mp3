--
-- VHDL Architecture ece411.ClockDelay.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 03:30:35 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ClockDelay2 IS
   PORT( 
      clk     : IN     std_logic;
      F : OUT    std_logic
   );

-- Declarations

END ClockDelay2 ;

--
ARCHITECTURE untitled OF ClockDelay2 IS
BEGIN
  F <= clk'delayed(42ns);
END ARCHITECTURE untitled;
