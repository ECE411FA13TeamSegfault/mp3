--
-- VHDL Architecture ece411.PMADDRESSMux.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 02:22:25 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PMADDRESSMux IS
   PORT( 
      PMADDRESS         : OUT    LC3b_word;
      clk               : IN     std_logic;
      ADDRESS           : IN     LC3b_word;
      AddressCombineout : IN     LC3b_word;
      InWriteBack       : IN     std_logic
   );

-- Declarations

END PMADDRESSMux ;

--
ARCHITECTURE untitled OF PMADDRESSMux IS
BEGIN
  PROCESS (InWriteBack, AddressCombineout, ADDRESS)
    variable state : LC3B_WORD;
  BEGIN
    if (InWriteBack = '1') then
      state := AddressCombineout;
    else
      state := ADDRESS;
    end if;
    PMADDRESS <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

