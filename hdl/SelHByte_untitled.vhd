--
-- VHDL Architecture ece411.SelHByte.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 00:36:33 09/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SelHByte IS
   PORT( 
		A: IN     LC3b_word;
		SelHByteout : OUT    LC3b_word
   );

-- Declarations

END SelHByte ;

--
ARCHITECTURE untitled OF SelHByte IS
BEGIN
	SelHByteout <= A(7 downto 0) & "00000000" after delay_mux2;
END ARCHITECTURE untitled;

