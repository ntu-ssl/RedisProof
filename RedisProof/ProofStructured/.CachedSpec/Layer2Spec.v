Definition _dictInit_spec (d: Ptr) (type: Ptr) (privDataPtr: Ptr) (st: RData) : (option (Z * RData)) :=
  if ((d.(pbase)) =s ("dictht"))
  then (
    if ((type.(pbase)) =s ("null"))
    then (
      if ((privDataPtr.(pbase)) =s ("null"))
      then (
        (Some (
          0  ,
          (st.[dicthtStore].[data] :<
            ((((((((((((((st.(dicthtStore)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) #
              (((d.(poffset)) + (16)) + (16)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (24)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (32)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (8)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (16)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (24)) ==
              (Some 0)) #
              (d.(poffset)) ==
              (Some 0)) #
              ((d.(poffset)) + (8)) ==
              (Some 0)) #
              ((d.(poffset)) + (80)) ==
              (Some (-1))) #
              ((d.(poffset)) + (84)) ==
              (Some 0)))
        )))
      else (
        (Some (
          0  ,
          (st.[dicthtStore].[data] :<
            ((((((((((((((st.(dicthtStore)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) #
              (((d.(poffset)) + (16)) + (16)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (24)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (32)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (8)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (16)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (24)) ==
              (Some 0)) #
              (d.(poffset)) ==
              (Some 0)) #
              ((d.(poffset)) + (8)) ==
              (Some 1)) #
              ((d.(poffset)) + (80)) ==
              (Some (-1))) #
              ((d.(poffset)) + (84)) ==
              (Some 0)))
        ))))
    else (
      if ((privDataPtr.(pbase)) =s ("null"))
      then (
        (Some (
          0  ,
          (st.[dicthtStore].[data] :<
            ((((((((((((((st.(dicthtStore)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) #
              (((d.(poffset)) + (16)) + (16)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (24)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (32)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (8)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (16)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (24)) ==
              (Some 0)) #
              (d.(poffset)) ==
              (Some 1)) #
              ((d.(poffset)) + (8)) ==
              (Some 0)) #
              ((d.(poffset)) + (80)) ==
              (Some (-1))) #
              ((d.(poffset)) + (84)) ==
              (Some 0)))
        )))
      else (
        (Some (
          0  ,
          (st.[dicthtStore].[data] :<
            ((((((((((((((st.(dicthtStore)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) #
              (((d.(poffset)) + (16)) + (16)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (24)) ==
              (Some 0)) #
              (((d.(poffset)) + (16)) + (32)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (8)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (16)) ==
              (Some 0)) #
              ((((d.(poffset)) + (16)) + (32)) + (24)) ==
              (Some 0)) #
              (d.(poffset)) ==
              (Some 1)) #
              ((d.(poffset)) + (8)) ==
              (Some 1)) #
              ((d.(poffset)) + (80)) ==
              (Some (-1))) #
              ((d.(poffset)) + (84)) ==
              (Some 0)))
        )))))
  else (
    if ((type.(pbase)) =s ("null"))
    then (
      if ((privDataPtr.(pbase)) =s ("null"))
      then (Some (0, bad_st))
      else (Some (0, bad_st)))
    else (
      if ((privDataPtr.(pbase)) =s ("null"))
      then (Some (0, bad_st))
      else (Some (0, bad_st)))).

