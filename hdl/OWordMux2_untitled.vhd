--
-- VHDL Architecture ece411.OWordMux2.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-35.ews.illinois.edu)
--          at - 22:33:04 10/30/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordMux2 IS
   PORT( 
      A   : IN     LC3B_OWORD;
      B   : IN     LC3B_OWORD;
      Sel : IN     std_logic;
      F   : OUT    LC3B_OWORD
   );

-- Declarations

END OWordMux2 ;

--
ARCHITECTURE untitled OF OWordMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : lc3b_oword;
  BEGIN
    if (Sel = '0') then
      state := A;
    else
      state := B;
    end if;
    F <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

