--
-- VHDL Architecture ece411.WordArray.untitled
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

ENTITY WordArray IS
   PORT( 
      Input     : IN     LC3B_WORD;
      WriteEN   : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      RESET_L   : IN     std_logic;
      Output    : OUT    LC3B_WORD;
      clk       : IN     std_logic
   );

-- Declarations

END WordArray ;

--
ARCHITECTURE untitled OF WordArray IS
  TYPE WordArray IS array (7 downto 0) of LC3b_word;
  SIGNAL Word : WordArray;
BEGIN
  ------------------------------------------------------------------
  ReadFromWordArray: PROCESS (Word, Index)
  ------------------------------------------------------------------
  VARIABLE WordIndex : integer;
  BEGIN
    WordIndex := to_integer(unsigned(Index));
    Output <= Word(WordIndex) after DELAY_256B;
  END PROCESS ReadFromWordArray;
  ------------------------------------------------------------------
  WriteToWordArray: PROCESS (clk, RESET_L, Index, WriteEN, Input)
  ------------------------------------------------------------------
  VARIABLE WordIndex : integer;
  BEGIN
    WordIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Word(0) <= (OTHERS => 'X');
      Word(1) <= (OTHERS => 'X');
      Word(2) <= (OTHERS => 'X');
      Word(3) <= (OTHERS => 'X');
      Word(4) <= (OTHERS => 'X');
      Word(5) <= (OTHERS => 'X');
      Word(6) <= (OTHERS => 'X');
      Word(7) <= (OTHERS => 'X');
    END IF;
    if (clk'event and (clk = '1') and (clk'last_value = '0')) then
      IF (WriteEN = '1') THEN
        Word(WordIndex) <= Input;
      END IF;
    end if;
  END PROCESS WriteToWordArray;
END ARCHITECTURE untitled;

