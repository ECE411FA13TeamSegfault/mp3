--
-- VHDL Architecture ece411.Reg_ID_EX.untitled
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 11:03:57 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg_ID_EX IS
  PORT (
    clk           : IN std_logic;
    Reset_L       : IN std_logic;
    Load          : IN std_logic;    
    
    ID_RFAout     : IN LC3b_word;
    ID_RFBout     : IN LC3b_word;
    
    IF_IR5        : IN std_logic;
    IF_IR11       : IN std_logic;    
    
    IF_ADJ6out    : IN LC3b_word;
    IF_ADJ8out    : IN LC3b_word;
    IF_ADJ9out    : IN LC3b_word;
    IF_ADJ11out   : IN LC3b_word;
    IF_IMM5out    : IN LC3b_word;
    IF_SEXT6out   : IN LC3b_word;
    
    IF_PCPlus2    : IN LC3b_word;
    
    ID_RFA        : OUT LC3b_word;
    ID_RFB        : OUT LC3b_word;
    
    ID_IR5        : OUT std_logic;
    ID_IR11       : OUT std_logic;
    
    ID_ADJ6out    : OUT LC3b_word;
    ID_ADJ8out    : OUT LC3b_word;
    ID_ADJ9out    : OUT LC3b_word;
    ID_ADJ11out   : OUT LC3b_word;
    ID_IMM5out    : OUT LC3b_word;
    ID_SEXT6out   : OUT LC3b_word;
    
    ID_PCPlus2    : OUT LC3b_word

    
    -- Add control word here
  );
END ENTITY Reg_ID_EX;

--
ARCHITECTURE untitled OF Reg_ID_EX IS
BEGIN
    -----------------------------------
  VHDL_REG_ID : PROCESS(clk, Load, Reset_L, 
                        ID_RFAout, ID_RFBout,
                        IF_IR5, IF_IR11, IF_ADJ6out, IF_ADJ8out, IF_ADJ9out, IF_ADJ11out,
                        IF_IMM5out, IF_SEXT6out,
                        IF_PCPlus2)
  -----------------------------------
  variable tempRFAout   : LC3b_word;
  variable tempRFBout   : LC3b_word;
  variable tempIR5      : std_logic;
  variable tempIR11     : std_logic;
  variable tempADJ6     : LC3b_word;
  variable tempADJ8     : LC3b_word;
  variable tempADJ9     : LC3b_word;
  variable tempADJ11    : LC3b_word;
  variable tempIMM5     : LC3b_word;
  variable tempSEXT6    : LC3b_word;
  variable tempPCPlus2  : LC3b_word;
  
  BEGIN
    if (Reset_L = '0') then
      tempRFAout    := "0000000000000000";
      tempRFBout    := "0000000000000000";
      tempIR5       := '0';
      tempIR11      := '0';
      tempADJ6      := "0000000000000000";
      tempADJ8      := "0000000000000000";
      tempADJ9      := "0000000000000000";
      tempADJ11     := "0000000000000000";
      tempIMM5      := "0000000000000000";
      tempSEXT6     := "0000000000000000";
      tempPCPlus2   := "0000000000000000";
    elsif (clk'event and (clk = '1') and (clk'last_value = '0')) then
      if (Load = '1') then
        tempRFAout    := ID_RFAout;
        tempRFBout    := ID_RFBout;
        tempIR5       := IF_IR5;
        tempIR11      := IF_IR11;
        tempADJ6      := IF_ADJ6out;
        tempADJ8      := IF_ADJ8out;
        tempADJ9      := IF_ADJ9out;
        tempADJ11     := IF_ADJ11out;
        tempIMM5      := IF_IMM5out;
        tempSEXT6     := IF_SEXT6out;
        tempPCPlus2   := IF_PCPlus2;
      end if;
    end if;
    
    ID_RFA        <= tempRFAout after delay_reg;
    ID_RFB        <= tempRFBout after delay_reg;
    
    ID_IR5        <= tempIR5 after delay_reg;
    ID_IR11       <= tempIR11 after delay_reg;
    
    ID_ADJ6out    <= tempADJ6 after delay_reg;
    ID_ADJ8out    <= tempADJ8 after delay_reg;
    ID_ADJ9out    <= tempADJ9 after delay_reg;
    ID_ADJ11out   <= tempADJ11 after delay_reg;
    ID_IMM5out    <= tempIMM5 after delay_reg;
    ID_SEXT6out   <= tempSEXT6 after delay_reg;
    
    ID_PCPlus2    <= tempPCPlus2 after delay_reg;
    
  END PROCESS VHDL_REG_ID;
END ARCHITECTURE untitled;
