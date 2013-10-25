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

ENTITY ClockDelay IS
   PORT( 
      clk    : IN     std_logic;
      delayed: OUT    std_logic
   );

-- Declarations

END ClockDelay ;

--
ARCHITECTURE untitled OF ClockDelay IS
BEGIN
  delayed <= clk'delayed(33ns);
END ARCHITECTURE untitled;

