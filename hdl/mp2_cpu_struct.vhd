-- VHDL Entity ece411.mp2_CPU.symbol
--
-- Created:
--          by - chao16.ews (dcl-l520-09.ews.illinois.edu)
--          at - 18:11:15 11/14/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp2_CPU IS
   PORT( 
      RESET_L : IN     STD_LOGIC;
      Start_H : IN     std_logic
   );

-- Declarations

END mp2_CPU ;

--
-- VHDL Architecture ece411.mp2_CPU.struct
--
-- Created:
--          by - chao16.ews (dcl-l520-09.ews.illinois.edu)
--          at - 18:11:15 11/14/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF mp2_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_ADDRESS   : LC3b_word;
   SIGNAL D_DATAIN    : LC3B_WORD;
   SIGNAL D_DATAOUT   : LC3b_word;
   SIGNAL D_MREAD_L   : std_logic;
   SIGNAL D_MRESP_H   : STD_LOGIC;
   SIGNAL D_MWRITEH_L : std_logic;
   SIGNAL D_MWRITEL_L : std_logic;
   SIGNAL I_ADDRESS   : LC3B_WORD;
   SIGNAL I_DATAIN    : LC3B_WORD;
   SIGNAL I_DATAOUT   : LC3b_word;
   SIGNAL I_MREAD_L   : STD_LOGIC;
   SIGNAL I_MRESP_H   : STD_LOGIC;
   SIGNAL I_MWRITEH_L : std_logic;
   SIGNAL I_MWRITEL_L : std_logic;
   SIGNAL clk         : STD_LOGIC := '0';


   -- Component Declarations
   COMPONENT CLKgen
   PORT (
      clk : INOUT  std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT Datapath
   PORT (
      D_DATAIN    : IN     LC3B_WORD ;
      D_MRESP_H   : IN     STD_LOGIC ;
      I_DATAIN    : IN     LC3B_WORD ;
      I_MRESP_H   : IN     STD_LOGIC ;
      RESET_L     : IN     STD_LOGIC ;
      Start_H     : IN     std_logic ;
      clk         : IN     STD_LOGIC ;
      D_ADDRESS   : OUT    LC3b_word ;
      D_DATAOUT   : OUT    LC3b_word ;
      D_MREAD_L   : OUT    std_logic ;
      D_MWRITEH_L : OUT    std_logic ;
      D_MWRITEL_L : OUT    std_logic ;
      I_ADDRESS   : OUT    LC3B_WORD ;
      I_MREAD_L   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Memory
   PORT (
      D_ADDRESS   : IN     LC3b_word ;
      D_DATAOUT   : IN     LC3b_word ;
      D_MREAD_L   : IN     std_logic ;
      D_MWRITEH_L : IN     std_logic ;
      D_MWRITEL_L : IN     std_logic ;
      I_ADDRESS   : IN     LC3B_WORD ;
      I_DATAOUT   : IN     LC3b_word ;
      I_MREAD_L   : IN     STD_LOGIC ;
      I_MWRITEH_L : IN     std_logic ;
      I_MWRITEL_L : IN     std_logic ;
      RESET_L     : IN     STD_LOGIC ;
      clk         : IN     STD_LOGIC ;
      D_DATAIN    : OUT    LC3B_WORD ;
      D_MRESP_H   : OUT    STD_LOGIC ;
      I_DATAIN    : OUT    LC3B_WORD ;
      I_MRESP_H   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT VDDgen
   PORT (
      F : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CLKgen USE ENTITY ece411.CLKgen;
   FOR ALL : Datapath USE ENTITY ece411.Datapath;
   FOR ALL : Memory USE ENTITY ece411.Memory;
   FOR ALL : VDDgen USE ENTITY ece411.VDDgen;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_11 : CLKgen
      PORT MAP (
         clk => clk
      );
   theDatapath : Datapath
      PORT MAP (
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H,
         I_DATAIN    => I_DATAIN,
         I_MRESP_H   => I_MRESP_H,
         RESET_L     => RESET_L,
         Start_H     => Start_H,
         clk         => clk,
         D_ADDRESS   => D_ADDRESS,
         D_DATAOUT   => D_DATAOUT,
         D_MREAD_L   => D_MREAD_L,
         D_MWRITEH_L => D_MWRITEH_L,
         D_MWRITEL_L => D_MWRITEL_L,
         I_ADDRESS   => I_ADDRESS,
         I_MREAD_L   => I_MREAD_L
      );
   DRAM : Memory
      PORT MAP (
         D_ADDRESS   => D_ADDRESS,
         D_DATAOUT   => D_DATAOUT,
         D_MREAD_L   => D_MREAD_L,
         D_MWRITEH_L => D_MWRITEH_L,
         D_MWRITEL_L => D_MWRITEL_L,
         I_ADDRESS   => I_ADDRESS,
         I_DATAOUT   => I_DATAOUT,
         I_MREAD_L   => I_MREAD_L,
         I_MWRITEH_L => I_MWRITEH_L,
         I_MWRITEL_L => I_MWRITEL_L,
         RESET_L     => RESET_L,
         clk         => clk,
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H,
         I_DATAIN    => I_DATAIN,
         I_MRESP_H   => I_MRESP_H
      );
   NeverWriteI_H : VDDgen
      PORT MAP (
         F => I_MWRITEH_L
      );
   NeverWriteI_L : VDDgen
      PORT MAP (
         F => I_MWRITEL_L
      );

END struct;
