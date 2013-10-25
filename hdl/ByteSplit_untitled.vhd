--
-- VHDL Architecture ece411.ByteSplit.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 05:08:46 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteSplit IS
   PORT( 
      A : IN     LC3b_word;
      H : OUT    LC3b_byte;
      L : OUT    LC3b_byte
   );

-- Declarations

END ByteSplit ;

--
ARCHITECTURE untitled OF ByteSplit IS
BEGIN
  H <= A(15 downto 8);
  L <= A(7 downto 0);
END ARCHITECTURE untitled;

