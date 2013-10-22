--
-- VHDL Architecture ece411.ShiftUnit.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 19:08:15 09/11/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ShiftUnit IS
   PORT( 
      ALUop  : IN     LC3b_aluop;
      RFAout : IN     LC3b_word;
      clk    : IN     std_logic;
      index6 : IN     LC3b_index6;
      ALUout : OUT    LC3b_word
   );

-- Declarations

END ShiftUnit ;

--
ARCHITECTURE untitled OF ShiftUnit IS
BEGIN
END ARCHITECTURE untitled;

