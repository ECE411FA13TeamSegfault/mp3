--
-- VHDL Architecture ece411.MSB.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-18.ews.illinois.edu)
--          at - 07:31:52 12/06/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MSB IS
   PORT( 
      InputOffset : IN     LC3B_WORD;
      OffsetMSB   : OUT    STD_LOGIC
   );

-- Declarations

END MSB ;

--
ARCHITECTURE untitled OF MSB IS
BEGIN
  OffsetMSB <= InputOffset(15);
END ARCHITECTURE untitled;

