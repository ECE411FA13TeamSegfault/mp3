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
		
		MEM_MDRout				: IN LC3b_word;
		
		MEM_ALU				: OUT LC3b_word;
		MEM_BRAdd				: OUT LC3b_word;
		MEM_PCPlus2				: OUT LC3b_word;
		MEM_MDR				: OUT LC3b_word
	);
END ENTITY Reg_MEM_WB;

--
ARCHITECTURE untitled OF Reg_MEM_WB IS
BEGIN
	----------------------------------------------------
	VHDL_REG_MEM : PROCESS(clk, Reset_L, Load,
						   EX_ALU, EX_BRAdd, EX_PCPlus2,
						   MEM_MDRout)
	----------------------------------------------------
	variable tempALU						: LC3b_word;
	variable tempBRAdd						: LC3b_word;
	variable tempPCPlus2				: LC3b_word;
	variable tempMDR						: LC3b_word;
	
	BEGIN
		if (Reset_L = '0') then
			tempALU			:= "000000000000";
			tempBRAdd			:= "000000000000";
			tempPCPlus2	:= "000000000000";
			tempMDR			:= "000000000000";
		elsif (clk'event and (clk = '1') and (clk'last_value = '0')) then
			if (Load = '1') then
				tempALU			:= EX_ALU;
				tempBRAdd			:= EX_BRAdd;
				tempPCPlus2	:= EX_PCPlus2;
				tempMDR			:= MEM_MDRout;
			end if;
		end if;
		
		MEM_ALU			<= tempALU after delay_reg;
		MEM_BRAdd			<= tempBRAdd after delay_reg;
		MEM_PCPlus2	<= tempPCPlus2 after delay_reg;
		MEM_MDR			<= tempMDR after delay_reg;
						   
   END PROCESS VHDL_REG_MEM;
END ARCHITECTURE untitled;

