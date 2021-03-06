-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY ece411;
CONFIGURATION mp1_CPU_struct_config OF mp2_CPU IS
   FOR struct
      FOR ALL : CLKgen
         USE ENTITY ece411.CLKgen(untitled);
      END FOR;
      FOR ALL : Control
         USE ENTITY ece411.Control(fsm);
      END FOR;
      FOR ALL : Datapath
         USE CONFIGURATION ece411.Datapath_struct_config;
      END FOR;
      FOR ALL : Memory
         USE ENTITY ece411.Memory(untitled);
      END FOR;
   END FOR;
END mp1_CPU_struct_config;
