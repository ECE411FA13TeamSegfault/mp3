-- VHDL Entity ece411.L1_Cache_Datapath.symbol
--
-- Created:
--          by - chao16.ews (evrt-252-27.ews.illinois.edu)
--          at - 13:14:04 11/20/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1_Cache_Datapath IS
   PORT( 
      ADDRESS     : IN     LC3b_word;
      DATAOUT     : IN     LC3b_word;
      InLoad      : IN     std_logic;
      InWaitHit   : IN     std_logic;
      InWriteBack : IN     std_logic;
      MREAD_L     : IN     std_logic;
      MWRITEH_L   : IN     std_logic;
      MWRITEL_L   : IN     std_logic;
      PMDATAIN    : IN     LC3B_OWORD;
      RESET_L     : IN     std_logic;
      clk         : IN     std_logic;
      DATAIN      : OUT    LC3B_WORD;
      Dirty       : OUT    std_logic;
      MRESP_H     : OUT    std_logic;
      Miss        : OUT    std_logic;
      PMADDRESS   : OUT    LC3b_word;
      PMDATAOUT   : OUT    LC3B_OWORD
   );

-- Declarations

END L1_Cache_Datapath ;

--
-- VHDL Architecture ece411.L1_Cache_Datapath.struct
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

LIBRARY mp3lib;

