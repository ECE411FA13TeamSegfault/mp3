--
-- VHDL Architecture ece411.TagMux.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-21.ews.illinois.edu)
--          at - 01:16:53 10/31/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagMux2 IS
   PORT( 
      A   : IN     LC3B_C_TAG;
      B   : IN     LC3B_C_TAG;
      Sel : IN     std_logic;
      F   : OUT    LC3B_C_TAG
   );

-- Declarations

END TagMux2 ;

--
ARCHITECTURE untitled OF TagMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3B_C_TAG;
  BEGIN
    if (Sel = '0') then
      state := A;
    else
      state := B;
    end if;
    F <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

