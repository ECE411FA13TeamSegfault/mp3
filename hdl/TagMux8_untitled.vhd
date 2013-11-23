--
-- VHDL Architecture ece411.TagMux8.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 23:51:15 11/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagMux8 IS
   PORT( 
      Sel : IN     LC3B_C_SET;
      x0  : IN     LC3B_C_TAG;
      x1  : IN     LC3B_C_TAG;
      x2  : IN     LC3B_C_TAG;
      x3  : IN     LC3B_C_TAG;
      x4  : IN     LC3B_C_TAG;
      x5  : IN     LC3B_C_TAG;
      x6  : IN     LC3B_C_TAG;
      x7  : IN     LC3B_C_TAG;
      F   : OUT    LC3B_C_TAG
   );

-- Declarations

END TagMux8 ;

--
ARCHITECTURE untitled OF TagMux8 IS
BEGIN
  PROCESS (Sel, x0, x1, x2, x3, x4, x5, x6, x7)
    variable state : LC3B_C_TAG;
  BEGIN
    case Sel is
      when "000" =>
        state := x0;
      when "001" =>
        state := x1;
      when "010" =>
        state := x2;
      when "011" =>
        state := x3;
      when "100" =>
        state := x4;
      when "101" =>
        state := x5;
      when "110" =>
        state := x6;
      when "111" =>
        state := x7;
      when others =>
        state := (OTHERS => 'X');
    end case;
    F <= state after delay_mux8;
  END PROCESS;
END ARCHITECTURE untitled;

