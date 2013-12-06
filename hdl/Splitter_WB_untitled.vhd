--
-- VHDL Architecture ece411.Splitter_WB.untitled
--
-- Created:
--          by - schen79.ews (linux-a3.ews.illinois.edu)
--          at - 21:54:11 10/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Splitter_WB IS
	PORT (
		CONTROL			: IN CONTROL_WORD;
		GenCCMuxsel	: OUT std_logic;
		LoadNZP			: OUT std_logic;
		RFMux2sel			: OUT LC3B_4MUX_SEL;
		RFMuxsel			: OUT std_logic;
		DRMUXSEL   : OUT STD_LOGIC;
		RegWrite			: OUT std_logic;
		STOREMUXSEL : OUT std_LOGIC
	);
END ENTITY Splitter_WB;

--
ARCHITECTURE untitled OF Splitter_WB IS
BEGIN
	GenCCMuxsel <= CONTROL.GenCCMuxsel;
	LoadNZP			<= CONTROL.LoadNZP;
	RFMux2sel			<= CONTROL.RFMux2sel;
	RFMuxsel			<= CONTROL.RFMuxsel;
	RegWrite			<= CONTROL.RegWrite;
	DRMuxSEL <= CONTROL.DRMUXSEL;
	STOREMUXSEL <= CONTROL.STOREMUXSEL;
END ARCHITECTURE untitled;

