--
-- VHDL Architecture ece411.DataMux.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-28.ews.illinois.edu)
--          at - 12:50:43 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataMux IS
   PORT( 
      DataOut0 : IN     LC3B_OWORD;
      DataOut1 : IN     LC3B_OWORD;
      WayData  : OUT    LC3B_OWORD;
      clk      : IN     std_logic;
      Way0Hit  : IN     std_logic
   );

-- Declarations

END DataMux ;

--
ARCHITECTURE untitled OF DataMux IS
BEGIN
  PROCESS (DataOut0, DataOut1, Way0Hit)
    variable state : LC3B_OWORD;
  BEGIN
    if (Way0Hit = '1') then
      state := DataOut0;
    else
      state := DataOut1;
    end if;
    WayData <= state after delay_mux2;
  END PROCESS;
END ARCHITECTURE untitled;

