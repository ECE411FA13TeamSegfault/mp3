-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY ece411;
CONFIGURATION Datapath_struct_config OF Datapath IS
   FOR struct
      FOR ALL : ADJ6
         USE ENTITY ece411.ADJ6(untitled);
      END FOR;
      FOR ALL : ADJ9
         USE ENTITY ece411.ADJ9(untitled);
      END FOR;
      FOR ALL : ALU
         USE ENTITY ece411.ALU(untitled);
      END FOR;
      FOR ALL : BRadd
         USE ENTITY ece411.BRadd(untitled);
      END FOR;
      FOR ALL : GenCC
         USE ENTITY ece411.GenCC(untitled);
      END FOR;
      FOR ALL : IR
         USE ENTITY ece411.IR(untitled);
      END FOR;
      FOR ALL : NZP
         USE ENTITY ece411.NZP(untitled);
      END FOR;
      FOR ALL : NZPsplit
         USE ENTITY ece411.NZPsplit(untitled);
      END FOR;
      FOR ALL : Plus2
         USE ENTITY ece411.Plus2(untitled);
      END FOR;
      FOR ALL : Reg16
         USE ENTITY ece411.Reg16(untitled);
      END FOR;
      FOR ALL : RegFile
         USE ENTITY ece411.RegFile(untitled);
      END FOR;
      FOR ALL : StoreMux
         USE ENTITY ece411.StoreMux(untitled);
      END FOR;
      FOR ALL : WordMux2
         USE ENTITY ece411.WordMux2(untitled);
      END FOR;
   END FOR;
END Datapath_struct_config;
