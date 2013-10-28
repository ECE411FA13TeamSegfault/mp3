--
-- VHDL Architecture ece411.loadSig.untitled
--
-- Created:
--          by - li151.ews (siebl-0220-16.ews.illinois.edu)
--          at - 17:02:32 10/28/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY loadSig IS
   PORT( 
      clk     : IN     std_logic;
      preLoad : OUT    std_logic
   );

-- Declarations

END loadSig ;

--
ARCHITECTURE untitled OF loadSig IS
BEGIN
  preLoad <= ((clk) AND NOT(clk'delayed(15ns)));
END ARCHITECTURE untitled;

