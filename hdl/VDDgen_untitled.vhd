--
-- VHDL Architecture ece411.VDDgen.untitled
--
-- Created:
--          by - chao16.ews (dcl-l520-09.ews.illinois.edu)
--          at - 17:50:36 11/14/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY VDDgen IS
   PORT( 
      F : OUT    std_logic
   );

-- Declarations

END VDDgen ;

--
ARCHITECTURE untitled OF VDDgen IS
BEGIN
  F <= '1';
END ARCHITECTURE untitled;

