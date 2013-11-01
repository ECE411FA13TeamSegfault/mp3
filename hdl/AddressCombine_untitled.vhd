--
-- VHDL Architecture ece411.AddressCombine.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 02:25:39 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressCombine IS
   PORT( 
      Index             : IN     LC3B_C_INDEX;
      TagMuxout         : IN     LC3B_C_TAG;
      AddressCombineout : OUT    LC3b_word
   );

-- Declarations

END AddressCombine ;

--
ARCHITECTURE untitled OF AddressCombine IS
BEGIN
  AddressCombineout <= TagMuxout & Index & "0000";
END ARCHITECTURE untitled;

