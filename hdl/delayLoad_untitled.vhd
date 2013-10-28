--
-- VHDL Architecture ece411.delayLoad.untitled
--
-- Created:
--          by - li151.ews (siebl-0220-16.ews.illinois.edu)
--          at - 17:46:37 10/28/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY delayLoad IS
   PORT( 
      preLoad : IN     std_logic;
      Load    : OUT    std_logic
   );

-- Declarations

END delayLoad ;

--
ARCHITECTURE untitled OF delayLoad IS
BEGIN
  Load <= preLoad'delayed(45ns);
END ARCHITECTURE untitled;

