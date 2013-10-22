--
-- VHDL Architecture ece411.ClrLByte.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 22:46:03 09/12/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ClrLByte IS
   PORT( 
   	  RFMuxout : IN	LC3b_word;
      ClrLByteout : OUT	LC3b_word
   );

-- Declarations

END ClrLByte ;

--
ARCHITECTURE untitled OF ClrLByte IS
BEGIN
	ClrLByteout <= "00000000" & RFMuxout(15 downto 8) after delay_mux2;
END ARCHITECTURE untitled;

