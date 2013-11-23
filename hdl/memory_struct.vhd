-- VHDL Entity ece411.Memory.interface
--
-- Created:
--          by - chao16.ews (siebl-0403-36.ews.illinois.edu)
--          at - 22:49:39 11/22/13
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
--          by - chao16.ews (siebl-0403-36.ews.illinois.edu)
--          at - 22:49:39 11/22/13
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
   SIGNAL ADDRESS     : LC3b_word;
   SIGNAL DATAIN      : LC3B_OWORD;
   SIGNAL DATAOUT     : LC3B_OWORD;
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
   SIGNAL L2_ADDRESS  : LC3b_word;
   SIGNAL L2_DATAIN   : LC3B_OWORD;
   SIGNAL L2_DATAOUT  : LC3B_OWORD;
   SIGNAL L2_READ_L   : std_logic;
   SIGNAL L2_RESP_H   : std_logic;
   SIGNAL L2_WRITE_L  : std_logic;
   SIGNAL MREAD_L     : std_logic;
   SIGNAL MRESP_H     : std_logic;
   SIGNAL MWRITE_L    : std_logic;


   -- Component Declarations
   COMPONENT Cache_Arbiter
   PORT (
      D_PMADDRESS : IN     LC3B_WORD ;
      D_PMDATAOUT : IN     LC3B_OWORD ;
      D_PMREAD_L  : IN     STD_LOGIC ;
      D_PMWRITE_L : IN     STD_LOGIC ;
      I_PMADDRESS : IN     LC3B_WORD ;
      I_PMDATAOUT : IN     LC3B_OWORD ;
      I_PMREAD_L  : IN     STD_LOGIC ;
      L2_DATAIN   : IN     LC3B_OWORD ;
      L2_RESP_H   : IN     std_logic ;
      RESET_L     : IN     STD_LOGIC ;
      clk         : IN     STD_LOGIC ;
      D_PMDATAIN  : OUT    LC3B_OWORD ;
      D_PMRESP_H  : OUT    STD_LOGIC ;
      I_PMDATAIN  : OUT    LC3B_OWORD ;
      I_PMRESP_H  : OUT    STD_LOGIC ;
      L2_ADDRESS  : OUT    LC3b_word ;
      L2_DATAOUT  : OUT    LC3B_OWORD ;
      L2_READ_L   : OUT    std_logic ;
      L2_WRITE_L  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DRAM128
   PORT (
      ADDRESS  : IN     LC3b_word ;
      DATAOUT  : IN     LC3B_OWORD ;
      MREAD_L  : IN     std_logic ;
      MWRITE_L : IN     std_logic ;
      RESET_L  : IN     STD_LOGIC ;
      DATAIN   : OUT    LC3B_OWORD ;
      MRESP_H  : OUT    std_logic 
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
   COMPONENT L2Cache
   PORT (
      DATAIN     : IN     LC3B_OWORD ;
      L2_ADDRESS : IN     LC3b_word ;
      L2_DATAOUT : IN     LC3B_OWORD ;
      L2_READ_L  : IN     std_logic ;
      L2_WRITE_L : IN     std_logic ;
      MRESP_H    : IN     std_logic ;
      RESET_L    : IN     STD_LOGIC ;
      clk        : IN     STD_LOGIC ;
      ADDRESS    : OUT    LC3b_word ;
      DATAOUT    : OUT    LC3B_OWORD ;
      L2_DATAIN  : OUT    LC3B_OWORD ;
      L2_RESP_H  : OUT    std_logic ;
      MREAD_L    : OUT    std_logic ;
      MWRITE_L   : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Arbiter USE ENTITY ece411.Cache_Arbiter;
   FOR ALL : DRAM128 USE ENTITY ece411.DRAM128;
   FOR ALL : L1Cache USE ENTITY ece411.L1Cache;
   FOR ALL : L2Cache USE ENTITY ece411.L2Cache;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Arbiter : Cache_Arbiter
      PORT MAP (
         D_PMADDRESS => D_PMADDRESS,
         D_PMDATAOUT => D_PMDATAOUT,
         D_PMREAD_L  => D_PMREAD_L,
         D_PMWRITE_L => D_PMWRITE_L,
         I_PMADDRESS => I_PMADDRESS,
         I_PMDATAOUT => I_PMDATAOUT,
         I_PMREAD_L  => I_PMREAD_L,
         L2_DATAIN   => L2_DATAIN,
         L2_RESP_H   => L2_RESP_H,
         RESET_L     => RESET_L,
         clk         => clk,
         D_PMDATAIN  => D_PMDATAIN,
         D_PMRESP_H  => D_PMRESP_H,
         I_PMDATAIN  => I_PMDATAIN,
         I_PMRESP_H  => I_PMRESP_H,
         L2_ADDRESS  => L2_ADDRESS,
         L2_DATAOUT  => L2_DATAOUT,
         L2_READ_L   => L2_READ_L,
         L2_WRITE_L  => L2_WRITE_L
      );
   PDRAM : DRAM128
      PORT MAP (
         ADDRESS  => ADDRESS,
         DATAOUT  => DATAOUT,
         MREAD_L  => MREAD_L,
         MWRITE_L => MWRITE_L,
         RESET_L  => RESET_L,
         DATAIN   => DATAIN,
         MRESP_H  => MRESP_H
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
   TheL2Cache : L2Cache
      PORT MAP (
         DATAIN     => DATAIN,
         L2_ADDRESS => L2_ADDRESS,
         L2_DATAOUT => L2_DATAOUT,
         L2_READ_L  => L2_READ_L,
         L2_WRITE_L => L2_WRITE_L,
         MRESP_H    => MRESP_H,
         RESET_L    => RESET_L,
         clk        => clk,
         ADDRESS    => ADDRESS,
         DATAOUT    => DATAOUT,
         L2_DATAIN  => L2_DATAIN,
         L2_RESP_H  => L2_RESP_H,
         MREAD_L    => MREAD_L,
         MWRITE_L   => MWRITE_L
      );

END struct;
