--
-- VHDL Architecture ece411.TagArray.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-37.ews.illinois.edu)
--          at - 20:51:26 09/19/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagArray IS
   PORT( 
      Index    : IN     LC3B_C_INDEX;
      RESET_L  : IN     std_logic;
      TagIn    : IN     LC3B_C_TAG;
      TagWrite : IN     std_logic;
      clk      : IN     std_logic;
      TagOut   : OUT    LC3B_C_TAG
   );

-- Declarations

END TagArray ;

--
ARCHITECTURE untitled OF TagArray IS
  TYPE TagArray IS array (7 downto 0) of LC3B_C_TAG;
  SIGNAL Tag : TagArray;
BEGIN
  ------------------------------------------------------------------
  ReadFromTagArray: PROCESS (Tag, Index)
  ------------------------------------------------------------------
  VARIABLE TagIndex : integer;
  BEGIN
    TagIndex := to_integer(unsigned(Index));
    TagOut <= Tag(TagIndex) after DELAY_256B;
  END PROCESS ReadFromTagArray;
  ------------------------------------------------------------------
  WriteToTagArray: PROCESS (clk, RESET_L, Index, TagWrite, TagIn)
  ------------------------------------------------------------------
  VARIABLE TagIndex : integer;
  BEGIN
    TagIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Tag(0) <= (OTHERS => 'X');
      Tag(1) <= (OTHERS => 'X');
      Tag(2) <= (OTHERS => 'X');
      Tag(3) <= (OTHERS => 'X');
      Tag(4) <= (OTHERS => 'X');
      Tag(5) <= (OTHERS => 'X');
      Tag(6) <= (OTHERS => 'X');
      Tag(7) <= (OTHERS => 'X');
    END IF;
    if (clk'event and (clk = '1') and (clk'last_value = '0')) then
      IF (TagWrite = '1') THEN
        Tag(TagIndex) <= TagIn;
      END IF;
    end if;
  END PROCESS WriteToTagArray;
END ARCHITECTURE untitled;

