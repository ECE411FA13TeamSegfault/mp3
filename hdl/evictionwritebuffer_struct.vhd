-- VHDL Entity ece411.EvictionWriteBuffer.interface
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:31 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EvictionWriteBuffer IS
   PORT( 
      DataWriteMuxout : IN     LC3B_OWORD;
      InWriteBack     : IN     std_logic;
      PMRESP_H        : IN     std_logic;
      RESET_L         : IN     std_logic;
      clk             : IN     std_logic;
      PMDATAOUT       : OUT    LC3B_OWORD;
      PMWRITE_L       : OUT    std_logic
   );

-- Declarations

END EvictionWriteBuffer ;

--
-- VHDL Architecture ece411.EvictionWriteBuffer.struct
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:31 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF EvictionWriteBuffer IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT Buffer_Controller
   PORT (
      InWriteBack : IN     std_logic ;
      PMRESP_H    : IN     std_logic ;
      RESET_L     : IN     std_logic ;
      clk         : IN     std_logic ;
      PMWRITE_L   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT REG128
   PORT (
      A       : IN     STD_LOGIC_VECTOR (127 DOWNTO 0);
      CLK     : IN     STD_LOGIC;
      EN      : IN     STD_LOGIC;
      RESET_L : IN     STD_LOGIC;
      F       : OUT    STD_LOGIC_VECTOR (127 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Buffer_Controller USE ENTITY ece411.Buffer_Controller;
   FOR ALL : REG128 USE ENTITY ece411.REG128;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Buffer128_Control : Buffer_Controller
      PORT MAP (
         InWriteBack => InWriteBack,
         PMRESP_H    => PMRESP_H,
         RESET_L     => RESET_L,
         clk         => clk,
         PMWRITE_L   => PMWRITE_L
      );
   Buffer128 : REG128
      PORT MAP (
         RESET_L => RESET_L,
         A       => DataWriteMuxout,
         EN      => InWriteBack,
         CLK     => clk,
         F       => PMDATAOUT
      );

END struct;
