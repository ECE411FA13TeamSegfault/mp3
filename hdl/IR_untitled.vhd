--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - schen79.ews (gelib-057-32.ews.illinois.edu)
--          at - 14:29:09 08/30/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR IS
   PORT( 
      LoadIR    : IN     std_logic;
      MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
      IMM5      : OUT    LC3B_IMM5;
      INDEX6    : OUT    LC3B_INDEX6;
      TRAPVECT8 : OUT    LC3B_TRAPVECT8;
      OFFSET9   : OUT    LC3B_OFFSET9;
      OFFSET11  : OUT    LC3B_OFFSET11;
      IF_Opcode : OUT    LC3b_opcode;
      IF_SrcA   : OUT    LC3b_reg;
      IF_SrcB   : OUT    LC3b_reg;
      IF_dest   : OUT    LC3b_reg;
      IF_shftop : OUT    LC3b_shftop;
      IF_IR5    : OUT    std_logic;
      IF_IR11   : OUT    std_logic
   );

-- Declarations

END IR ;

--
ARCHITECTURE UNTITLED OF IR IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= MDROUT AFTER DELAY_REG;
			END IF;
		END IF;
	END PROCESS VHDL_REG_IR;
	
	IF_OPCODE			<= VAL_IR(15 DOWNTO 12);
	IF_SRCA 			<= VAL_IR(8  DOWNTO 6);
	IF_SRCB 			<= VAL_IR(2  DOWNTO 0);
	IF_DEST 			<= VAL_IR(11 DOWNTO 9);
	IF_SHFTOP			<= VAL_IR(5  DOWNTO 4);
	
	IF_IR5			<= VAL_IR(5);
	IF_IR11			<= VAL_IR(11);
	
	IMM5			<= VAL_IR(4  DOWNTO 0);
	INDEX6			<= VAL_IR(5  DOWNTO 0);
	TRAPVECT8 		<= VAL_IR(7  DOWNTO 0);
	OFFSET9			<= VAL_IR(8  DOWNTO 0);
	OFFSET11			<= VAL_IR(10 DOWNTO 0);
END UNTITLED;
