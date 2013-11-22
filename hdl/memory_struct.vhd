-- VHDL Entity ece411.Memory.interface
--
-- Created:
--          by - chao16.ews (evrt-252-27.ews.illinois.edu)
--          at - 13:14:05 11/20/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      D_ADDRESS   : IN     LC3b_word;
      D_DATAOUT   : IN     LC3b_word;
      D_MREAD_L   : IN     std_logic;
      D_MWRITEH_L : IN     std_logic;
      D_MWRITEL_L : IN     std_logic;
      I_ADDRESS   : IN     LC3B_WORD;
      I_DATAOUT   : IN     LC3b_word;
      I_MREAD_L   : IN     STD_LOGIC;
      I_MWRITEH_L : IN     std_logic;
      I_MWRITEL_L : IN     std_logic;
      RESET_L     : IN     STD_LOGIC;
      clk         : IN     STD_LOGIC;
      D_DATAIN    : OUT    LC3B_WORD;
      D_MRESP_H   : OUT    STD_LOGIC;
      I_DATAIN    : OUT    LC3B_WORD;
      I_MRESP_H   : OUT    STD_LOGIC
   );

-- Declarations

END Memory ;

--
-- VHDL Architecture ece411.Memory.struct
--
-- Created:
--          by - chao16.ews (evrt-252-27.ews.illinois.edu)
--          at - 13:14:05 11/20/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Memory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_PMADDRESS : LC3B_WORD;
   SIGNAL D_PMDATAIN  : LC3B_OWORD;
   SIGNAL D_PMDATAOUT : LC3B_OWORD;
   SIGNAL D_PMREAD_L  : STD_LOGIC;
   SIGNAL D_PMRESP_H  : STD_LOGIC;
   SIGNAL D_PMWRITE_L : STD_LOGIC;
   SIGNAL I_PMADDRESS : LC3B_WORD;
   SIGNAL I_PMDATAIN  : LC3B_OWORD;
   SIGNAL I_PMDATAOUT : LC3B_OWORD;
   SIGNAL I_PMREAD_L  : STD_LOGIC;
   SIGNAL I_PMRESP_H  : STD_LOGIC;
   SIGNAL I_PMWRITE_L : std_logic;


   -- Component Declarations
   COMPONENT DRAM128_DP
   PORT (
      I_PMRESP_H  : OUT    STD_LOGIC ;
      RESET_L     : IN     STD_LOGIC ;
      D_PMADDRESS : IN     LC3B_WORD ;
      D_PMDATAOUT : IN     LC3B_OWORD ;
      D_PMWRITE_L : IN     STD_LOGIC ;
      clk         : IN     STD_LOGIC ;
      D_PMRESP_H  : OUT    STD_LOGIC ;
      D_PMDATAIN  : OUT    LC3B_OWORD ;
      D_PMREAD_L  : IN     STD_LOGIC ;
      I_PMADDRESS : IN     LC3B_WORD ;
      I_PMREAD_L  : IN     STD_LOGIC ;
      I_PMDATAIN  : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT L1Cache
   PORT (
      ADDRESS   : IN     LC3B_WORD ;
      DATAOUT   : IN     LC3B_WORD ;
      MREAD_L   : IN     std_logic ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      PMDATAIN  : IN     LC3B_OWORD ;
      PMRESP_H  : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      clk       : IN     std_logic ;
      DATAIN    : OUT    LC3B_WORD ;
      MRESP_H   : OUT    std_logic ;
      PMADDRESS : OUT    LC3B_WORD ;
      PMDATAOUT : OUT    LC3B_OWORD ;
      PMREAD_L  : OUT    std_logic ;
      PMWRITE_L : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DRAM128_DP USE ENTITY ece411.DRAM128_DP;
   FOR ALL : L1Cache USE ENTITY ece411.L1Cache;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   PDRAM : DRAM128_DP
      PORT MAP (
         I_PMRESP_H  => I_PMRESP_H,
         RESET_L     => RESET_L,
         D_PMADDRESS => D_PMADDRESS,
         D_PMDATAOUT => D_PMDATAOUT,
         D_PMWRITE_L => D_PMWRITE_L,
         clk         => clk,
         D_PMRESP_H  => D_PMRESP_H,
         D_PMDATAIN  => D_PMDATAIN,
         D_PMREAD_L  => D_PMREAD_L,
         I_PMADDRESS => I_PMADDRESS,
         I_PMREAD_L  => I_PMREAD_L,
         I_PMDATAIN  => I_PMDATAIN
      );
   DCache : L1Cache
      PORT MAP (
         ADDRESS   => D_ADDRESS,
         DATAOUT   => D_DATAOUT,
         MREAD_L   => D_MREAD_L,
         MWRITEH_L => D_MWRITEH_L,
         MWRITEL_L => D_MWRITEL_L,
         PMDATAIN  => D_PMDATAIN,
         PMRESP_H  => D_PMRESP_H,
         RESET_L   => RESET_L,
         clk       => clk,
         DATAIN    => D_DATAIN,
         MRESP_H   => D_MRESP_H,
         PMADDRESS => D_PMADDRESS,
         PMDATAOUT => D_PMDATAOUT,
         PMREAD_L  => D_PMREAD_L,
         PMWRITE_L => D_PMWRITE_L
      );
   ICache : L1Cache
      PORT MAP (
         ADDRESS   => I_ADDRESS,
         DATAOUT   => I_DATAOUT,
         MREAD_L   => I_MREAD_L,
         MWRITEH_L => I_MWRITEH_L,
         MWRITEL_L => I_MWRITEL_L,
         PMDATAIN  => I_PMDATAIN,
         PMRESP_H  => I_PMRESP_H,
         RESET_L   => RESET_L,
         clk       => clk,
         DATAIN    => I_DATAIN,
         MRESP_H   => I_MRESP_H,
         PMADDRESS => I_PMADDRESS,
         PMDATAOUT => I_PMDATAOUT,
         PMREAD_L  => I_PMREAD_L,
         PMWRITE_L => I_PMWRITE_L
      );

END struct;
