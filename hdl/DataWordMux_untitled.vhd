--
-- VHDL Architecture ece411.DataWordMux.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-28.ews.illinois.edu)
--          at - 13:45:09 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataWordMux IS
   PORT( 
      F      : IN     LC3B_WORD;
      G      : IN     LC3B_WORD;
      H      : IN     LC3B_WORD;
      E      : IN     LC3B_WORD;
      D      : IN     LC3B_WORD;
      C      : IN     LC3B_WORD;
      B      : IN     LC3B_WORD;
      A      : IN     LC3B_WORD;
      Offset : IN     LC3B_C_OFFSET;
      DATAIN : OUT    LC3B_WORD
   );

-- Declarations

END DataWordMux ;

--
ARCHITECTURE untitled OF DataWordMux IS
BEGIN
  PROCESS (Offset, A, B, C, D, E, F, G, H)
    variable state : LC3B_WORD;
    variable sel : std_logic_vector(2 downto 0);
  BEGIN
    sel := Offset(3) & Offset(2) & Offset(1);
    case sel is
      when "000" =>
        state := A;
      when "001" =>
        state := B;
      when "010" =>
        state := C;
      when "011" =>
        state := D;
      when "100" =>
        state := E;
      when "101" =>
        state := F;
      when "110" =>
        state := G;
      when "111" =>
        state := H;
      when others =>
        state := (OTHERS => 'X');
    end case;
    DATAIN <= state after delay_mux8;
  END PROCESS;
END ARCHITECTURE untitled;

