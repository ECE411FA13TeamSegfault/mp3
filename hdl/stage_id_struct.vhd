-- VHDL Entity ece411.Stage_ID.interface
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 11:46:09 10/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY Stage_ID IS
   PORT( 
      DRMuxsel          : IN     std_logic;
      ID_RegFileIn      : IN     LC3b_word;
      ID_SrcA           : IN     LC3b_reg;
      ID_SrcB           : IN     LC3b_reg;
      ID_dest           : IN     LC3b_reg;
      RESET_L           : IN     std_logic;
      StoreMuxsel       : IN     std_logic;
      WB_WriteRegisters : IN     std_logic;
      clk               : IN     std_logic;
      ID_RFAout         : OUT    LC3b_word;
      ID_RFBout         : OUT    LC3b_word
   );

-- Declarations

END Stage_ID ;

--
-- VHDL Architecture ece411.Stage_ID.struct
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 11:46:09 10/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Stage_ID IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DRMuxout    : LC3b_reg;
   SIGNAL R7_sig      : LC3b_reg;
   SIGNAL StoreMuxout : LC3b_reg;


   -- Component Declarations
   COMPONENT R7
   PORT (
      R7_sig : OUT    LC3b_reg
   );
   END COMPONENT;
   COMPONENT RegFile
   PORT (
      DRMuxout    : IN     LC3b_reg;
      RESET_L     : IN     std_logic;
      RegFileIn   : IN     LC3b_word;
      RegWrite    : IN     std_logic;
      SrcB        : IN     LC3b_reg;
      StoreMuxout : IN     LC3b_reg;
      clk         : IN     std_logic;
      RFAout      : OUT    LC3b_word;
      RFBout      : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT RegMux2
   PORT (
      RegA : IN     LC3b_reg ;
      RegB : IN     LC3b_reg ;
      Sel  : IN     std_logic ;
      F    : OUT    LC3b_reg 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : R7 USE ENTITY ece411.R7;
   FOR ALL : RegFile USE ENTITY ece411.RegFile;
   FOR ALL : RegMux2 USE ENTITY ece411.RegMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_3 : R7
      PORT MAP (
         R7_sig => R7_sig
      );
   U_0 : RegFile
      PORT MAP (
         RESET_L     => RESET_L,
         RegWrite    => WB_WriteRegisters,
         StoreMuxout => StoreMuxout,
         clk         => clk,
         RFBout      => ID_RFBout,
         RFAout      => ID_RFAout,
         RegFileIn   => ID_RegFileIn,
         DRMuxout    => DRMuxout,
         SrcB        => ID_SrcB
      );
   DRMux : RegMux2
      PORT MAP (
         RegA => R7_sig,
         RegB => ID_dest,
         Sel  => DRMuxsel,
         F    => DRMuxout
      );
   StoreMux : RegMux2
      PORT MAP (
         RegA => ID_SrcA,
         RegB => ID_dest,
         Sel  => StoreMuxsel,
         F    => StoreMuxout
      );

END struct;
