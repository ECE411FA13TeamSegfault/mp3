--
-- VHDL Architecture ece411.Splitter_IR.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 00:06:38 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter_IR IS
  PORT (
    IR_IN     : IN LC3b_word;
    IF_IR4    : OUT std_logic;
    IF_IR5    : OUT std_logic;
    IF_IR11   : OUT std_logic;
    IF_opcode : OUT LC3b_opcode
  );
END ENTITY Splitter_IR;

--
ARCHITECTURE untitled OF Splitter_IR IS
BEGIN
  IF_IR4  <= IR_IN(4);
  IF_IR5  <= IR_IN(5);
  IF_IR11 <= IR_IN(11);
  IF_opcode <= IR_IN(15 downto 12);
END ARCHITECTURE untitled;

