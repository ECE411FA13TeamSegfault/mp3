--
-- VHDL Architecture ece411.AddressSplit.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-28.ews.illinois.edu)
--          at - 11:06:47 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressSplit IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      Index   : OUT    LC3B_C_INDEX;
      Offset  : OUT    LC3B_C_OFFSET;
      Tag     : OUT    LC3B_C_TAG
   );

-- Declarations

END AddressSplit ;

--
ARCHITECTURE untitled OF AddressSplit IS
BEGIN
	Tag <= ADDRESS(15 downto 7);
	Index <= ADDRESS(6 downto 4);
	Offset <= ADDRESS(3 downto 0);
END ARCHITECTURE untitled;

