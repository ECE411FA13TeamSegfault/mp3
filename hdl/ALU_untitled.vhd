--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - schen79.ews (gelib-057-32.ews.illinois.edu)
--          at - 14:29:59 08/30/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      Operand1 : IN     LC3b_word;
      Operand2 : IN     LC3b_word;
      ALUop    : IN     LC3b_aluop;
      ALUOUT   : OUT    LC3b_word
   );

-- Declarations

END ALU ;

--
ARCHITECTURE UNTITLED OF ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (Operand1, Operand2, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	VARIABLE SHIFT_AMT : INTEGER;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
	  SHIFT_AMT := TO_INTEGER(UNSIGNED(Operand2(3 DOWNTO 0)));
		CASE ALUOP IS
			WHEN ALU_ADD =>
				TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(Operand1) + SIGNED(Operand2));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (Operand1 AND Operand2);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (Operand1 XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (Operand1);
			WHEN ALU_SLL =>
				TEMP_ALUOUT := LC3b_word("sll"(unsigned(Operand1), SHIFT_AMT));
--				if (SHIFT_AMT = 0) then
--					TEMP_ALUOUT := Operand1;
--				else
--					TEMP_ALUOUT(15 downto SHIFT_AMT) := Operand1(SHIFT_AMT downto 0);
--					TEMP_ALUOUT(SHIFT_AMT-1 downto 0) := (others => '0');
--				end if;
			WHEN ALU_SRL =>
				TEMP_ALUOUT := LC3b_word("srl"(unsigned(Operand1), SHIFT_AMT));
--				if (SHIFT_AMT = 0) then
--					TEMP_ALUOUT := Operand1;
--				else
--					TEMP_ALUOUT(15-SHIFT_AMT downto 0) := Operand1(15 downto SHIFT_AMT);
--					TEMP_ALUOUT(15 downto SHIFT_AMT+1) := (others => '0');
--				end if;
			WHEN ALU_SRA =>
				if (Operand2(3 downto 0) = "0000") then
					TEMP_ALUOUT :=  Operand1;
				else
					TEMP_ALUOUT(15-SHIFT_AMT downto 0) := Operand1(15 downto SHIFT_AMT);
					TEMP_ALUOUT(15 downto SHIFT_AMT+1) := (others => Operand1(15));
				end if;
--				if (SHIFT_AMT = 0) then
--					TEMP_ALUOUT := Operand1;
--				else
--					TEMP_ALUOUT(15-SHIFT_AMT downto 0) := Operand1(15 downto SHIFT_AMT);
--					TEMP_ALUOUT(15 downto SHIFT_AMT+1) := (others => Operand1(15));
--			end if;
			  
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
  if (ALUout = ALU_SLL or ALUout = ALU_SRL or ALUout = ALU_SRA) then
    ALUOUT <= TEMP_ALUOUT after DELAY_SHIFTER;
  else
    Aluout <= TEMP_ALUOUT after DELAY_ALU;
  end if;
    
	END PROCESS VHDL_ALU;
END UNTITLED;

