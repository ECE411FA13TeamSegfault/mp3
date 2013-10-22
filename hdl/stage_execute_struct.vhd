-- VHDL Entity ece411.Stage_Execute.interface
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 21:45:42 10/19/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_Execute IS
   PORT( 
      ADDR1Muxsel : IN     std_logic;
      ADDR2Muxsel : IN     LC3b_4mux_sel;
      ALUMuxsel   : IN     LC3b_4mux_sel;
      ALUop       : IN     LC3b_aluop;
      EX_ADJ11    : IN     LC3b_word;
      EX_ADJ6     : IN     LC3b_word;
      EX_ADJ9     : IN     LC3b_word;
      EX_IMM5     : IN     LC3b_word;
      EX_PCPlus2  : IN     LC3b_word;
      EX_RFAout   : IN     LC3b_word;
      EX_RFBout   : IN     LC3b_word;
      EX_SEXT6    : IN     LC3b_word;
      clk         : IN     std_logic;
      EX_ALUOUT   : OUT    LC3b_word;
      EX_BRAddout : OUT    LC3b_word
   );

-- Declarations

END Stage_Execute ;

--
-- VHDL Architecture ece411.Stage_Execute.struct
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 21:45:43 10/19/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Stage_Execute IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDR1Muxout : LC3b_word;
   SIGNAL ADDR2Muxout : LC3b_word;
   SIGNAL ALUMuxout   : LC3b_word;
   SIGNAL D           : LC3b_word;


   -- Component Declarations
   COMPONENT ALU
   PORT (
      Operand1 : IN     LC3b_word ;
      Operand2 : IN     LC3b_word ;
      ALUop    : IN     LC3b_aluop ;
      ALUOUT   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT BRAdd
   PORT (
      A        : IN     LC3b_word;
      B        : IN     LC3b_word;
      BRAddout : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      C   : IN     LC3b_word ;
      D   : IN     LC3b_word ;
      Sel : IN     LC3b_4mux_sel ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : BRAdd USE ENTITY ece411.BRAdd;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : ALU
      PORT MAP (
         Operand1 => EX_RFAout,
         Operand2 => ALUMuxout,
         ALUop    => ALUop,
         ALUOUT   => EX_ALUOUT
      );
   aBRAdd : BRAdd
      PORT MAP (
         A        => ADDR2Muxout,
         B        => ADDR1Muxout,
         BRAddout => EX_BRAddout
      );
   ADDR1Mux : WordMux2
      PORT MAP (
         A   => EX_PCPlus2,
         B   => EX_RFAout,
         Sel => ADDR1Muxsel,
         F   => ADDR1Muxout
      );
   ADDR2Mux : WordMux4
      PORT MAP (
         A   => EX_ADJ6,
         B   => EX_ADJ9,
         C   => EX_ADJ11,
         D   => D,
         Sel => ADDR2Muxsel,
         F   => ADDR2Muxout
      );
   ALUMux : WordMux4
      PORT MAP (
         A   => EX_RFBout,
         B   => EX_IMM5,
         C   => EX_ADJ6,
         D   => EX_SEXT6,
         Sel => ALUMuxsel,
         F   => ALUMuxout
      );

END struct;
