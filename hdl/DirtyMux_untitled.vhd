--
-- VHDL Architecture ece411.DirtyMux.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-29.ews.illinois.edu)
--          at - 21:03:37 09/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyMux IS
   PORT( 
      clk       : IN     std_logic;
      LRUout    : IN     std_logic;
      DirtyOut0 : IN     std_logic;
      DirtyOut1 : IN     std_logic;
      Dirty     : OUT    std_logic
   );

-- Declarations

END DirtyMux ;

--
ARCHITECTURE untitled OF DirtyMux IS
BEGIN
  PROCESS (DirtyOut0, DirtyOut1, LRUOut)
    variable state : std_logic;
  BEGIN
    if (LRUOut = '1') then
      state := DirtyOut1;
    else
      state := DirtyOut0;
    end if;
    Dirty <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

