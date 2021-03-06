--
-- VHDL Architecture ece411.Reg_IF_ID.untitled
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 09:55:31 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg_IF_ID IS
  PORT (
    clk           : IN    std_logic;
    Reset_L       : IN    std_logic;
    Load          : IN    std_logic;
    IF_IR_IN      : IN    LC3b_word;
    IF_PCPlus2out : IN    LC3b_word;
    IF_IR         : OUT   LC3b_word;
    IF_IMM5       : OUT   LC3B_IMM5;
    IF_INDEX6     : OUT   LC3B_INDEX6;
    IF_TRAPVECT8  : OUT   LC3B_TRAPVECT8;
    IF_OFFSET9    : OUT   LC3B_OFFSET9;
    IF_OFFSET11   : OUT   LC3B_OFFSET11;
    IF_Opcode     : OUT   LC3b_opcode;
    IF_SrcA       : OUT   LC3b_reg;
    IF_SrcB       : OUT   LC3b_reg;
    IF_dest       : OUT   LC3b_reg;
    IF_shftop     : OUT   LC3b_shftop;
    IF_IR5        : OUT   std_logic;
    IF_IR11       : OUT   std_logic;
    IF_PCPlus2    : OUT   LC3b_word;
    IF_N          : OUT   std_logic;
    IF_Z          : OUT   std_logic;
    IF_P          : OUT   std_logic;
    
    -- Add control word here
    IF_CONTROL_IN 	: IN				CONTROL_WORD;
    IF_CONTROL_OUT	: OUT			CONTROL_WORD   
  );      
END ENTITY Reg_IF_ID;

--
ARCHITECTURE untitled OF Reg_IF_ID IS
BEGIN
  -----------------------------------
  VHDL_REG_IR : PROCESS(clk, Load, Reset_L, IF_IR_IN)
  -----------------------------------
  variable tempIR       : LC3b_word;
  variable tempPCPlus2  : LC3b_word;
  variable tempCONTROL		: CONTROL_WORD;
  BEGIN
    if (Reset_L = '0') then
      tempIR  :=  "0000000000000000";
      tempPCPlus2 := "0000000000000000";
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
--      tempCONTROL := (others => '0');
    elsif (clk'event and (clk = '1') and (clk'last_value = '0')) then
      if (Load = '1') then
        tempIR       := IF_IR_IN;
        tempPCPlus2  := IF_PCPlus2out;
        tempCONTROL		:= IF_CONTROL_IN; 
      end if;
    end if;
    
    IF_IR         <= tempIR after delay_reg;
    IF_IMM5       <= tempIR(4 downto 0) after delay_reg;
    IF_INDEX6     <= tempIR(5 downto 0) after delay_reg;
    IF_TRAPVECT8  <= tempIR(7 downto 0) after delay_reg;
    IF_OFFSET9    <= tempIR(8 downto 0) after delay_reg;
    IF_OFFSET11   <= tempIR(10 downto 0) after delay_reg;
    IF_Opcode     <= tempIR(15 downto 12) after delay_reg;
    IF_SrcA       <= tempIR(8 downto 6) after delay_reg;
    IF_SrcB       <= tempIR(2 downto 0) after delay_reg;
    IF_dest       <= tempIR(11 downto 9) after delay_reg;
    IF_shftop     <= tempIR(5 downto 4) after delay_reg;
    IF_IR5        <= tempIR(5) after delay_reg;
    IF_IR11       <= tempIR(11) after delay_reg;
    IF_N          <= tempIR(11) after delay_reg;
    IF_Z          <= tempIR(10) after delay_reg;
    IF_P          <= tempIR(9) after delay_reg;
    
    IF_PCPlus2    <= tempPCPlus2 after delay_reg;
    
    IF_CONTROL_OUT<= tempCONTROL after delay_reg;
  
  END PROCESS VHDL_REG_IR;     
END ARCHITECTURE untitled;

