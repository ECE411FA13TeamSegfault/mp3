--
-- VHDL Architecture ece411.SEXT8.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 11:07:54 09/12/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT8 IS
   PORT( 
      RFMuxout : IN     LC3b_word;
      clk      : IN     std_logic;
      SEXT8out : OUT    LC3b_word
   );

-- Declarations

END SEXT8 ;

--
ARCHITECTURE untitled OF SEXT8 IS
BEGIN
	SEXT8out <= RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7) & RFMuxout(7 downto 0) AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

