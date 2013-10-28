--
-- VHDL Architecture ece411.checkBR.untitled
--
-- Created:
--          by - li151.ews (siebl-0220-16.ews.illinois.edu)
--          at - 14:14:07 10/28/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY checkBR IS
   PORT( 
      CheckN : IN     std_logic;
      CheckP : IN     std_logic;
      CheckZ : IN     std_logic;
      n      : IN     std_logic;
      p      : IN     std_logic;
      z      : IN     std_logic;
      takeBr : OUT    std_logic
   );

-- Declarations

END checkBR ;

--
ARCHITECTURE untitled OF checkBR IS
BEGIN
  takeBR <= ((n AND CheckN) OR (p AND CheckP) OR (z AND CheckZ)) 
      after (DELAY_LOGIC2 + DELAY_LOGIC3);
END ARCHITECTURE untitled;

