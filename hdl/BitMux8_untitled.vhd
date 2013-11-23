--
-- VHDL Architecture ece411.BitMux8.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 23:15:03 11/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BitMux8 IS
   PORT( 
      Sel : IN     LC3B_C_SET;
      x0  : IN     std_logic;
      x1  : IN     std_logic;
      x2  : IN     std_logic;
      x3  : IN     std_logic;
      x4  : IN     std_logic;
      x5  : IN     std_logic;
      x6  : IN     std_logic;
      x7  : IN     std_logic;
      F   : OUT    std_logic
   );

-- Declarations

END BitMux8 ;

--
ARCHITECTURE untitled OF BitMux8 IS
BEGIN
  PROCESS (Sel, x0, x1, x2, x3, x4, x5, x6, x7)
    variable state : std_logic;
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
        state := 'X';
    end case;
    F <= state after delay_mux8;
  END PROCESS;
END ARCHITECTURE untitled;

