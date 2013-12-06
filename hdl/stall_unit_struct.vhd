-- VHDL Entity ece411.Stall_Unit.symbol
--
-- Created:
--          by - chao16.ews (gelib-057-17.ews.illinois.edu)
--          at - 16:35:33 12/05/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stall_Unit IS
   PORT( 
      Load     : IN     std_logic;
      RESET_L  : IN     std_logic;
      RegWrite : IN     STD_LOGIC;
      clk      : IN     std_logic;
      dest     : IN     LC3B_REG;
      srcA     : IN     LC3B_REG;
      srcB     : IN     LC3B_REG;
      Stall    : OUT    std_logic
   );

-- Declarations

END Stall_Unit ;

--
-- VHDL Architecture ece411.Stall_Unit.struct
--
-- Created:
--          by - chao16.ews (gelib-057-17.ews.illinois.edu)
--          at - 16:35:33 12/05/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Stall_Unit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F       : std_logic;
   SIGNAL F1      : std_logic;
   SIGNAL F2      : std_logic;
   SIGNAL F3      : std_logic;
   SIGNAL F4      : STD_LOGIC;
   SIGNAL F5      : STD_LOGIC;
   SIGNAL F6      : STD_LOGIC;
   SIGNAL F7      : STD_LOGIC;
   SIGNAL F8      : STD_LOGIC;
   SIGNAL F9      : STD_LOGIC;
   SIGNAL Output  : LC3B_REG;
   SIGNAL Output1 : LC3B_REG;


   -- Component Declarations
   COMPONENT COMP3
   PORT (
      A : IN     LC3B_REG;
      B : IN     LC3B_REG;
      F : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT Reg3
   PORT (
      Input  : IN     LC3B_REG;
      Load   : IN     std_logic;
      RESET  : IN     std_logic;
      clk    : IN     std_logic;
      Output : OUT    LC3B_REG
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : COMP3 USE ENTITY ece411.COMP3;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : Reg3 USE ENTITY ece411.Reg3;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_2 : COMP3
      PORT MAP (
         A => Output,
         B => srcB,
         F => F
      );
   U_3 : COMP3
      PORT MAP (
         A => Output,
         B => srcA,
         F => F1
      );
   U_4 : COMP3
      PORT MAP (
         A => Output1,
         B => srcA,
         F => F3
      );
   U_5 : COMP3
      PORT MAP (
         A => Output1,
         B => srcB,
         F => F2
      );
   U_0 : Reg3
      PORT MAP (
         clk    => clk,
         RESET  => RESET_L,
         Input  => dest,
         Load   => Load,
         Output => Output
      );
   U_1 : Reg3
      PORT MAP (
         clk    => clk,
         RESET  => RESET_L,
         Input  => Output,
         Load   => Load,
         Output => Output1
      );
   U_10 : AND2
      PORT MAP (
         A => F6,
         B => F4,
         F => F9
      );
   U_11 : AND2
      PORT MAP (
         A => F7,
         B => F5,
         F => F8
      );
   U_6 : OR2
      PORT MAP (
         A => F1,
         B => F,
         F => F6
      );
   U_9 : OR2
      PORT MAP (
         A => F3,
         B => F2,
         F => F7
      );
   U_12 : OR2
      PORT MAP (
         A => F9,
         B => F8,
         F => Stall
      );
   U_7 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => RegWrite,
         EN      => Load,
         CLK     => clk,
         F       => F4
      );
   U_8 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => F4,
         EN      => Load,
         CLK     => clk,
         F       => F5
      );

END struct;
