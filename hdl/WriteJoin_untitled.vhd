--
-- VHDL Architecture ece411.WriteJoin.untitled
--
-- Created:
--          by - chao16.ews (siebl-0403-13.ews.illinois.edu)
--          at - 01:25:40 10/03/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteJoin IS
   PORT( 
      AFinalChunk   : IN     LC3B_WORD;
      BFinalChunk   : IN     LC3B_WORD;
      CFinalChunk   : IN     LC3B_WORD;
      DFinalChunk   : IN     LC3B_WORD;
      EFinalChunk   : IN     LC3B_WORD;
      FFinalChunk   : IN     LC3B_WORD;
      GFinalChunk   : IN     LC3B_WORD;
      HFinalChunk   : IN     LC3B_WORD;
      clk           : IN     std_logic;
      CacheWriteout : OUT    LC3B_OWORD
   );

-- Declarations

END WriteJoin ;

--
ARCHITECTURE untitled OF WriteJoin IS
BEGIN
  CacheWriteout <= HFinalChunk & GFinalChunk & FFinalChunk & EFinalChunk & DFinalChunk & CFinalChunk & BFinalChunk & AFinalChunk;
END ARCHITECTURE untitled;

