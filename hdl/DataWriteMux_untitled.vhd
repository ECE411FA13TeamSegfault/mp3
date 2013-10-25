--
-- VHDL Architecture ece411.DataWriteMux.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-09.ews.illinois.edu)
--          at - 00:30:00 10/04/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataWriteMux IS
   PORT( 
      clk             : IN     std_logic;
      DataOut1        : IN     LC3B_OWORD;
      LRUout          : IN     std_logic;
      DataWriteMuxout : OUT    LC3B_OWORD;
      DataOut0        : IN     LC3B_OWORD
   );

-- Declarations

END DataWriteMux ;

--
ARCHITECTURE untitled OF DataWriteMux IS
BEGIN
  PROCESS (DataOut0, DataOut1, LRUOut)
    variable state : LC3B_OWORD;
  BEGIN
    if (LRUOut = '1') then
      state := DataOut1;
    else
      state := DataOut0;
    end if;
    DataWriteMuxout <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

