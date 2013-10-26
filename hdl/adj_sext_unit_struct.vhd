-- VHDL Entity ece411.ADJ_SEXT_Unit.symbol
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 11:46:09 10/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ_SEXT_Unit IS
   PORT( 
      IF_IMM5      : IN     LC3b_imm5;
      IF_INDEX6    : IN     LC3b_index6;
      IF_OFFSET11  : IN     LC3b_offset11;
      IF_OFFSET9   : IN     LC3b_offset9;
      IF_TRAPVECT8 : IN     LC3b_trapvect8;
      clk          : IN     std_logic;
      IF_ADJ11out  : OUT    LC3b_word;
      IF_ADJ6out   : OUT    LC3b_word;
      IF_ADJ8out   : OUT    LC3b_word;
      IF_ADJ9out   : OUT    LC3b_word;
      IF_IMM5out   : OUT    LC3b_word;
      IF_SEXT6out  : OUT    LC3b_word
   );

-- Declarations

END ADJ_SEXT_Unit ;

--
-- VHDL Architecture ece411.ADJ_SEXT_Unit.struct
--
-- Created:
--          by - schen79.ews (siebl-0222-22.ews.illinois.edu)
--          at - 11:46:09 10/25/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.NUMERIC_STD.all;


ARCHITECTURE struct OF ADJ_SEXT_Unit IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT ADJ11
   PORT (
      clk      : IN     std_logic;
      offset11 : IN     LC3b_offset11;
      ADJ11out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ6
   PORT (
      clk     : IN     std_logic;
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ8
   PORT (
      clk       : IN     std_logic;
      trapvect8 : IN     LC3b_trapvect8;
      ADJ8out   : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      clk     : IN     std_logic;
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT SEXT5
   PORT (
      Imm5    : IN     LC3b_imm5 ;
      clk     : IN     std_logic ;
      Imm5out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      clk      : IN     std_logic;
      index6   : IN     LC3b_index6;
      SEXT6out : OUT    LC3b_word
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ8 USE ENTITY ece411.ADJ8;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_3 : ADJ11
      PORT MAP (
         clk      => clk,
         offset11 => IF_OFFSET11,
         ADJ11out => IF_ADJ11out
      );
   U_0 : ADJ6
      PORT MAP (
         clk     => clk,
         index6  => IF_INDEX6,
         ADJ6out => IF_ADJ6out
      );
   U_1 : ADJ8
      PORT MAP (
         clk       => clk,
         trapvect8 => IF_TRAPVECT8,
         ADJ8out   => IF_ADJ8out
      );
   U_2 : ADJ9
      PORT MAP (
         clk     => clk,
         offset9 => IF_OFFSET9,
         ADJ9out => IF_ADJ9out
      );
   U_4 : SEXT5
      PORT MAP (
         Imm5    => IF_IMM5,
         clk     => clk,
         Imm5out => IF_IMM5out
      );
   U_5 : SEXT6
      PORT MAP (
         index6   => IF_INDEX6,
         clk      => clk,
         SEXT6out => IF_SEXT6out
      );

END struct;