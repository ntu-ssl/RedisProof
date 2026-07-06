Record Memory :=
  mkMemory {
    offset : Z;
    data : ZMap.t (option Z)
  }.

Record RData :=
  mkRData { 
    memory : Memory;
    time : Z;
    dict_can_resize : Z
  }.

Parameter bad_st : RData.