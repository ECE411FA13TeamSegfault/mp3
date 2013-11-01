--
-- VHDL Architecture ece411.BRadd.untitled
--
-- Created:
--          by - schen79.ews (gelib-057-32.ews.illinois.edu)
--          at - 14:54:27 08/30/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRAdd IS
   PORT( 
		A 			: IN     LC3b_word;
		B 			: IN     LC3b_word;
		BRAddout 			: OUT    LC3b_word
   );

-- Declarations

END BRadd ;

--
ARCHITECTURE untitled OF BRAdd IS
BEGIN
          BRaddout <= LC3b_word(SIGNED(A) + SIGNED(B));
END ARCHITECTURE untitled;

