--
-- VHDL Architecture ece411.TagMux.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 02:19:52 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagMux IS
   PORT( 
      LRUout    : IN     std_logic;
      clk       : IN     std_logic;
      TagOut0   : IN     LC3B_C_TAG;
      TagOut1   : IN     LC3B_C_TAG;
      TagMuxout : OUT    LC3B_C_TAG
   );

-- Declarations

END TagMux ;

--
ARCHITECTURE untitled OF TagMux IS
BEGIN
  PROCESS (TagOut0, TagOut1, LRUOut)
    variable state : LC3B_C_TAG;
  BEGIN
    if (LRUOut = '1') then
      state := TagOut1;
    else
      state := TagOut0;
    end if;
    TagMuxout <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

