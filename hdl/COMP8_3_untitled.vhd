--
-- VHDL Architecture ece411.COMP8_3.untitled
--
-- Created:
--          by - chao16.ews (siebl-0403-36.ews.illinois.edu)
--          at - 18:43:41 11/22/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY COMP8_3 IS
   PORT( 
      A : IN     LC3B_C_SET;
      B : IN     LC3B_C_SET;
      F : OUT    std_logic
   );

-- Declarations

END COMP8_3 ;

--
ARCHITECTURE untitled OF COMP8_3 IS
BEGIN
  PROCESS (A, B)
  BEGIN
    if (A = B) then
      F <= '1' after DELAY_COMPARE8;
    else
      F <= '0' after DELAY_COMPARE8;
    end if;
  END PROCESS;
END ARCHITECTURE untitled;

