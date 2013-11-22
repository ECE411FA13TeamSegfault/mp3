-- VHDL Entity ece411.L1Cache.symbol
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 00:21:18 11/22/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1Cache IS
   PORT( 
      ADDRESS   : IN     LC3B_WORD;
      DATAOUT   : IN     LC3B_WORD;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      PMDATAIN  : IN     LC3B_OWORD;
      PMRESP_H  : IN     std_logic;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      DATAIN    : OUT    LC3B_WORD;
      MRESP_H   : OUT    std_logic;
      PMADDRESS : OUT    LC3B_WORD;
      PMDATAOUT : OUT    LC3B_OWORD;
      PMREAD_L  : OUT    std_logic;
      PMWRITE_L : OUT    std_logic
   );

-- Declarations

END L1Cache ;

--
-- VHDL Architecture ece411.L1Cache.struct
--
-- Created:
--          by - chao16.ews (gelib-057-27.ews.illinois.edu)
--          at - 00:21:18 11/22/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF L1Cache IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Dirty       : std_logic;
   SIGNAL InLoad      : std_logic;
   SIGNAL InWaitHit   : std_logic;
   SIGNAL InWriteBack : std_logic;
   SIGNAL Miss        : std_logic;


   -- Component Declarations
   COMPONENT Cache_Controller
   PORT (
      Dirty       : IN     std_logic ;
      Miss        : IN     std_logic ;
      PMRESP_H    : IN     std_logic ;
      RESET_L     : IN     std_logic ;
      clk         : IN     std_logic ;
      InLoad      : OUT    std_logic ;
      InWaitHit   : OUT    std_logic ;
      InWriteBack : OUT    std_logic ;
      PMREAD_L    : OUT    std_logic ;
      PMWRITE_L   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT L1_Cache_Datapath
   PORT (
      ADDRESS     : IN     LC3b_word ;
      DATAOUT     : IN     LC3b_word ;
      InLoad      : IN     std_logic ;
      InWaitHit   : IN     std_logic ;
      InWriteBack : IN     std_logic ;
      MREAD_L     : IN     std_logic ;
      MWRITEH_L   : IN     std_logic ;
      MWRITEL_L   : IN     std_logic ;
      PMDATAIN    : IN     LC3B_OWORD ;
      RESET_L     : IN     std_logic ;
      clk         : IN     std_logic ;
      DATAIN      : OUT    LC3B_WORD ;
      Dirty       : OUT    std_logic ;
      MRESP_H     : OUT    std_logic ;
      Miss        : OUT    std_logic ;
      PMADDRESS   : OUT    LC3b_word ;
      PMDATAOUT   : OUT    LC3B_OWORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Controller USE ENTITY ece411.Cache_Controller;
   FOR ALL : L1_Cache_Datapath USE ENTITY ece411.L1_Cache_Datapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Cache_Control : Cache_Controller
      PORT MAP (
         Dirty       => Dirty,
         Miss        => Miss,
         PMRESP_H    => PMRESP_H,
         RESET_L     => RESET_L,
         clk         => clk,
         InLoad      => InLoad,
         InWaitHit   => InWaitHit,
         InWriteBack => InWriteBack,
         PMREAD_L    => PMREAD_L,
         PMWRITE_L   => PMWRITE_L
      );
   Cache_DP : L1_Cache_Datapath
      PORT MAP (
         ADDRESS     => ADDRESS,
         DATAOUT     => DATAOUT,
         InLoad      => InLoad,
         InWaitHit   => InWaitHit,
         InWriteBack => InWriteBack,
         MREAD_L     => MREAD_L,
         MWRITEH_L   => MWRITEH_L,
         MWRITEL_L   => MWRITEL_L,
         PMDATAIN    => PMDATAIN,
         RESET_L     => RESET_L,
         clk         => clk,
         DATAIN      => DATAIN,
         Dirty       => Dirty,
         MRESP_H     => MRESP_H,
         Miss        => Miss,
         PMADDRESS   => PMADDRESS,
         PMDATAOUT   => PMDATAOUT
      );

END struct;
