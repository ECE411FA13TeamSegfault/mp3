--
-- VHDL Architecture ece411.ValidArray.untitled
--
-- Created:
--          by - chao16.ews (gelib-057-37.ews.illinois.edu)
--          at - 21:02:56 09/19/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ValidArray IS
   PORT( 
      Index      : IN     LC3B_C_INDEX;
      RESET_L    : IN     std_logic;
      ValidIn    : IN     std_logic;
      ValidWrite : IN     std_logic;
      clk        : IN     std_logic;
      ValidOut   : OUT    std_logic
   );

-- Declarations

END ValidArray ;

--
ARCHITECTURE untitled OF ValidArray IS
  TYPE ValidArray IS array (7 downto 0) of std_logic;
  SIGNAL Valid : ValidArray;
BEGIN
  ---------------------------------------------------------------------
  ReadFromValidArray: PROCESS (Valid, Index)
  ---------------------------------------------------------------------
  VARIABLE ValidIndex : integer;
  BEGIN
    ValidIndex := to_integer(unsigned(Index));
    ValidOut <= Valid(ValidIndex) after DELAY_256B;
  END PROCESS ReadFromValidArray;
  ---------------------------------------------------------------------
  WriteToValidArray: PROCESS (clk, RESET_L, Index, ValidWrite, ValidIn)
  ---------------------------------------------------------------------
  VARIABLE ValidIndex : integer;
  BEGIN
    ValidIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Valid(0) <= '0';
      Valid(1) <= '0';
      Valid(2) <= '0';
      Valid(3) <= '0';
      Valid(4) <= '0';
      Valid(5) <= '0';
      Valid(6) <= '0';
      Valid(7) <= '0';
    END IF;
    if (clk'event and (clk = '1') and (clk'last_value = '0')) then
      IF (ValidWrite = '1') THEN
        Valid(ValidIndex) <= ValidIn;
      END IF;
    end if;
  END PROCESS WriteToValidArray;
END ARCHITECTURE untitled;

