-- VHDL Entity ece411.Stage_WB.symbol
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:36 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY Stage_WB IS
   PORT( 
      GenCCMuxsel       : IN     std_logic;
      LoadNZP           : IN     std_logic;
      RFMux2sel         : IN     LC3b_4mux_sel;
      RFMuxsel          : IN     std_logic;
      RegWrite          : IN     std_logic;
      WB_ALUout         : IN     LC3b_word;
      WB_BRAddout       : IN     LC3b_word;
      WB_ByteMuxsel     : IN     std_logic;
      WB_MDRout         : IN     LC3b_word;
      WB_PCPlus2out     : IN     LC3b_word;
      WB_dest           : IN     LC3b_reg;
      clk               : IN     std_logic;
      CheckN            : OUT    std_logic;
      CheckP            : OUT    std_logic;
      CheckZ            : OUT    std_logic;
      WB_RFMuxout       : OUT    LC3b_word;
      WB_WriteRegisters : OUT    std_logic;
      n                 : OUT    std_logic;
      p                 : OUT    std_logic;
      z                 : OUT    std_logic
   );

-- Declarations

END Stage_WB ;

--
-- VHDL Architecture ece411.Stage_WB.struct
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:36 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Stage_WB IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ClrHByteout : LC3b_word;
   SIGNAL ClrLByteout : LC3b_word;
   SIGNAL F           : LC3B_WORD;
   SIGNAL GenCCMuxout : LC3b_word;
   SIGNAL GenCCout    : LC3b_cc;
   SIGNAL RFMux2out   : LC3b_word;
   SIGNAL SEXT8out    : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL WB_RFMuxout_internal : LC3b_word;


   -- Component Declarations
   COMPONENT ClrHByte
   PORT (
      RFMuxout    : IN     LC3b_word;
      ClrHByteout : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ClrLByte
   PORT (
      RFMuxout    : IN     LC3b_word;
      ClrLByteout : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      GenCCMuxout : IN     LC3b_word;
      clk         : IN     std_logic;
      GenCCout    : OUT    LC3b_cc
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc;
      LoadNZP  : IN     std_logic;
      clk      : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      clk    : IN     std_logic;
      dest   : IN     LC3b_reg;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT SEXT8
   PORT (
      RFMux2out : IN     LC3b_word;
      SEXT8out  : OUT    LC3b_word
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
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ClrHByte USE ENTITY ece411.ClrHByte;
   FOR ALL : ClrLByte USE ENTITY ece411.ClrLByte;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : SEXT8 USE ENTITY ece411.SEXT8;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1
   WB_WriteRegisters <= RegWrite;


   -- Instance port mappings.
   aClrHByte : ClrHByte
      PORT MAP (
         RFMuxout    => RFMux2out,
         ClrHByteout => ClrHByteout
      );
   aClrLByte : ClrLByte
      PORT MAP (
         RFMuxout    => RFMux2out,
         ClrLByteout => ClrLByteout
      );
   aGenCC : GenCC
      PORT MAP (
         GenCCMuxout => GenCCMuxout,
         clk         => clk,
         GenCCout    => GenCCout
      );
   U_7 : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   U_8 : NZPsplit
      PORT MAP (
         clk    => clk,
         dest   => WB_dest,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   aSEXT8 : SEXT8
      PORT MAP (
         RFMux2out => WB_RFMuxout_internal,
         SEXT8out  => SEXT8out
      );
   GenCCMux : WordMux2
      PORT MAP (
         A   => WB_RFMuxout_internal,
         B   => SEXT8out,
         Sel => GenCCMuxsel,
         F   => GenCCMuxout
      );
   RFMux2 : WordMux4
      PORT MAP (
         A   => WB_MDRout,
         B   => WB_ALUout,
         C   => WB_BRAddout,
         D   => WB_PCPlus2out,
         Sel => RFMux2sel,
         F   => RFMux2out
      );
   ByteMux : MUX2_16
      PORT MAP (
         A   => ClrLByteout,
         B   => ClrHByteout,
         SEL => WB_ByteMuxsel,
         F   => F
      );
   RFMux : MUX2_16
      PORT MAP (
         A   => RFMux2out,
         B   => F,
         SEL => RFMuxsel,
         F   => WB_RFMuxout_internal
      );

   -- Implicit buffered output assignments
   WB_RFMuxout <= WB_RFMuxout_internal;

END struct;
