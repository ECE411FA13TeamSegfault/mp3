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
USE ieee.std_logic_arith.all;

ENTITY Control_ROM IS
   PORT( 
      -- opcode and IR4, IR5, IR11 in. IR5 chooses Imm or shift. IR4 chooses shift. IR11 chooses JSR/JSRR.
      clk : IN     std_logic;
      opcode  : IN  LC3b_OPCODE;
      IR4 : IN std_logic;
      IR5 : IN std_logic;
      IR11  : IN std_logic;
      -- control signals out. Should we join all the signals into a control word?
      muxSel_out  : OUT std_logic
   );

-- Declarations

END Control_ROM ;

--
ARCHITECTURE untitled OF Control_ROM IS
  --local signals
  signal muxSel : std_logic;
  signal ALUop  : LC3B_ALUOP;
BEGIN
  ctrl_sigs : process(opcode)
  BEGIN
  IF(0) THEN -- other team checks a fetch, loadUse, and ZextSel_EX signal
      -- somemuxSel <= '1';
  ELSE
    CASE opcode is
      when OP_ADD =>
          -- set ADD signals
        IF IR5 = '1' THEN --choose imm or not.
          
        ELSE
          
        END IF;
      when OP_AND => --imm
        
      when OP_BR =>

      when OP_JMP => --also RET

      when OP_JSR => --IR11 for JSRR

      when OP_LDB =>

      when OP_LDR =>

      when OP_LEA =>

      when OP_NOT =>

      when OP_RTI =>

      when OP_SHF => --IR5, IR4

      when OP_STB =>

      when OP_STI =>

      when OP_STR =>

      when OP_TRAP =>

    END CASE;
  END IF;
  END PROCESS;
  muxSel_out <= muxSel after delay_rom;
  --and create single control word? control_word <= sig1 & sig2 & sig3...
        
END ARCHITECTURE untitled;

--Control Signals... Not including pipeline register control
--LoadIR
--LoadPC
--PCMuxSel
--IF_BRAddout
--IF_MDRout
--RESET_L
--
--ID_dest
--ID_RegFileIn
--ID_SrcA
--ID_SrcB
--DRMuxsel
--StoreMuxSel
--WB_WriteRegisters
--
--ADDR1MuxSel
--ADDR2Muxsel
--ALUMuxsel
--ALUop
--EX_ADJ11
--EX_ADJ6
--EX_ADJ9
--EX_IMM5
--EX_PCPlus2
--EX_RFAout
--EX_RFBout
--EX_SEXT6
--
--LoadMAR --now READ_H and WRITE_H
--LoadMDR 
--MARMuxsel
--MDRMuxsel
--MEM_ALUout
--MEM_PCPlus2
--MEM_TRAPVECT8
--
--GENCCMuxSel
--LOADNZP
--RFMux2sel
--RFMuxsel
--WB_ALUout
--WB_BRAddout
--WB_dest
--WB_MDRout
--WB_PCPlus2out
--Regwrite
