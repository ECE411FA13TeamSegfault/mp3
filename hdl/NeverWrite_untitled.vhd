--
-- VHDL Architecture ece411.NeverWrite.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-09.ews.illinois.edu)
--          at - 16:05:46 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NeverWrite IS
   PORT( 
      I_MWRITEH_L : OUT    std_logic;
      I_MWRITEL_L : OUT    std_logic
   );

-- Declarations

END NeverWrite ;

--
ARCHITECTURE untitled OF NeverWrite IS
BEGIN
  I_MWRITEH_L <= '1';
  I_MWRITEL_L <= '1';
END ARCHITECTURE untitled;