ARCHITECTURE struct OF L1_Cache_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A                 : LC3B_WORD;
   SIGNAL AFinalChunk       : LC3B_WORD;
   SIGNAL ASel              : std_logic;
   SIGNAL AccessMem         : std_logic;
   SIGNAL AddressCombineout : LC3b_word;
   SIGNAL AllowWrite0       : std_logic;
   SIGNAL AllowWrite1       : std_logic;
   SIGNAL B                 : LC3B_WORD;
   SIGNAL BFinalChunk       : LC3B_WORD;
   SIGNAL BSel              : std_logic;
   SIGNAL C                 : LC3B_WORD;
   SIGNAL CFinalChunk       : LC3B_WORD;
   SIGNAL CSel              : std_logic;
   SIGNAL CacheWriteout     : LC3B_OWORD;
   SIGNAL D                 : LC3B_WORD;
   SIGNAL DFinalChunk       : LC3B_WORD;
   SIGNAL DSel              : std_logic;
   SIGNAL DataInMuxout      : LC3B_OWORD;
   SIGNAL DataOut0          : LC3B_OWORD;
   SIGNAL DataOut1          : LC3B_OWORD;
   SIGNAL DataWriteMuxout   : LC3B_OWORD;
   SIGNAL DirtyIn0          : std_logic;
   SIGNAL DirtyIn1          : std_logic;
   SIGNAL DirtyOut0         : std_logic;
   SIGNAL DirtyOut1         : std_logic;
   SIGNAL E                 : LC3B_WORD;
   SIGNAL EFinalChunk       : LC3B_WORD;
   SIGNAL ESel              : std_logic;
   SIGNAL Equal             : std_logic;
   SIGNAL Equal1            : std_logic;
   SIGNAL F                 : LC3B_WORD;
   SIGNAL F1                : std_logic;
   SIGNAL F10               : std_logic;
   SIGNAL F11               : std_logic;
   SIGNAL F13               : std_logic;
   SIGNAL F15               : std_logic;
   SIGNAL F16               : std_logic;
   SIGNAL F2                : std_logic;
   SIGNAL F3                : std_logic;
   SIGNAL F4                : std_logic;
   SIGNAL F5                : std_logic;
   SIGNAL F6                : std_logic;
   SIGNAL F7                : std_logic;
   SIGNAL F8                : std_logic;
   SIGNAL F9                : std_logic;
   SIGNAL FFinalChunk       : LC3B_WORD;
   SIGNAL FSel              : std_logic;
   SIGNAL G                 : LC3B_WORD;
   SIGNAL GFinalChunk       : LC3B_WORD;
   SIGNAL GSel              : std_logic;
   SIGNAL H                 : LC3B_WORD;
   SIGNAL HFinalChunk       : LC3B_WORD;
   SIGNAL HSel              : std_logic;
   SIGNAL Hit               : std_logic;
   SIGNAL Index             : LC3B_C_INDEX;
   SIGNAL LRUout            : std_logic;
   SIGNAL Offset            : LC3B_C_OFFSET;
   SIGNAL Tag               : LC3B_C_TAG;
   SIGNAL TagMuxout         : LC3B_C_TAG;
   SIGNAL TagOut0           : LC3B_C_TAG;
   SIGNAL TagOut1           : LC3B_C_TAG;
   SIGNAL ValidOut0         : std_logic;
   SIGNAL ValidOut1         : std_logic;
   SIGNAL ValidWindowout    : std_logic;
   SIGNAL Way0Hit           : std_logic;
   SIGNAL Way1Hit           : std_logic;
   SIGNAL WayData           : LC3B_OWORD;
   SIGNAL delayed           : std_logic;


   -- Component Declarations
   COMPONENT AddressCombine
   PORT (
      Index             : IN     LC3B_C_INDEX;
      TagMuxout         : IN     LC3B_C_TAG;
      AddressCombineout : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT AddressSplit
   PORT (
      ADDRESS : IN     LC3b_word;
      Index   : OUT    LC3B_C_INDEX;
      Offset  : OUT    LC3B_C_OFFSET;
      Tag     : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT ChunkWriter
   PORT (
      CacheData  : IN     LC3B_WORD ;
      DataOut    : IN     LC3B_WORD ;
      MWriteH_L  : IN     std_logic ;
      MWriteL_L  : IN     std_logic ;
      Sel        : IN     std_logic ;
      FinalChunk : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT ClockDelay
   PORT (
      clk     : IN     std_logic;
      delayed : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT DataArray
   PORT (
      DataIn    : IN     LC3B_OWORD;
      DataWrite : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      DataOut   : OUT    LC3B_OWORD
   );
   END COMPONENT;
   COMPONENT DataWordMux
   PORT (
      A      : IN     LC3B_WORD;
      B      : IN     LC3B_WORD;
      C      : IN     LC3B_WORD;
      D      : IN     LC3B_WORD;
      E      : IN     LC3B_WORD;
      F      : IN     LC3B_WORD;
      G      : IN     LC3B_WORD;
      H      : IN     LC3B_WORD;
      Offset : IN     LC3B_C_OFFSET;
      DATAIN : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT DirtyArray
   PORT (
      DirtyIn    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Index      : IN     LC3B_C_INDEX;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      DirtyOut   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT LRUArray
   PORT (
      Index    : IN     LC3B_C_INDEX;
      LRUIn    : IN     std_logic;
      LRUWrite : IN     std_logic;
      RESET_L  : IN     std_logic;
      clk      : IN     std_logic;
      LRUOut   : OUT    std_logic
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
   COMPONENT TagArray
   PORT (
      Index    : IN     LC3B_C_INDEX;
      RESET_L  : IN     std_logic;
      TagIn    : IN     LC3B_C_TAG;
      TagWrite : IN     std_logic;
      clk      : IN     std_logic;
      TagOut   : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT TagComparator
   PORT (
      TagA  : IN     LC3B_C_TAG;
      TagB  : IN     LC3B_C_TAG;
      Equal : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT TagMux2
   PORT (
      A   : IN     LC3B_C_TAG;
      B   : IN     LC3B_C_TAG;
      Sel : IN     std_logic;
      F   : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT ValidArray
   PORT (
      Index      : IN     LC3B_C_INDEX;
      RESET_L    : IN     std_logic;
      ValidIn    : IN     std_logic;
      ValidWrite : IN     std_logic;
      clk        : IN     std_logic;
      ValidOut   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT ValidWindow
   PORT (
      clk            : IN     std_logic;
      delayed        : IN     std_logic;
      ValidWindowout : OUT    std_logic
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
   COMPONENT WordSplit
   PORT (
      WayData : IN     LC3B_OWORD;
      A       : OUT    LC3B_WORD;
      B       : OUT    LC3B_WORD;
      C       : OUT    LC3B_WORD;
      D       : OUT    LC3B_WORD;
      E       : OUT    LC3B_WORD;
      F       : OUT    LC3B_WORD;
      G       : OUT    LC3B_WORD;
      H       : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT WriteJoin
   PORT (
      AFinalChunk   : IN     LC3B_WORD;
      BFinalChunk   : IN     LC3B_WORD;
      CFinalChunk   : IN     LC3B_WORD;
      DFinalChunk   : IN     LC3B_WORD;
      EFinalChunk   : IN     LC3B_WORD;
      FFinalChunk   : IN     LC3B_WORD;
      GFinalChunk   : IN     LC3B_WORD;
      HFinalChunk   : IN     LC3B_WORD;
      CacheWriteout : OUT    LC3B_OWORD
   );
   END COMPONENT;
   COMPONENT WriteOffsetDecode
   PORT (
      Offset : IN     LC3B_C_OFFSET;
      ASel   : OUT    std_logic;
      BSel   : OUT    std_logic;
      CSel   : OUT    std_logic;
      DSel   : OUT    std_logic;
      ESel   : OUT    std_logic;
      FSel   : OUT    std_logic;
      GSel   : OUT    std_logic;
      HSel   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NAND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AddressCombine USE ENTITY ece411.AddressCombine;
   FOR ALL : AddressSplit USE ENTITY ece411.AddressSplit;
   FOR ALL : ChunkWriter USE ENTITY ece411.ChunkWriter;
   FOR ALL : ClockDelay USE ENTITY ece411.ClockDelay;
   FOR ALL : DataArray USE ENTITY ece411.DataArray;
   FOR ALL : DataWordMux USE ENTITY ece411.DataWordMux;
   FOR ALL : DirtyArray USE ENTITY ece411.DirtyArray;
   FOR ALL : LRUArray USE ENTITY ece411.LRUArray;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NAND3 USE ENTITY mp3lib.NAND3;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : TagArray USE ENTITY ece411.TagArray;
   FOR ALL : TagComparator USE ENTITY ece411.TagComparator;
   FOR ALL : TagMux2 USE ENTITY ece411.TagMux2;
   FOR ALL : ValidArray USE ENTITY ece411.ValidArray;
   FOR ALL : ValidWindow USE ENTITY ece411.ValidWindow;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordSplit USE ENTITY ece411.WordSplit;
   FOR ALL : WriteJoin USE ENTITY ece411.WriteJoin;
   FOR ALL : WriteOffsetDecode USE ENTITY ece411.WriteOffsetDecode;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- PMDATAOUT = DataWriteMuxout
   PMDATAOUT <= DataWriteMuxout;

   -- HDL Embedded Text Block 2 eb2
   -- MRESP_H = Hit
   MRESP_H <= Hit;


   -- Instance port mappings.
   aAddressCombine : AddressCombine
      PORT MAP (
         Index             => Index,
         TagMuxout         => TagMuxout,
         AddressCombineout => AddressCombineout
      );
   aAddressSplit : AddressSplit
      PORT MAP (
         ADDRESS => ADDRESS,
         Index   => Index,
         Offset  => Offset,
         Tag     => Tag
      );
   AWriter : ChunkWriter
      PORT MAP (
         CacheData  => A,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => ASel,
         FinalChunk => AFinalChunk
      );
   BWriter : ChunkWriter
      PORT MAP (
         CacheData  => B,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => BSel,
         FinalChunk => BFinalChunk
      );
   CWriter : ChunkWriter
      PORT MAP (
         CacheData  => C,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => CSel,
         FinalChunk => CFinalChunk
      );
   DWriter : ChunkWriter
      PORT MAP (
         CacheData  => D,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => DSel,
         FinalChunk => DFinalChunk
      );
   EWriter : ChunkWriter
      PORT MAP (
         CacheData  => E,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => ESel,
         FinalChunk => EFinalChunk
      );
   FWriter : ChunkWriter
      PORT MAP (
         CacheData  => F,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => FSel,
         FinalChunk => FFinalChunk
      );
   GWriter : ChunkWriter
      PORT MAP (
         CacheData  => G,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => GSel,
         FinalChunk => GFinalChunk
      );
   HWriter : ChunkWriter
      PORT MAP (
         CacheData  => H,
         DataOut    => DATAOUT,
         MWriteH_L  => MWRITEH_L,
         MWriteL_L  => MWRITEL_L,
         Sel        => HSel,
         FinalChunk => HFinalChunk
      );
   aClockDelay : ClockDelay
      PORT MAP (
         clk     => clk,
         delayed => delayed
      );
   DataArray0 : DataArray
      PORT MAP (
         DataIn    => DataInMuxout,
         DataWrite => AllowWrite0,
         Index     => Index,
         RESET_L   => RESET_L,
         DataOut   => DataOut0,
         clk       => clk
      );
   DataArray1 : DataArray
      PORT MAP (
         DataIn    => DataInMuxout,
         DataWrite => AllowWrite1,
         Index     => Index,
         RESET_L   => RESET_L,
         DataOut   => DataOut1,
         clk       => clk
      );
   aDataWordMux : DataWordMux
      PORT MAP (
         F      => F,
         G      => G,
         H      => H,
         E      => E,
         D      => D,
         C      => C,
         B      => B,
         A      => A,
         Offset => Offset,
         DATAIN => DATAIN
      );
   DirtyArray0 : DirtyArray
      PORT MAP (
         DirtyIn    => F7,
         DirtyWrite => AllowWrite0,
         Index      => Index,
         RESET_L    => RESET_L,
         clk        => clk,
         DirtyOut   => DirtyOut0
      );
   DirtyArray1 : DirtyArray
      PORT MAP (
         DirtyIn    => F11,
         DirtyWrite => AllowWrite1,
         Index      => Index,
         RESET_L    => RESET_L,
         clk        => clk,
         DirtyOut   => DirtyOut1
      );
   aLRUArray : LRUArray
      PORT MAP (
         Index    => Index,
         LRUIn    => Way0Hit,
         LRUWrite => Hit,
         RESET_L  => RESET_L,
         clk      => clk,
         LRUOut   => LRUout
      );
   DataInMux : OWordMux2
      PORT MAP (
         A   => CacheWriteout,
         B   => PMDATAIN,
         Sel => InLoad,
         F   => DataInMuxout
      );
   DataMux : OWordMux2
      PORT MAP (
         A   => DataOut1,
         B   => DataOut0,
         Sel => Way0Hit,
         F   => WayData
      );
   DataMux1 : OWordMux2
      PORT MAP (
         A   => DataOut0,
         B   => DataOut1,
         Sel => LRUout,
         F   => DataWriteMuxout
      );
   TagArray0 : TagArray
      PORT MAP (
         Index    => Index,
         RESET_L  => RESET_L,
         TagIn    => Tag,
         TagWrite => AllowWrite0,
         clk      => clk,
         TagOut   => TagOut0
      );
   TagArray1 : TagArray
      PORT MAP (
         Index    => Index,
         RESET_L  => RESET_L,
         TagIn    => Tag,
         TagWrite => AllowWrite1,
         clk      => clk,
         TagOut   => TagOut1
      );
   TagComparator0 : TagComparator
      PORT MAP (
         TagA  => Tag,
         TagB  => TagOut0,
         Equal => Equal
      );
   TagComparator1 : TagComparator
      PORT MAP (
         TagA  => Tag,
         TagB  => TagOut1,
         Equal => Equal1
      );
   aTagMux : TagMux2
      PORT MAP (
         A   => TagOut0,
         B   => TagOut1,
         Sel => LRUout,
         F   => TagMuxout
      );
   ValidArray0 : ValidArray
      PORT MAP (
         Index      => Index,
         RESET_L    => RESET_L,
         ValidIn    => AllowWrite0,
         ValidWrite => AllowWrite0,
         clk        => clk,
         ValidOut   => ValidOut0
      );
   ValidArray1 : ValidArray
      PORT MAP (
         Index      => Index,
         RESET_L    => RESET_L,
         ValidIn    => AllowWrite1,
         ValidWrite => AllowWrite1,
         clk        => clk,
         ValidOut   => ValidOut1
      );
   aValidWindow : ValidWindow
      PORT MAP (
         clk            => clk,
         delayed        => delayed,
         ValidWindowout => ValidWindowout
      );
   PMADDRESSMux : WordMux2
      PORT MAP (
         A   => ADDRESS,
         B   => AddressCombineout,
         Sel => InWriteBack,
         F   => PMADDRESS
      );
   aWordSplit : WordSplit
      PORT MAP (
         A       => A,
         B       => B,
         C       => C,
         E       => E,
         F       => F,
         G       => G,
         H       => H,
         D       => D,
         WayData => WayData
      );
   aWriteJoin : WriteJoin
      PORT MAP (
         AFinalChunk   => AFinalChunk,
         BFinalChunk   => BFinalChunk,
         CFinalChunk   => CFinalChunk,
         DFinalChunk   => DFinalChunk,
         EFinalChunk   => EFinalChunk,
         FFinalChunk   => FFinalChunk,
         GFinalChunk   => GFinalChunk,
         HFinalChunk   => HFinalChunk,
         CacheWriteout => CacheWriteout
      );
   aWriteOffsetDecode : WriteOffsetDecode
      PORT MAP (
         Offset => Offset,
         ASel   => ASel,
         BSel   => BSel,
         CSel   => CSel,
         DSel   => DSel,
         ESel   => ESel,
         FSel   => FSel,
         GSel   => GSel,
         HSel   => HSel
      );
   Delay0 : AND2
      PORT MAP (
         A => DirtyIn0,
         B => DirtyIn0,
         F => F7
      );
   Delay1 : AND2
      PORT MAP (
         A => DirtyIn1,
         B => DirtyIn1,
         F => F11
      );
   HitAND : AND2
      PORT MAP (
         A => F5,
         B => F3,
         F => Hit
      );
   LoadWrite0 : AND2
      PORT MAP (
         A => InLoad,
         B => F6,
         F => F10
      );
   LoadWrite1 : AND2
      PORT MAP (
         A => InLoad,
         B => LRUout,
         F => F15
      );
   Match0 : AND2
      PORT MAP (
         A => Equal,
         B => ValidOut0,
         F => Way0Hit
      );
   Match1 : AND2
      PORT MAP (
         A => Equal1,
         B => ValidOut1,
         F => Way1Hit
      );
   MissAND : AND2
      PORT MAP (
         A => InWaitHit,
         B => F4,
         F => Miss
      );
   PreHit : AND2
      PORT MAP (
         A => ValidWindowout,
         B => InWaitHit,
         F => F5
      );
   PreMiss : AND2
      PORT MAP (
         A => AccessMem,
         B => F2,
         F => F4
      );
   PrePreHit : AND2
      PORT MAP (
         A => F1,
         B => AccessMem,
         F => F3
      );
   Way0HitAND : AND2
      PORT MAP (
         A => Hit,
         B => Way0Hit,
         F => F8
      );
   Way1HitAND : AND2
      PORT MAP (
         A => Hit,
         B => Way1Hit,
         F => F16
      );
   WriteWay0 : AND2
      PORT MAP (
         A => F9,
         B => F8,
         F => DirtyIn0
      );
   WriteWay1 : AND2
      PORT MAP (
         A => F13,
         B => F16,
         F => DirtyIn1
      );
   DirtyMux : MUX2_1
      PORT MAP (
         A   => DirtyOut0,
         B   => DirtyOut1,
         SEL => LRUout,
         F   => Dirty
      );
   WriteAccess0 : NAND2
      PORT MAP (
         A => MWRITEH_L,
         B => MWRITEL_L,
         F => F9
      );
   WriteAccess1 : NAND2
      PORT MAP (
         A => MWRITEH_L,
         B => MWRITEL_L,
         F => F13
      );
   AccessMemNAND : NAND3
      PORT MAP (
         A => MREAD_L,
         B => MWRITEH_L,
         C => MWRITEL_L,
         F => AccessMem
      );
   NotHit : NOT1
      PORT MAP (
         A => F1,
         F => F2
      );
   NotLRUOut : NOT1
      PORT MAP (
         A => LRUout,
         F => F6
      );
   Match : OR2
      PORT MAP (
         A => Way1Hit,
         B => Way0Hit,
         F => F1
      );
   Write0 : OR2
      PORT MAP (
         A => F10,
         B => DirtyIn0,
         F => AllowWrite0
      );
   Write1 : OR2
      PORT MAP (
         A => F15,
         B => DirtyIn1,
         F => AllowWrite1
      );

END struct;