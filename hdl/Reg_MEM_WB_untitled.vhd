--
-- VHDL Architecture ece411.Reg_MEM_WB.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 19:44:59 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Reg_MEM_WB IS
	PORT (
		clk				: IN std_logic;
		Reset_L				: IN std_logic;
		Load				: IN std_logic;
		
		EX_ALU				: IN LC3b_word;
		EX_BRAdd				: IN LC3b_word;
		EX_PCPlus2				: IN LC3b_word;
		EX_dest				: IN LC3b_reg;
		EX_ADJ9out    : IN LC3b_word;
		EX_Opcode : IN LC3b_opcode;
		
		MEM_MDRout				: IN LC3b_word;
		MEM_ByteMuxselout  : IN std_logic;
		
		EX_RFA      : IN LC3b_word;
		
		MEM_ALU				: OUT LC3b_word;
		MEM_BRAdd				: OUT LC3b_word;
		MEM_PCPlus2				: OUT LC3b_word;
		MEM_MDR				: OUT LC3b_word;
		MEM_ByteMuxsel : OUT std_logic;
		MEM_dest				: OUT LC3b_reg;
		MEM_Opcode  : OUT LC3b_opcode;
		
		MEM_RFA     : OUT LC3b_word;
		MEM_DRMUXSEL : OUT std_logic;
		
		MEM_ADJ9out   : OUT LC3b_word;
		
		MEM_PC  : OUT LC3b_word;
		
		MEM_CONTROL_IN		: IN CONTROL_WORD;
		MEM_CONTROL_OUT	: OUT CONTROL_WORD;
		MEM_PCMuxSEL    : OUT LC3b_4MUX_SEL
	);
END ENTITY Reg_MEM_WB;

--
ARCHITECTURE untitled OF Reg_MEM_WB IS
BEGIN
	----------------------------------------------------
	VHDL_REG_MEM : PROCESS(clk, Reset_L, Load,
						   EX_ALU, EX_BRAdd, EX_PCPlus2, EX_dest,
						   MEM_MDRout)
	----------------------------------------------------
	variable tempALU						: LC3b_word;
	variable tempBRAdd						: LC3b_word;
	variable tempPCPlus2				: LC3b_word;
	variable tempdest						: LC3b_reg;
	variable tempOpcode    : LC3b_opcode;
	variable tempMDR						: LC3b_word;
	variable tempByteMuxsel  : std_logic;
	variable tempCONTROL				: CONTROL_WORD;
	variable tempPCMUXSEL   : LC3b_4MUX_SEL;
	variable tempRFA        : LC3B_word;
	variable tempDRMuxSEL   : std_logic;
	variable tempPC        : LC3b_word;
	variable tempADJ9 : LC3b_word;
	
	BEGIN
		if (Reset_L = '0') then
			tempALU			:= "0000000000000000";
			tempBRAdd			:= "0000000000000000";
			tempPCPlus2	:= "0000000000000000";
			tempdest			:= "000";
			tempOpcode := "0000";
			tempMDR			:= "0000000000000000";
			tempByteMuxsel := '0';
      tempCONTROL.PCMuxsel := "00";
      tempCONTROL.Read_H   := '0';
      tempCONTROL.Write_H  := '0';
      tempCONTROL.regWrite := '0';
      tempControl.mem := "0000000000000000";
      tempControl.wb := "0000000000000000";
      tempControl.opcode := "0000";
      tempControl.IR := "0000000000000000";
      tempControl.LoadPC := '0';
      tempControl.DRMuxsel := '0';
      tempControl.StoreMuxsel := '0';
      tempControl.ADDR1Muxsel := '0';
      tempControl.ADDR2Muxsel := "00";
      tempControl.ALUMuxsel := "00";
      tempControl.ALUop := "000";
      tempControl.MARMuxsel := "00";
      tempControl.MDRMuxsel := "00";
      tempControl.READ_H := '0';
      tempControl.WRITE_H := '0';
      tempControl.LDI := '0';
      tempControl.STI := '0';
      tempControl.STB := '0';
      tempControl.GenCCMuxsel := '0';
      tempControl.LoadNZP := '0';
      tempControl.RFMux2sel := "00";
      tempControl.RFMuxsel := '0';
      tempControl.RegWrite := '0';
--			tempCONTROL	:= (others => '0');
		elsif (clk'event and (clk = '1') and (clk'last_value = '0')) then
			if (Load = '1') then
				tempALU			:= EX_ALU;
				tempBRAdd			:= EX_BRAdd;
				tempPCPlus2	:= EX_PCPlus2;
				tempdest			:= EX_dest;
				tempOpcode  := EX_Opcode;
				tempMDR			:= MEM_MDRout;
				tempByteMuxsel  := MEM_ByteMuxselout;
				tempCONTROL	:= MEM_CONTROL_IN;
				tempPCMuxSEL := MEM_CONTROL_IN.PCMUXSEL;
				tempRFA := EX_RFA;
				tempDRMuxSEL := MEM_CONTROL_IN.DRMuxSEL;
				tempPC := LC3B_Word(unsigned(EX_PCPlus2) - 2);
				tempADJ9 := EX_ADJ9out;
			end if;
		end if;
		
		MEM_ALU				<= tempALU after delay_reg;
		MEM_BRAdd				<= tempBRAdd after delay_reg;
		MEM_PCPlus2				<= tempPCPlus2 after delay_reg;
		MEM_dest				<= tempdest after delay_reg;
		MEM_Opcode  <= tempOpcode after delay_reg;
		MEM_MDR				<= tempMDR after delay_reg;
		MEM_ByteMuxsel <= tempByteMuxsel after delay_reg; --?
		MEM_CONTROL_OUT	<= tempCONTROL after delay_reg;
		MEM_PCMUXSEL <= tempPCMUXSEL after delay_reg;
		MEM_RFA <= tempRFA after delay_reg;
		MEM_DRMuxSEL <= tempDRMuxSEL after delay_reg;
		MEM_PC <= tempPC after delay_reg;
		MEM_ADJ9out <= tempADJ9 after delay_reg;
   END PROCESS VHDL_REG_MEM;
END ARCHITECTURE untitled;

