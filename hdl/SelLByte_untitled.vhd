--
-- VHDL Architecture ece411.SelLByte.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 00:37:19 09/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SelLByte IS
   PORT( 
		A      			: IN     LC3b_word;
		SelLByteout : OUT    LC3b_word
   );

-- Declarations

END SelLByte ;

--
ARCHITECTURE untitled OF SelLByte IS
BEGIN
	SelLByteout <= "00000000" & A(7 downto 0) after delay_mux2;
END ARCHITECTURE untitled;

