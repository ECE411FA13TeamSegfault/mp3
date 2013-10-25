--
-- VHDL Architecture ece411.DataInMux.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 06:02:31 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataInMux IS
   PORT( 
      PMDATAIN      : IN     LC3B_OWORD;
      clk           : IN     std_logic;
      DataInMuxout  : OUT    LC3B_OWORD;
      InLoad        : IN     std_logic;
      CacheWriteout : IN     LC3B_OWORD
   );

-- Declarations

END DataInMux ;

--
ARCHITECTURE untitled OF DataInMux IS
BEGIN
  PROCESS (InLoad, CacheWriteout, PMDATAIN)
    variable state : LC3B_OWORD;
  BEGIN
    if (InLoad = '1') then
      state := PMDATAIN;
    else
      state := CacheWriteout;
    end if;
    DataInMuxout <= state after delay_mux2;
  end process;
END ARCHITECTURE untitled;

