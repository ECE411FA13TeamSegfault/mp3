--
-- VHDL Architecture ece411.Splitter_EX.untitled
--
-- Created:
--          by - schen79.ews (linux-a3.ews.illinois.edu)
--          at - 21:47:55 10/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Splitter_EX IS
	PORT (
		CONTROL		   : IN CONTROL_WORD;
		ADDR1Muxsel	: OUT std_logic;
		ADDR2Muxsel	: OUT LC3B_4MUX_SEL;
		ALUMuxsel			: OUT LC3B_4MUX_SEL;
		ALUop			    : OUT LC3B_ALUOP;
		EX_StoreMuxsel : OUT std_logic
	);
		
END ENTITY Splitter_EX;

--
ARCHITECTURE untitled OF Splitter_EX IS
BEGIN
	ADDR1Muxsel	 <= CONTROL.ADDR1Muxsel;
	ADDR2Muxsel  <= CONTROL.ADDR2Muxsel;
	ALUMuxsel			 <= CONTROL.ALUMuxsel;
	ALUop			     <= CONTROL.ALUop;
	EX_StoreMuxsel  <= CONTROL.StoreMuxsel;
END ARCHITECTURE untitled;

