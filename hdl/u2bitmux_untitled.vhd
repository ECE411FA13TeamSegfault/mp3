--
-- VHDL Architecture ece411.u2bitMux.UNTITLED
--
-- Created:
--          by - li151.ews (linux-a1.ews.illinois.edu)
--          at - 13:14:10 11/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY u2bitmux IS
   PORT( 
      PCMuxSel_Wr  : IN     LC3b_4MUX_SEL;
      clk          : IN     std_logic;
      PCMuxSel_out : OUT    LC3b_4mux_sel;
      PCMuxSel     : IN     LC3b_4mux_sel;
      MEM_OPCODE   : IN     LC3b_OPCODE;
      BRMuxSel     : IN     STD_LOGIC;
      TakeBR       : IN     std_logic;
      IsBR         : IN     std_logic
   );

-- Declarations

END u2bitmux ;

--
ARCHITECTURE UNTITLED OF u2bitMux IS
BEGIN
  PROCESS (IsBR, PCMUXSEL, PCMUXSEL_WR, MEM_OPCODE, BRMuxSel, PCMuxsel)
  VARIABLE STATE : LC3B_4Mux_SEL;
  BEGIN
    --IF (BRMuxSel = '1') then
      --STATE := "01";
    IF (IsBR = '1') then
      STATE := PCMuxSel;
    ELSIF (TakeBR = '1') then
      STATE := "01";
    ELSIF (MEM_OPCODE = OP_JMP) then --replace with simpler logic. NAND(jmp, trap, jsr)
      STATE := "11";
    ELSIF (MEM_OPCODE = OP_TRAP) then
      STATE := "10";
    ELSIF (MEM_OPCODE = OP_JSR) then
      STATE := PCMuxSel_WR;
    --ELSIF (MEM_OPCODE = OP_BR) then
      --STATE := PCMuxSel_WR;
    ELSE
      STATE := "00";
    END IF;
  PCMuxSEL_OUT <= STATE AFTER DELAY_MUX4;
  END PROCESS;
END ARCHITECTURE UNTITLED;
