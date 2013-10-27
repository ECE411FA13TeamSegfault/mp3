--
-- VHDL Architecture ece411.Reg_EX_MEM.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 19:02:28 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Reg_EX_MEM IS
	PORT (
		clk				: IN std_logic;
		Reset_L				: IN std_logic;
		Load				: IN std_logic;   
		
		EX_ALUout				: IN LC3b_word;
		EX_BRAddout				: IN LC3b_word;
		
		ID_dest				: IN LC3b_reg;
		ID_ADJ8out				: IN LC3b_word;
		ID_PCPlus2				: IN LC3b_word;
		
		EX_ALU				: OUT LC3b_word;
		EX_BRAdd				: OUT LC3b_word;
		
		EX_dest				: OUT LC3b_reg;
		EX_ADJ8out				: OUT LC3b_word;
		EX_PCPlus2				: OUT LC3b_word;
		
		EX_CONTROL_IN			: IN CONTROL_WORD;
		EX_CONTROL_OUT		: OUT CONTROL_WORD
	);
END ENTITY Reg_EX_MEM;

--
ARCHITECTURE untitled OF Reg_EX_MEM IS
BEGIN
	--------------------------------------------
	VHDL_REG_EX : PROCESS(clk, Reset_L, Load,
						  EX_ALUout, EX_BRAddout,
						  ID_dest, ID_ADJ8out, ID_PCPlus2)
	---------------------------------------------
	variable tempALU						: LC3b_word;
	variable tempBRAdd						: LC3b_word;
	variable tempdest						: LC3b_reg;
	variable tempADJ8						: LC3b_word;
	variable tempPCPlus2				: LC3b_word;
	variable tempCONTROL				: CONTROL_WORD;
	
	BEGIN
		if (Reset_L = '0') then
			tempALU				:= "0000000000000000";
			tempBRAdd				:= "0000000000000000";
			tempdest				:= "000";
			tempADJ8				:= "0000000000000000";
			tempPCPlus2				:= "0000000000000000";
			tempCONTROL				:= (others => '0');
		elsif (clk'event and (clk = '1') and (clk'last_value = '0')) then
			if (Load = '1') then
				tempALU			:= EX_ALUout;
				tempBRAdd			:= EX_BRAddout;
				tempdest			:= ID_dest;
				tempADJ8			:= ID_ADJ8out;
				tempPCPlus2	:= ID_PCPlus2;
				tempCONTROL	:= EX_CONTROL_IN;
			end if;
		end if;
		
		EX_ALU			   <= tempALU after delay_reg;
		EX_BRAdd			   <= tempBRAdd after delay_reg;
		EX_dest			   <= tempdest after delay_reg;
		EX_ADJ8out			  <= tempADJ8 after delay_reg;
		EX_PCPlus2			  <= tempPCPlus2 after delay_reg;
		EX_CONTROL_OUT	<= tempCONTROL after delay_reg;

	END PROCESS VHDL_REG_EX;				
END ARCHITECTURE untitled;

