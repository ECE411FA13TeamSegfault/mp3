--
-- VHDL Architecture ece411.DataByteDemux.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-28.ews.illinois.edu)
--          at - 13:20:26 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordSplit IS
   PORT( 
      clk     : IN     std_logic;
      A       : OUT    LC3B_WORD;
      B       : OUT    LC3B_WORD;
      C       : OUT    LC3B_WORD;
      E       : OUT    LC3B_WORD;
      F       : OUT    LC3B_WORD;
      G       : OUT    LC3B_WORD;
      H       : OUT    LC3B_WORD;
      D       : OUT    LC3B_WORD;
      WayData : IN     LC3B_OWORD
   );

-- Declarations

END WordSplit ;

--
ARCHITECTURE untitled OF WordSplit IS
BEGIN
  A <= WayData(15 downto 0);
  B <= WayData(31 downto 16);
  C <= WayData(47 downto 32);
  D <= WayData(63 downto 48);
	E <= WayData(79 downto 64);
  F <= WayData(95 downto 80);
	G <= WayData(111 downto 96);
  H <= WayData(127 downto 112);
END ARCHITECTURE untitled;

