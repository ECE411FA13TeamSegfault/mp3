--
-- VHDL Architecture ece411.ClrHByte.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 11:04:30 09/12/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ClrHByte IS
   PORT( 
      RFMuxout : IN     LC3b_word;
      ClrHByteout        : OUT    LC3b_word
   );

-- Declarations

END ClrHByte ;

--
ARCHITECTURE untitled OF ClrHByte IS
BEGIN
	ClrHByteout <= "00000000" & RFMuxout(7 downto 0) after DELAY_MUX2;
END ARCHITECTURE untitled;
