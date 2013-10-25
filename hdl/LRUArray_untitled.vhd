--
-- VHDL Architecture ece411.LRUArray.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-33.ews.illinois.edu)
--          at - 22:03:02 09/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUArray IS
   PORT( 
      Index    : IN     LC3B_C_INDEX;
      LRUIn    : IN     std_logic;
      LRUWrite : IN     std_logic;
      RESET_L  : IN     std_logic;
      clk      : IN     std_logic;
      LRUOut   : OUT    std_logic
   );

-- Declarations

END LRUArray ;

--
ARCHITECTURE untitled OF LRUArray IS
  TYPE LRUArray IS array (7 downto 0) of std_logic;
  SIGNAL LRU : LRUArray;
BEGIN
  ---------------------------------------------------------------------
  ReadFromLRUArray: PROCESS (LRU, Index)
  ---------------------------------------------------------------------
  VARIABLE LRUIndex : integer;
  BEGIN
    LRUIndex := to_integer(unsigned(Index));
    LRUOut <= LRU(LRUIndex) after DELAY_256B;
  END PROCESS ReadFromLRUArray;
  ---------------------------------------------------------------------
  WriteToLRUArray: PROCESS (clk, RESET_L, Index, LRUWrite, LRUIn)
  ---------------------------------------------------------------------
  VARIABLE LRUIndex : integer;
  BEGIN
    LRUIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      LRU(0) <= '0';
      LRU(1) <= '0';
      LRU(2) <= '0';
      LRU(3) <= '0';
      LRU(4) <= '0';
      LRU(5) <= '0';
      LRU(6) <= '0';
      LRU(7) <= '0';
    END IF;
    if (clk'event and (clk = '1') and (clk'last_value = '0')) then
      IF (LRUWrite = '1') THEN
        LRU(LRUIndex) <= LRUIn;
      END IF;
    end if;
  END PROCESS WriteToLRUArray;
END ARCHITECTURE untitled;


