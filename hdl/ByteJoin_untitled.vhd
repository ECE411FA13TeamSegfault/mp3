--
-- VHDL Architecture ece411.ByteJoin.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 05:12:18 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteJoin IS
   PORT( 
      H    : IN     LC3B_BYTE;
      L    : IN     LC3B_BYTE;
      Word : OUT    LC3B_WORD
   );

-- Declarations

END ByteJoin ;

--
ARCHITECTURE untitled OF ByteJoin IS
BEGIN
  Word <= H & L;
END ARCHITECTURE untitled;

