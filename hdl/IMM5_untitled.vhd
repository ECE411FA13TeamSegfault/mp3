--
-- VHDL Architecture ece411.IMM5.untitled
--
-- Created:
--          by - chng2.ews (dcl-l520-19.ews.illinois.edu)
--          at - 15:09:25 09/08/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IMM5 IS
   PORT( 
      clk     : IN     std_logic;
      imm5    : IN     LC3b_imm5;
      IMM5out : OUT    LC3b_word
   );

-- Declarations

END IMM5 ;

--
ARCHITECTURE UNTITLED OF IMM5 IS
BEGIN
	IMM5OUT <= INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & IMM5 AFTER DELAY_MUX2;
END UNTITLED;
