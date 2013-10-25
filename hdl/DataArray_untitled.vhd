--
-- VHDL Architecture ece411.DataArray.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-38.ews.illinois.edu)
--          at - 00:52:15 09/19/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      DataIn    : IN     LC3B_OWORD;
      DataWrite : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    LC3B_OWORD;
      clk       : IN     std_logic
   );

-- Declarations

END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS
  TYPE DataArray IS array (7 downto 0) of LC3b_oword;
  SIGNAL Data : DataArray;
BEGIN
  ------------------------------------------------------------------
  ReadFromDataArray: PROCESS (Data, Index)
  ------------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    DataIndex := to_integer(unsigned(Index));
    DataOut <= Data(DataIndex) after DELAY_256B;
  END PROCESS ReadFromDataArray;
  ------------------------------------------------------------------
  WriteToDataArray: PROCESS (clk, RESET_L, Index, DataWrite, DataIn)
  ------------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    DataIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Data(0) <= (OTHERS => 'X');
      Data(1) <= (OTHERS => 'X');
      Data(2) <= (OTHERS => 'X');
      Data(3) <= (OTHERS => 'X');
      Data(4) <= (OTHERS => 'X');
      Data(5) <= (OTHERS => 'X');
      Data(6) <= (OTHERS => 'X');
      Data(7) <= (OTHERS => 'X');
    END IF;
    if (clk'event and (clk = '1') and (clk'last_value = '0')) then
      IF (DataWrite = '1') THEN
        Data(DataIndex) <= DataIn;
      END IF;
    end if;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;

