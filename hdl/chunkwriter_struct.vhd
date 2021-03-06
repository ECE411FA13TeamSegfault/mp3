-- VHDL Entity ece411.ChunkWriter.symbol
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:30 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ChunkWriter IS
   PORT( 
      CacheData  : IN     LC3B_WORD;
      DataOut    : IN     LC3B_WORD;
      MWriteH_L  : IN     std_logic;
      MWriteL_L  : IN     std_logic;
      Sel        : IN     std_logic;
      FinalChunk : OUT    LC3B_WORD
   );

-- Declarations

END ChunkWriter ;

--
-- VHDL Architecture ece411.ChunkWriter.struct
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 13:46:30 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF ChunkWriter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F  : LC3B_BYTE;
   SIGNAL F1 : LC3B_BYTE;
   SIGNAL F2 : std_logic;
   SIGNAL F3 : std_logic;
   SIGNAL F4 : std_logic;
   SIGNAL F5 : std_logic;
   SIGNAL H  : LC3b_byte;
   SIGNAL H1 : LC3b_byte;
   SIGNAL L  : LC3b_byte;
   SIGNAL L1 : LC3b_byte;


   -- Component Declarations
   COMPONENT ByteJoin
   PORT (
      H    : IN     LC3B_BYTE;
      L    : IN     LC3B_BYTE;
      Word : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT ByteMux2
   PORT (
      A   : IN     LC3b_byte ;
      B   : IN     LC3b_byte ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_byte 
   );
   END COMPONENT;
   COMPONENT ByteSplit
   PORT (
      A : IN     LC3b_word;
      H : OUT    LC3b_byte;
      L : OUT    LC3b_byte
   );
   END COMPONENT;
   COMPONENT AND2
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
   FOR ALL : ByteJoin USE ENTITY ece411.ByteJoin;
   FOR ALL : ByteMux2 USE ENTITY ece411.ByteMux2;
   FOR ALL : ByteSplit USE ENTITY ece411.ByteSplit;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aByteJoin : ByteJoin
      PORT MAP (
         H    => F,
         L    => F1,
         Word => FinalChunk
      );
   CacheDataByteMux : ByteMux2
      PORT MAP (
         A   => H1,
         B   => H,
         Sel => F2,
         F   => F
      );
   DataOutByteMux : ByteMux2
      PORT MAP (
         A   => L,
         B   => L1,
         Sel => F5,
         F   => F1
      );
   CacheDataByteSplit : ByteSplit
      PORT MAP (
         A => CacheData,
         H => H1,
         L => L
      );
   DataOutByteSplit : ByteSplit
      PORT MAP (
         A => DataOut,
         H => H,
         L => L1
      );
   SelH : AND2
      PORT MAP (
         A => F3,
         B => Sel,
         F => F2
      );
   SelL : AND2
      PORT MAP (
         A => Sel,
         B => F4,
         F => F5
      );
   MWriteH : NOT1
      PORT MAP (
         A => MWriteH_L,
         F => F3
      );
   MWriteL : NOT1
      PORT MAP (
         A => MWriteL_L,
         F => F4
      );

END struct;
