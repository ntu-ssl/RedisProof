Definition _dictInit_spec (d: Ptr) (type: Ptr) (privDataPtr: Ptr) (st: RData) : (option (Z * RData)) :=
  rely ((((d.(pbase)) = ("memory")) /\ (((type.(pbase)) = ("memory")))));
  if ((privDataPtr.(pbase)) =s ("null"))
  then (
    (Some (
      0  ,
      (st.[memory].[data] :<
        ((((((((((((((st.(memory)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) # (((d.(poffset)) + (16)) + (16)) == (Some 0)) #
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
          (Some (MEMORY_BASE + ((type.(poffset)))))) #
          ((d.(poffset)) + (8)) ==
          (Some 0)) #
          ((d.(poffset)) + (80)) ==
          (Some (-1))) #
          ((d.(poffset)) + (84)) ==
          (Some 0)))
    )))
  else (
    if ((privDataPtr.(pbase)) =s ("memory"))
    then (
      (Some (
        0  ,
        (st.[memory].[data] :<
          ((((((((((((((st.(memory)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) # (((d.(poffset)) + (16)) + (16)) == (Some 0)) #
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
            (Some (MEMORY_BASE + ((type.(poffset)))))) #
            ((d.(poffset)) + (8)) ==
            (Some (MEMORY_BASE + ((privDataPtr.(poffset)))))) #
            ((d.(poffset)) + (80)) ==
            (Some (-1))) #
            ((d.(poffset)) + (84)) ==
            (Some 0)))
      )))
    else (
      (Some (
        0  ,
        (st.[memory].[data] :<
          ((((((((((((((st.(memory)).(data)) # ((d.(poffset)) + (16)) == (Some 0)) # (((d.(poffset)) + (16)) + (8)) == (Some 0)) # (((d.(poffset)) + (16)) + (16)) == (Some 0)) #
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
            (Some (MEMORY_BASE + ((type.(poffset)))))) #
            ((d.(poffset)) + (8)) ==
            (Some BAD_PTR_BASE)) #
            ((d.(poffset)) + (80)) ==
            (Some (-1))) #
            ((d.(poffset)) + (84)) ==
            (Some 0)))
      )))).

Fixpoint _dictClear_loop_2 (ht: Ptr) (he_0: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
  if (! (ptr_eqb he_0 (mkPtr "null" 0)))
  then (
    when v_10_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset he_0 16) st));
    when st_1 == ((_dictFree_spec he_0 st_0));
    when v_12, st_2 == ((load_RData 8 (ptr_offset ht 24) st_1));
    when st_3 == ((store_RData 8 (ptr_offset ht 24) (v_12 + ((-1))) st_2));
    (_dictClear_loop_2 ht (int_to_ptr v_10_ptr_in_Z) arg_dummy0 st_3))
  else (Some (ht, he_0, 0, st)).

Fixpoint _dictClear_loop_0 (ht: Ptr) (i_0: Z) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * Z * RData)) :=
  when v_0, st_0 == ((load_RData 8 (ptr_offset ht 8) st));
  if ((i_0 - (v_0)) <? (0))
  then (
    when v_1, st_1 == ((load_RData 8 (ptr_offset ht 24) st_0));
    if (v_1 >? (0))
    then (
      when v_2_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset ht 0) st_1));
      when v_3_ptr_in_Z, st_3 == ((load_RData 8 (ptr_offset (int_to_ptr v_2_ptr_in_Z) (i_0 * (8))) st_2));
      if (ptr_eqb (int_to_ptr v_3_ptr_in_Z) (mkPtr "null" 0))
      then (_dictClear_loop_0 ht (i_0 + (1)) arg_dummy0 st_3)
      else (
        match ((_dictClear_loop_1 ht (int_to_ptr v_3_ptr_in_Z) 0 st_3)) with
        | (Some (ht_after, he_0_dup_after, v_7, st_4)) => (_dictClear_loop_0 ht (i_0 + (1)) arg_dummy0 st_4)
        | None => None
        end))
    else (Some (ht, i_0, 0, st_1)))
  else (Some (ht, i_0, 0, st_0)).

Fixpoint _dictClear_loop_1 (ht: Ptr) (he_0_dup: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
  if (! (ptr_eqb he_0_dup (mkPtr "null" 0)))
  then (
    when v_4_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset he_0_dup 16) st));
    when st_1 == ((_dictFree_spec he_0_dup st_0));
    when v_6, st_2 == ((load_RData 8 (ptr_offset ht 24) st_1));
    when st_3 == ((store_RData 8 (ptr_offset ht 24) (v_6 + ((-1))) st_2));
    (_dictClear_loop_1 ht (int_to_ptr v_4_ptr_in_Z) arg_dummy0 st_3))
  else (Some (ht, he_0_dup, 0, st)).

Definition _dictClear_spec (d: Ptr) (ht: Ptr) (st: RData) : (option (Z * RData)) :=
  match ((_dictClear_loop_0 ht 0 0 st)) with
  | (Some (ht_after, i_0_after, v_14, st_0)) =>
    if ((ht.(pbase)) =s ("memory"))
    then (
      when ret == ((((st_0.(memory)).(data)) @ (ht.(poffset))));
      if ((ret - (MEMORY_BASE)) >=? (0))
      then (
        (Some (
          0  ,
          (st_0.[memory].[data] :<
            (((((((st_0.(memory)).(data)) # (ret - (MEMORY_BASE)) == None) # (ht.(poffset)) == (Some 0)) # ((ht.(poffset)) + (8)) == (Some 0)) #
              ((ht.(poffset)) + (16)) ==
              (Some 0)) #
              ((ht.(poffset)) + (24)) ==
              (Some 0)))
        )))
      else (
        (Some (
          0  ,
          (st_0.[memory].[data] :<
            ((((((st_0.(memory)).(data)) # (ht.(poffset)) == (Some 0)) # ((ht.(poffset)) + (8)) == (Some 0)) # ((ht.(poffset)) + (16)) == (Some 0)) #
              ((ht.(poffset)) + (24)) ==
              (Some 0)))
        ))))
    else (
      if ((ht.(pbase)) =s ("dict_can_resize"))
      then (
        if (((st_0.(dict_can_resize)) - (MEMORY_BASE)) >=? (0))
        then (Some (0, ((st_0.[dict_can_resize] :< 0).[memory].[data] :< (((st_0.(memory)).(data)) # ((st_0.(dict_can_resize)) - (MEMORY_BASE)) == None))))
        else (Some (0, (st_0.[dict_can_resize] :< 0))))
      else (Some (0, bad_st)))
  | None => None
  end.

Definition dictExpand_spec (d: Ptr) (size: Z) (st: RData) : (option (Z * RData)) :=
  rely (((d.(pbase)) = ("memory")));
  if (size >=? (9223372036854775807))
  then (
    when ret == ((((st.(memory)).(data)) @ ((d.(poffset)) + (80))));
    if (ret <>? ((-1)))
    then (Some (1, st))
    else (
      when ret_0 == ((((st.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
      if ((ret_0 - (size)) >? (0))
      then (Some (1, st))
      else (
        let offset := ((st.(memory)).(offset)) in
        when ret_1 == (((((st.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
        if (
          if ((ret_1 - (MEMORY_BASE)) >=? (0))
          then (false && (((ret_1 - (MEMORY_BASE)) =? (0))))
          else (true && (true)))
        then (
          (Some (
            0  ,
            ((st.[memory].[data] :<
              (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                ((d.(poffset)) + (24)) ==
                (Some 9223372036854775807)) #
                ((d.(poffset)) + (32)) ==
                (Some 9223372036854775806)) #
                ((d.(poffset)) + (40)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (18446744073709551608)))
          )))
        else (
          (Some (
            0  ,
            ((st.[memory].[data] :<
              ((((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) #
                ((d.(poffset)) + (56)) ==
                (Some 9223372036854775807)) #
                ((d.(poffset)) + (64)) ==
                (Some 9223372036854775806)) #
                ((d.(poffset)) + (72)) ==
                (Some 0)) #
                ((d.(poffset)) + (80)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (18446744073709551608)))
          ))))))
  else (
    match ((_dictNextPower_loop_0 size 4 0 0 st)) with
    | (Some (size_after, i_0_after, i_0, v_0, st_1)) =>
      when ret == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (80))));
      if (ret <>? ((-1)))
      then (Some (1, st_1))
      else (
        when ret_0 == ((((st_1.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
        if ((ret_0 - (size)) >? (0))
        then (Some (1, st_1))
        else (
          let offset := ((st_1.(memory)).(offset)) in
          when ret_1 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
          if (
            if ((ret_1 - (MEMORY_BASE)) >=? (0))
            then (false && (((ret_1 - (MEMORY_BASE)) =? (0))))
            else (true && (true)))
          then (
            (Some (
              0  ,
              ((st_1.[memory].[data] :<
                (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                  ((d.(poffset)) + (32)) ==
                  (Some (i_0 - (1)))) #
                  ((d.(poffset)) + (40)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + ((i_0 * (8)))))
            )))
          else (
            (Some (
              0  ,
              ((st_1.[memory].[data] :<
                ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                  ((d.(poffset)) + (64)) ==
                  (Some (i_0 - (1)))) #
                  ((d.(poffset)) + (72)) ==
                  (Some 0)) #
                  ((d.(poffset)) + (80)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + ((i_0 * (8)))))
            )))))
    | None => None
    end).

Definition _dictStringCopyHTHashFunction_spec (key: Ptr) (st: RData) : (option (Z * RData)) :=
  match ((dictGenHashFunction_loop_0 key 0 5381 0 0 st)) with
  | (Some (buf_addr_0_after, len_addr_0_after, hash_0_after, hash_0, v_1, st_1)) => (Some (hash_0, st_1))
  | None => None
  end.

Definition _dictStringCopyHTKeyDup_spec (privdata: Ptr) (key: Ptr) (st: RData) : (option (Ptr * RData)) :=
  let offset := ((st.(memory)).(offset)) in
  (Some ((mkPtr "memory" offset), ((st.[memory].[data] :< (((st.(memory)).(data)) # offset == (Some 0))).[memory].[offset] :< (offset + (1))))).

Definition _dictStringKeyValCopyHTValDup_spec (privdata: Ptr) (val: Ptr) (st: RData) : (option (Ptr * RData)) :=
  let offset := ((st.(memory)).(offset)) in
  (Some ((mkPtr "memory" offset), ((st.[memory].[data] :< (((st.(memory)).(data)) # offset == (Some 0))).[memory].[offset] :< (offset + (1))))).

Definition _dictStringCopyHTKeyCompare_spec (privdata: Ptr) (key1: Ptr) (key2: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (1, st)).

Definition _dictStringCopyHTKeyDestructor_spec (privdata: Ptr) (key: Ptr) (st: RData) : (option RData) :=
  if ((key.(pbase)) =s ("memory"))
  then (Some (st.[memory].[data] :< (((st.(memory)).(data)) # (key.(poffset)) == None)))
  else (Some st).

Definition _dictStringKeyValCopyHTValDestructor_spec (privdata: Ptr) (val: Ptr) (st: RData) : (option RData) :=
  if ((val.(pbase)) =s ("memory"))
  then (Some (st.[memory].[data] :< (((st.(memory)).(data)) # (val.(poffset)) == None)))
  else (Some st).

