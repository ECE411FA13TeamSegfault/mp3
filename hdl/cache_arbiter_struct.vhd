-- VHDL Entity ece411.Cache_Arbiter.interface
--
-- Created:
--          by - chao16.ews (gelib-057-17.ews.illinois.edu)
--          at - 17:35:55 12/05/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Arbiter IS
   PORT( 
      D_PMADDRESS : IN     LC3B_WORD;
      D_PMDATAOUT : IN     LC3B_OWORD;
      D_PMREAD_L  : IN     STD_LOGIC;
      D_PMWRITE_L : IN     STD_LOGIC;
      I_PMADDRESS : IN     LC3B_WORD;
      I_PMDATAOUT : IN     LC3B_OWORD;
      I_PMREAD_L  : IN     STD_LOGIC;
      L2_DATAIN   : IN     LC3B_OWORD;
      L2_RESP_H   : IN     std_logic;
      RESET_L     : IN     STD_LOGIC;
      clk         : IN     STD_LOGIC;
      D_PMDATAIN  : OUT    LC3B_OWORD;
      D_PMRESP_H  : OUT    STD_LOGIC;
      I_PMDATAIN  : OUT    LC3B_OWORD;
      I_PMRESP_H  : OUT    STD_LOGIC;
      L2_ADDRESS  : OUT    LC3b_word;
      L2_DATAOUT  : OUT    LC3B_OWORD;
      L2_READ_L   : OUT    std_logic;
      L2_WRITE_L  : OUT    std_logic
   );

-- Declarations

END Cache_Arbiter ;

--
-- VHDL Architecture ece411.Cache_Arbiter.struct
--
-- Created:
--          by - chao16.ews (gelib-057-17.ews.illinois.edu)
--          at - 17:35:56 12/05/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Cache_Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL C   : STD_LOGIC;
   SIGNAL F   : STD_LOGIC;
   SIGNAL F1  : STD_LOGIC;
   SIGNAL F10 : STD_LOGIC;
   SIGNAL F11 : STD_LOGIC;
   SIGNAL F14 : std_logic;
   SIGNAL F2  : STD_LOGIC;
   SIGNAL F4  : STD_LOGIC;
   SIGNAL F6  : STD_LOGIC;
   SIGNAL F7  : STD_LOGIC;
   SIGNAL F8  : STD_LOGIC;
   SIGNAL F9  : STD_LOGIC;
   SIGNAL Sel : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL D_PMRESP_H_internal : STD_LOGIC;
   SIGNAL I_PMRESP_H_internal : STD_LOGIC;


   -- Component Declarations
   COMPONENT Cache_Arbiter_Control
   PORT (
      AccessD    : IN     std_logic ;
      AccessI    : IN     std_logic ;
      D_PMRESP_H : IN     std_logic ;
      I_PMRESP_H : IN     std_logic ;
      clk        : IN     std_logic ;
      rst        : IN     std_logic ;
      Sel        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DEMUX2_1
   PORT (
      F   : IN     std_logic ;
      Sel : IN     std_logic ;
      A   : OUT    std_logic ;
      B   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DEMUX2_128
   PORT (
      F   : IN     LC3B_OWORD ;
      Sel : IN     std_logic ;
      A   : OUT    LC3B_OWORD ;
      B   : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3B_OWORD;
      B   : IN     LC3B_OWORD;
      Sel : IN     std_logic;
      F   : OUT    LC3B_OWORD
   );
   END COMPONENT;
   COMPONENT VDDgen
   PORT (
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT AND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : Cache_Arbiter_Control USE ENTITY ece411.Cache_Arbiter_Control;
   FOR ALL : DEMUX2_1 USE ENTITY ece411.DEMUX2_1;
   FOR ALL : DEMUX2_128 USE ENTITY ece411.DEMUX2_128;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NOR2 USE ENTITY mp3lib.NOR2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : VDDgen USE ENTITY ece411.VDDgen;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aCache_Arbiter_Control : Cache_Arbiter_Control
      PORT MAP (
         AccessD    => F4,
         AccessI    => C,
         D_PMRESP_H => D_PMRESP_H_internal,
         I_PMRESP_H => I_PMRESP_H_internal,
         clk        => clk,
         rst        => RESET_L,
         Sel        => Sel
      );
   SelRESP_H : DEMUX2_1
      PORT MAP (
         F   => L2_RESP_H,
         Sel => Sel,
         A   => I_PMRESP_H_internal,
         B   => D_PMRESP_H_internal
      );
   SelDATAIN : DEMUX2_128
      PORT MAP (
         F   => L2_DATAIN,
         Sel => Sel,
         A   => I_PMDATAIN,
         B   => D_PMDATAIN
      );
   SelDATAOUT : OWordMux2
      PORT MAP (
         A   => I_PMDATAOUT,
         B   => D_PMDATAOUT,
         Sel => F14,
         F   => L2_DATAOUT
      );
   DATAOUTSel : VDDgen
      PORT MAP (
         F => F14
      );
   Delay4 : AND2
      PORT MAP (
         A => Sel,
         B => Sel,
         F => F11
      );
   Delay5 : AND2
      PORT MAP (
         A => Sel,
         B => Sel,
         F => F
      );
   ReadD : AND2
      PORT MAP (
         A => F10,
         B => F11,
         F => F7
      );
   ReadI : AND2
      PORT MAP (
         A => F9,
         B => F8,
         F => F6
      );
   CRUCIALDELAY : AND3
      PORT MAP (
         A => F2,
         B => F2,
         C => F2,
         F => L2_READ_L
      );
   SelADDRESS : MUX2_16
      PORT MAP (
         A   => I_PMADDRESS,
         B   => D_PMADDRESS,
         SEL => Sel,
         F   => L2_ADDRESS
      );
   D_READ : NAND2
      PORT MAP (
         A => D_PMREAD_L,
         B => D_PMWRITE_L,
         F => F4
      );
   L2_WRITE_L_NAND : NAND2
      PORT MAP (
         A => F,
         B => F1,
         F => L2_WRITE_L
      );
   L2_READ_L_NOR : NOR2
      PORT MAP (
         A => F6,
         B => F7,
         F => F2
      );
   D_PMREAD : NOT1
      PORT MAP (
         A => D_PMREAD_L,
         F => F10
      );
   D_PMWRITE : NOT1
      PORT MAP (
         A => D_PMWRITE_L,
         F => F1
      );
   I_PMREAD : NOT1
      PORT MAP (
         A => I_PMREAD_L,
         F => F9
      );
   I_READ : NOT1
      PORT MAP (
         A => I_PMREAD_L,
         F => C
      );
   InIAccess : NOT1
      PORT MAP (
         A => Sel,
         F => F8
      );

   -- Implicit buffered output assignments
   D_PMRESP_H <= D_PMRESP_H_internal;
   I_PMRESP_H <= I_PMRESP_H_internal;

END struct;
