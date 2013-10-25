--
-- VHDL Architecture ece411.ByteMux2.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 10:44:11 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMux2 IS
   PORT( 
      A   : IN     LC3b_byte;
      B   : IN     LC3b_byte;
      Sel : IN     std_logic;
      F   : OUT    LC3b_byte
   );

-- Declarations

END ByteMux2 ;

--
ARCHITECTURE untitled OF ByteMux2 IS
BEGIN
PROCESS (A, B, SEL)
  VARIABLE STATE : LC3B_byte;
    BEGIN
       CASE SEL IS
          WHEN '0' =>
            STATE := A;
          WHEN '1' =>
            STATE := B;
          WHEN OTHERS =>
            STATE := (OTHERS => 'X');
       END CASE;
       F <= STATE AFTER DELAY_MUX2;
    END PROCESS;
END ARCHITECTURE untitled;