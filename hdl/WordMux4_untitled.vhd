--
-- VHDL Architecture ece411.WordMux4.untitled
--
-- Created:
--          by - chng2.ews (dcl-l520-19.ews.illinois.edu)
--          at - 16:12:47 09/08/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux4 IS
   PORT( 
      A   : IN     LC3b_word;
      B   : IN     LC3b_word;
      C   : IN     LC3b_word;
      D   : IN     LC3b_word;
      Sel : IN     LC3b_4mux_sel;
      F   : OUT    LC3b_word
   );

-- Declarations

END WordMux4 ;

--
ARCHITECTURE untitled OF WordMux4 IS
BEGIN
  PROCESS (A, B, C, D, SEL)
  VARIABLE STATE : LC3B_WORD;
  BEGIN
    CASE SEL IS
      WHEN "00" =>
        STATE := A;
      WHEN "01" =>
        STATE := B;
      WHEN "10" =>
        STATE := C;
      WHEN "11" =>
        STATE := D;
      WHEN OTHERS =>
        STATE := (OTHERS => 'X');
    END CASE;
  F <= STATE AFTER DELAY_MUX4;
  END PROCESS;
END ARCHITECTURE untitled;