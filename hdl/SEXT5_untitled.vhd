--
-- VHDL Architecture ece411.SEXT5.untitled
--
-- Created:
--          by - chng2.ews (dcl-l520-19.ews.illinois.edu)
--          at - 15:18:31 09/08/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT5 IS
   PORT( 
      IMM5    : IN     LC3b_imm5;
      clk     : IN     std_logic;
      IMM5out : OUT    LC3b_word
   );

-- Declarations

END SEXT5 ;

--
ARCHITECTURE untitled OF SEXT5 IS
BEGIN
  IMM5out <= IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5(4) & IMM5 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;