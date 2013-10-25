--
-- VHDL Architecture ece411.TagComparator.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-37.ews.illinois.edu)
--          at - 21:40:14 09/19/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagComparator IS
   PORT( 
      TagA  : IN     LC3B_C_TAG;
      TagB  : IN     LC3B_C_TAG;
      Equal : OUT    std_logic
   );

-- Declarations

END TagComparator ;

--
ARCHITECTURE untitled OF TagComparator IS
BEGIN
  PROCESS (TagA, TagB)
  BEGIN
    if (TagA = TagB) then
      Equal <= '1' after DELAY_COMPARE16;
    else
      Equal <= '0' after DELAY_COMPARE16;
    end if;
  END PROCESS;
END ARCHITECTURE untitled;

