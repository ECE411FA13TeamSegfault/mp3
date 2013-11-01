-- VHDL Entity ece411.Stage_IF.symbol
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 03:32:36 11/01/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY Stage_IF IS
   PORT( 
      IF_BRAddout   : IN     LC3b_word;
      IF_MDRout     : IN     LC3b_word;
      I_DATAIN      : IN     LC3b_word;
      I_MRESP_H     : IN     std_logic;
      LoadPC        : IN     std_logic;
      PCMuxSel      : IN     LC3b_4mux_sel;
      RESET_L       : IN     std_logic;
      clk           : IN     std_logic;
      IF_IR11       : OUT    std_logic;
      IF_IR4        : OUT    std_logic;
      IF_IR5        : OUT    std_logic;
      IF_IRout      : OUT    LC3b_word;
      IF_PCPlus2out : OUT    LC3b_word;
      IF_PCout      : OUT    LC3b_word;
      IF_opcode     : OUT    LC3b_opcode
   );

-- Declarations

END Stage_IF ;

--
-- VHDL Architecture ece411.Stage_IF.struct
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 03:32:36 11/01/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Stage_IF IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D        : LC3b_word;
   SIGNAL PCMuxout : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL IF_IRout_internal      : LC3b_word;
   SIGNAL IF_PCPlus2out_internal : LC3b_word;
   SIGNAL IF_PCout_internal      : LC3b_word;


   -- Component Declarations
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      Input  : IN     LC3b_word ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Splitter_IR
   PORT (
      IR_IN     : IN     LC3b_word;
      IF_IR11   : OUT    std_logic;
      IF_IR4    : OUT    std_logic;
      IF_IR5    : OUT    std_logic;
      IF_opcode : OUT    LC3b_opcode
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
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : Splitter_IR USE ENTITY ece411.Splitter_IR;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aPlus2 : Plus2
      PORT MAP (
         PCout      => IF_PCout_internal,
         clk        => clk,
         PCPlus2out => IF_PCPlus2out_internal
      );
   IR : Reg16
      PORT MAP (
         Input  => I_DATAIN,
         RESET  => RESET_L,
         clk    => clk,
         load   => I_MRESP_H,
         Output => IF_IRout_internal
      );
   PC : Reg16
      PORT MAP (
         Input  => PCMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadPC,
         Output => IF_PCout_internal
      );
   aSplitter_IR : Splitter_IR
      PORT MAP (
         IR_IN     => IF_IRout_internal,
         IF_IR4    => IF_IR4,
         IF_IR5    => IF_IR5,
         IF_IR11   => IF_IR11,
         IF_opcode => IF_opcode
      );
   PCMux : WordMux4
      PORT MAP (
         A   => IF_PCPlus2out_internal,
         B   => IF_BRAddout,
         C   => IF_MDRout,
         D   => D,
         Sel => PCMuxSel,
         F   => PCMuxout
      );

   -- Implicit buffered output assignments
   IF_IRout      <= IF_IRout_internal;
   IF_PCPlus2out <= IF_PCPlus2out_internal;
   IF_PCout      <= IF_PCout_internal;

END struct;
