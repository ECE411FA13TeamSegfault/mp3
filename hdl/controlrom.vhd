--
-- VHDL Architecture ece411.Control_ROM.untitled
--
-- Created:
--          by - li151.ews (siebl-0218-05.ews.illinois.edu)
--          at - 13:59:04 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
--USE ieee.std_logic_arith.all;

ENTITY Control_ROM IS
   PORT( 
      -- opcode and IR4, IR5, IR11 in. IR5 chooses Imm or shift. IR4 chooses shift. IR11 chooses JSR/JSRR.
      clk : IN     std_logic;
      start_h : IN  std_logic;
      opcode  : IN  LC3b_OPCODE;
      takeBr  : IN  std_logic;
      IR4 : IN std_logic;
      IR5 : IN std_logic;
      IR11  : IN std_logic;
      IR    : IN LC3b_word;
      -- control signals out. Should we join all the signals into a control word?      
      CONTROL : OUT CONTROL_WORD
   );

-- Declarations

END Control_ROM ;

--
ARCHITECTURE untitled OF Control_ROM IS
  --local signals
  signal ALUop  : LC3B_ALUOP;
BEGIN
  ctrl_sigs : process(opcode, start_h, takeBR, IR4, IR5, IR11)
  variable cWord  : CONTROL_WORD;
  BEGIN
--  IF(start_h = '0') THEN -- other team checks a fetch, loadUse, and ZextSel_EX signal
--      -- somemuxSel := '1';
--  ELSE

    cWord.opcode := opcode;
    cWord.IR      := IR;
    CASE opcode is
      when OP_ADD => --cp1
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "11";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "00";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
          -- set ADD signals
        IF IR5 = '1' THEN --choose imm or not.
          cWord.ALUMuxSel := "01";
        ELSE
          cWord.ALUMuxSel := "00";
        END IF;
      when OP_AND => --imm cp1
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "11";
        cWord.ALUop := ALU_AND;
        
        cWord.MARMuxSel := "00";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
          -- set ADD signals
        IF IR5 = '1' THEN --choose imm or not.
          cWord.ALUMuxSel := "01";
        ELSE
          cWord.ALUMuxSel := "00";
        END IF;
      when OP_BR => --where to check nzp condition? cp1
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '1';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "01";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_PASS;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "00";
        cWord.Read_H := '0';
        cWord.Write_H := '0';
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '0';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "00";
        cWord.RegWrite := '0';
        IF takeBR = '1' THEN --take branch
          cWord.PCMuxSel := "01";
        ELSE
          cWord.PCMuxSel := "00";
        END IF;
      when OP_JMP => --also RET --not done
        
        cWord.PCMuxSel := "01";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_JSR => --IR11 for JSRR, check me
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_PASS;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "11";
        cWord.RegWrite := '1'; --unsure
        IF IR11 = '1' THEN
          cWord.ADDR2MuxSel := "01";
          cWord.PCMuxSel := "01";
        ELSE
          cWord.PCMuxSel := "10";
        END IF;
      when OP_LDI => --check me
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '0';
        
        cWord.DRMuxSel := '0';
        cWord.StoreMuxSel := '1';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "10";
        cWord.ALUop := ALU_PASS;
        
        cWord.MARMuxSel := "01";
        cWord.MDRMuxSel := "00";
        cWord.Read_H := '1'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '0';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "00";
        cWord.RegWrite := '0'; --unsure
      when OP_LDB => --not done
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_LDR => -- cp1
        cWord.IR      := IR;
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "11";
        cWord.ALUMuxSel := "10";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "01";
        cWord.MDRMuxSel := "00";
        cWord.Read_H := '1'; 
        cWord.Write_H := '0';
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "00";
        cWord.RegWrite := '1';
      when OP_LEA => --not done
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_NOT => --cp1
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "11";
        cWord.ALUop := ALU_NOT;
        
        cWord.MARMuxSel := "00";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
        IF IR5 = '1' THEN --choose imm or not.
          cWord.ALUMuxSel := "01";
        ELSE
          cWord.ALUMuxSel := "00";
        END IF;
      when OP_RTI => --not done
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_SHF => --IR5, IR4
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1';
        if (IR4 = '0') then
          cWord.ALUop    := ALU_SLL;
        elsif (IR5 = '0') then
          cWord.ALUop    := ALU_SRL;
        else
          cWord.ALUop    := ALU_SRA;
        end if;
      when OP_STB => --not done
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_STI => --not done
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "01";
        cWord.RegWrite := '1'; --unsure
      when OP_STR => --cp1
        cWord.PCMuxSel := "00";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '1';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "11";
        cWord.ALUMuxSel := "10";
        cWord.ALUop := ALU_ADD;
        
        cWord.MARMuxSel := "01";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '0';
        cWord.Write_H := '1';
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '0';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "00";
        cWord.RegWrite := '0';
      when OP_TRAP =>
        cWord.PCMuxSel := "11";
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '0';
        
        cWord.ADDR1MuxSel := '1';
        cWord.ADDR2MuxSel := "00";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_PASS;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "11";
        cWord.Read_H := '1'; --unsure
        cWord.Write_H := '0'; --unsure
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '1';
        cWord.RFMuxSel := "01";
        cWord.RFMux2Sel := "11";
        cWord.RegWrite := '1'; --unsure
      when others =>
        cWord.LoadPC := '1';
        
        cWord.DRMuxSel := '1';
        cWord.StoreMuxSel := '1';
        
        cWord.ADDR1MuxSel := '0';
        cWord.ADDR2MuxSel := "01";
        cWord.ALUMuxSel := "00";
        cWord.ALUop := ALU_PASS;
        
        cWord.MARMuxSel := "10";
        cWord.MDRMuxSel := "00";
        cWord.Read_H := '0';
        cWord.Write_H := '0';
        
        cWord.GenCCMuxSel := '0';
        cWord.LoadNZP := '0';
        cWord.RFMuxSel := "00";
        cWord.RFMux2Sel := "00";
        cWord.RegWrite := '0';
        cWord.PCMuxSel := "00";
    END CASE;
--  END IF;
  CONTROL <= cWord after delay_rom;
  END PROCESS;

  --and create single control word? control_word := sig1 & sig2 & sig3...
        
END ARCHITECTURE untitled;
