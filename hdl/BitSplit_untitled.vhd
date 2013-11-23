--
-- VHDL Architecture ece411.BitSplit.untitled
--
-- Created:
--          by - chao16.ews (siebl-0403-36.ews.illinois.edu)
--          at - 19:25:59 11/22/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BitSplit IS
   PORT( 
      x  : IN     LC3B_BYTE;
      f0 : OUT    std_logic;
      f1 : OUT    std_logic;
      f2 : OUT    std_logic;
      f3 : OUT    std_logic;
      f4 : OUT    std_logic;
      f5 : OUT    std_logic;
      f6 : OUT    std_logic;
      f7 : OUT    std_logic
   );

-- Declarations

END BitSplit ;

--
ARCHITECTURE untitled OF BitSplit IS
BEGIN
  f0 <= x(0);
  f1 <= x(1);
  f2 <= x(2);
  f3 <= x(3);
  f4 <= x(4);
  f5 <= x(5);
  f6 <= x(6);
  f7 <= x(7);
END ARCHITECTURE untitled;

