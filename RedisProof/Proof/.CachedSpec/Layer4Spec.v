Fixpoint _dictKeyIndex_loop_0 (call1: Z) (d: Ptr) (table_0: Z) (arg_dummy0: Z) (st: RData) : (option (Z * Ptr * Z * Z * RData)) :=
  if (table_0 <=? (1))
  then (
    when v_2, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) (table_0 * (32))) 16) st));
    when v_3_ptr_in_Z, st_1 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) (table_0 * (32))) 0) st_0));
    when v_4_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_3_ptr_in_Z) ((call1 & (v_2)) * (8))) st_1));
    when v_5, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
    if (v_5 <>? ((-1)))
    then (_dictKeyIndex_loop_0 call1 d (table_0 + (1)) arg_dummy0 st_3)
    else (Some (call1, d, table_0, 1, st_3)))
  else (Some (call1, d, table_0, 0, st)).

Definition _dictKeyIndex_spec (d: Ptr) (key: Ptr) (st: RData) : (option (Z * RData)) :=
  rely (((d.(pbase)) = ("memory")));
  when ret == ((((st.(memory)).(data)) @ ((d.(poffset)) + (80))));
  if (ret <>? ((-1)))
  then (
    when ret_0 == ((((st.(memory)).(data)) @ (d.(poffset))));
    if ((ret_0 - (MEMORY_BASE)) >=? (0))
    then (
      when ret_1 == ((((st.(memory)).(data)) @ (ret_0 - (MEMORY_BASE))));
      if ((ret_1 - (MEMORY_BASE)) >=? (0))
      then (
        match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "memory" (ret_1 - (MEMORY_BASE))) key st) d 0 0 st)) with
        | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
          if (v_6 =? (1))
          then (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_1 - (MEMORY_BASE))) key st), st_4))
          else (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_1 - (MEMORY_BASE))) key st), st_4))
        | None => None
        end)
      else (
        match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key st) d 0 0 st)) with
        | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
          if (v_6 =? (1))
          then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
          else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
        | None => None
        end))
    else (
      match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
      | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
        if (v_6 =? (1))
        then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
        else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
      | None => None
      end))
  else (
    when ret_0 == ((((st.(memory)).(data)) @ (((d.(poffset)) + (16)) + (8))));
    if (ret_0 =? (0))
    then (
      match ((_dictNextPower_loop_0 4 4 0 0 st)) with
      | (Some (size_after, i_0_after, i_0, v_0, st_1)) =>
        when ret_1 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (80))));
        if (ret_1 <>? ((-1)))
        then (Some ((-1), st_1))
        else (
          when ret_2 == ((((st_1.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
          if ((ret_2 - (4)) >? (0))
          then (Some ((-1), st_1))
          else (
            let offset := ((st_1.(memory)).(offset)) in
            when ret_3 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
            if (
              if ((ret_3 - (MEMORY_BASE)) >=? (0))
              then (false && (((ret_3 - (MEMORY_BASE)) =? (0))))
              else (true && (true)))
            then (
              when ret_4 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
              if ((ret_4 - (MEMORY_BASE)) >=? (0))
              then (
                when ret_5 == (
                    ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                      ((d.(poffset)) + (32)) ==
                      (Some (i_0 - (1)))) #
                      ((d.(poffset)) + (40)) ==
                      (Some 0)) @ (ret_4 - (MEMORY_BASE))));
                if ((ret_5 - (MEMORY_BASE)) >=? (0))
                then (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                        key
                        ((st_1.[memory].[data] :<
                          (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                            ((d.(poffset)) + (32)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (40)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + ((i_0 * (8))))))
                      d
                      0
                      0
                      ((st_1.[memory].[data] :<
                        (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                          ((d.(poffset)) + (32)) ==
                          (Some (i_0 - (1)))) #
                          ((d.(poffset)) + (40)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + ((i_0 * (8))))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                          key
                          ((st_1.[memory].[data] :<
                            (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                              ((d.(poffset)) + (32)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                          key
                          ((st_1.[memory].[data] :<
                            (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                              ((d.(poffset)) + (32)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                  | None => None
                  end)
                else (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "null" 0)
                        key
                        ((st_1.[memory].[data] :<
                          (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                            ((d.(poffset)) + (32)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (40)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + ((i_0 * (8))))))
                      d
                      0
                      0
                      ((st_1.[memory].[data] :<
                        (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                          ((d.(poffset)) + (32)) ==
                          (Some (i_0 - (1)))) #
                          ((d.(poffset)) + (40)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + ((i_0 * (8))))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st_1.[memory].[data] :<
                            (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                              ((d.(poffset)) + (32)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st_1.[memory].[data] :<
                            (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                              ((d.(poffset)) + (32)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                  | None => None
                  end))
              else (
                match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                  if (v_6 =? (1))
                  then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                  else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                | None => None
                end))
            else (
              when ret_4 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
              if ((ret_4 - (MEMORY_BASE)) >=? (0))
              then (
                when ret_5 == (
                    (((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                      ((d.(poffset)) + (64)) ==
                      (Some (i_0 - (1)))) #
                      ((d.(poffset)) + (72)) ==
                      (Some 0)) #
                      ((d.(poffset)) + (80)) ==
                      (Some 0)) @ (ret_4 - (MEMORY_BASE))));
                if ((ret_5 - (MEMORY_BASE)) >=? (0))
                then (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                        key
                        ((st_1.[memory].[data] :<
                          ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                            ((d.(poffset)) + (64)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (72)) ==
                            (Some 0)) #
                            ((d.(poffset)) + (80)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + ((i_0 * (8))))))
                      d
                      0
                      0
                      ((st_1.[memory].[data] :<
                        ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                          ((d.(poffset)) + (64)) ==
                          (Some (i_0 - (1)))) #
                          ((d.(poffset)) + (72)) ==
                          (Some 0)) #
                          ((d.(poffset)) + (80)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + ((i_0 * (8))))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                          key
                          ((st_1.[memory].[data] :<
                            ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                              ((d.(poffset)) + (64)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (72)) ==
                              (Some 0)) #
                              ((d.(poffset)) + (80)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_5 - (MEMORY_BASE)))
                          key
                          ((st_1.[memory].[data] :<
                            ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                              ((d.(poffset)) + (64)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (72)) ==
                              (Some 0)) #
                              ((d.(poffset)) + (80)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                  | None => None
                  end)
                else (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "null" 0)
                        key
                        ((st_1.[memory].[data] :<
                          ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                            ((d.(poffset)) + (64)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (72)) ==
                            (Some 0)) #
                            ((d.(poffset)) + (80)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + ((i_0 * (8))))))
                      d
                      0
                      0
                      ((st_1.[memory].[data] :<
                        ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                          ((d.(poffset)) + (64)) ==
                          (Some (i_0 - (1)))) #
                          ((d.(poffset)) + (72)) ==
                          (Some 0)) #
                          ((d.(poffset)) + (80)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + ((i_0 * (8))))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st_1.[memory].[data] :<
                            ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                              ((d.(poffset)) + (64)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (72)) ==
                              (Some 0)) #
                              ((d.(poffset)) + (80)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st_1.[memory].[data] :<
                            ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                              ((d.(poffset)) + (64)) ==
                              (Some (i_0 - (1)))) #
                              ((d.(poffset)) + (72)) ==
                              (Some 0)) #
                              ((d.(poffset)) + (80)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + ((i_0 * (8))))))  ,
                        st_5
                      )))
                  | None => None
                  end))
              else (
                match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                  if (v_6 =? (1))
                  then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                  else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                | None => None
                end))))
      | None => None
      end)
    else (
      when ret_1 == ((((st.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
      if ((ret_1 - (ret_0)) >=? (0))
      then (
        if ((st.(dict_can_resize)) <>? (0))
        then (
          if ((ret_1 * (2)) >=? (9223372036854775807))
          then (
            let offset := ((st.(memory)).(offset)) in
            when ret_5 == (((((st.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
            if (
              if ((ret_5 - (MEMORY_BASE)) >=? (0))
              then (false && (((ret_5 - (MEMORY_BASE)) =? (0))))
              else (true && (true)))
            then (
              when ret_2 == (((((st.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
              if ((ret_2 - (MEMORY_BASE)) >=? (0))
              then (
                when ret_3 == (
                    ((((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                      ((d.(poffset)) + (24)) ==
                      (Some 9223372036854775807)) #
                      ((d.(poffset)) + (32)) ==
                      (Some 9223372036854775806)) #
                      ((d.(poffset)) + (40)) ==
                      (Some 0)) @ (ret_2 - (MEMORY_BASE))));
                if ((ret_3 - (MEMORY_BASE)) >=? (0))
                then (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                        key
                        ((st.[memory].[data] :<
                          (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                            ((d.(poffset)) + (24)) ==
                            (Some 9223372036854775807)) #
                            ((d.(poffset)) + (32)) ==
                            (Some 9223372036854775806)) #
                            ((d.(poffset)) + (40)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + (18446744073709551608))))
                      d
                      0
                      0
                      ((st.[memory].[data] :<
                        (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                          ((d.(poffset)) + (24)) ==
                          (Some 9223372036854775807)) #
                          ((d.(poffset)) + (32)) ==
                          (Some 9223372036854775806)) #
                          ((d.(poffset)) + (40)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + (18446744073709551608))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                          key
                          ((st.[memory].[data] :<
                            (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                              ((d.(poffset)) + (24)) ==
                              (Some 9223372036854775807)) #
                              ((d.(poffset)) + (32)) ==
                              (Some 9223372036854775806)) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                          key
                          ((st.[memory].[data] :<
                            (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                              ((d.(poffset)) + (24)) ==
                              (Some 9223372036854775807)) #
                              ((d.(poffset)) + (32)) ==
                              (Some 9223372036854775806)) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                  | None => None
                  end)
                else (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "null" 0)
                        key
                        ((st.[memory].[data] :<
                          (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                            ((d.(poffset)) + (24)) ==
                            (Some 9223372036854775807)) #
                            ((d.(poffset)) + (32)) ==
                            (Some 9223372036854775806)) #
                            ((d.(poffset)) + (40)) ==
                            (Some 0))).[memory].[offset] :<
                          (offset + (18446744073709551608))))
                      d
                      0
                      0
                      ((st.[memory].[data] :<
                        (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                          ((d.(poffset)) + (24)) ==
                          (Some 9223372036854775807)) #
                          ((d.(poffset)) + (32)) ==
                          (Some 9223372036854775806)) #
                          ((d.(poffset)) + (40)) ==
                          (Some 0))).[memory].[offset] :<
                        (offset + (18446744073709551608))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st.[memory].[data] :<
                            (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                              ((d.(poffset)) + (24)) ==
                              (Some 9223372036854775807)) #
                              ((d.(poffset)) + (32)) ==
                              (Some 9223372036854775806)) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
                          ((st.[memory].[data] :<
                            (((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) #
                              ((d.(poffset)) + (24)) ==
                              (Some 9223372036854775807)) #
                              ((d.(poffset)) + (32)) ==
                              (Some 9223372036854775806)) #
                              ((d.(poffset)) + (40)) ==
                              (Some 0))).[memory].[offset] :<
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                  | None => None
                  end))
              else (
                match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                  if (v_6 =? (1))
                  then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
                  else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
                | None => None
                end))
            else (
              when ret_2 == (((((st.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
              if ((ret_2 - (MEMORY_BASE)) >=? (0))
              then (
                when ret_3 == (
                    (((((((((st.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) #
                      ((d.(poffset)) + (56)) ==
                      (Some 9223372036854775807)) #
                      ((d.(poffset)) + (64)) ==
                      (Some 9223372036854775806)) #
                      ((d.(poffset)) + (72)) ==
                      (Some 0)) #
                      ((d.(poffset)) + (80)) ==
                      (Some 0)) @ (ret_2 - (MEMORY_BASE))));
                if ((ret_3 - (MEMORY_BASE)) >=? (0))
                then (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                        key
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
                          (offset + (18446744073709551608))))
                      d
                      0
                      0
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
                        (offset + (18446744073709551608))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                          key
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
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "memory" (ret_3 - (MEMORY_BASE)))
                          key
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
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                  | None => None
                  end)
                else (
                  match (
                    (_dictKeyIndex_loop_0
                      (dictHashKey_fptr_para
                        (mkPtr "null" 0)
                        key
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
                          (offset + (18446744073709551608))))
                      d
                      0
                      0
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
                        (offset + (18446744073709551608))))
                  ) with
                  | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                    if (v_6 =? (1))
                    then (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
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
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                    else (
                      (Some (
                        (dictHashKey_fptr_para
                          (mkPtr "null" 0)
                          key
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
                            (offset + (18446744073709551608))))  ,
                        st_4
                      )))
                  | None => None
                  end))
              else (
                match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                  if (v_6 =? (1))
                  then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
                  else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
                | None => None
                end)))
          else (
            match ((_dictNextPower_loop_0 (ret_1 * (2)) 4 0 0 st)) with
            | (Some (size_after, i_0_after, i_0, v_0, st_1)) =>
              when ret_3 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (80))));
              if (ret_3 <>? ((-1)))
              then (Some ((-1), st_1))
              else (
                when ret_4 == ((((st_1.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
                if ((ret_4 - ((ret_1 * (2)))) >? (0))
                then (Some ((-1), st_1))
                else (
                  let offset := ((st_1.(memory)).(offset)) in
                  when ret_5 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
                  if (
                    if ((ret_5 - (MEMORY_BASE)) >=? (0))
                    then (false && (((ret_5 - (MEMORY_BASE)) =? (0))))
                    else (true && (true)))
                  then (
                    when ret_2 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
                    if ((ret_2 - (MEMORY_BASE)) >=? (0))
                    then (
                      when ret_6 == (
                          ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                            ((d.(poffset)) + (32)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (40)) ==
                            (Some 0)) @ (ret_2 - (MEMORY_BASE))));
                      if ((ret_6 - (MEMORY_BASE)) >=? (0))
                      then (
                        match (
                          (_dictKeyIndex_loop_0
                            (dictHashKey_fptr_para
                              (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                              key
                              ((st_1.[memory].[data] :<
                                (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                  ((d.(poffset)) + (32)) ==
                                  (Some (i_0 - (1)))) #
                                  ((d.(poffset)) + (40)) ==
                                  (Some 0))).[memory].[offset] :<
                                (offset + ((i_0 * (8))))))
                            d
                            0
                            0
                            ((st_1.[memory].[data] :<
                              (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                ((d.(poffset)) + (32)) ==
                                (Some (i_0 - (1)))) #
                                ((d.(poffset)) + (40)) ==
                                (Some 0))).[memory].[offset] :<
                              (offset + ((i_0 * (8))))))
                        ) with
                        | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                          if (v_6 =? (1))
                          then (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                                key
                                ((st_1.[memory].[data] :<
                                  (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                    ((d.(poffset)) + (32)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (40)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                          else (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                                key
                                ((st_1.[memory].[data] :<
                                  (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                    ((d.(poffset)) + (32)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (40)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                        | None => None
                        end)
                      else (
                        match (
                          (_dictKeyIndex_loop_0
                            (dictHashKey_fptr_para
                              (mkPtr "null" 0)
                              key
                              ((st_1.[memory].[data] :<
                                (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                  ((d.(poffset)) + (32)) ==
                                  (Some (i_0 - (1)))) #
                                  ((d.(poffset)) + (40)) ==
                                  (Some 0))).[memory].[offset] :<
                                (offset + ((i_0 * (8))))))
                            d
                            0
                            0
                            ((st_1.[memory].[data] :<
                              (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                ((d.(poffset)) + (32)) ==
                                (Some (i_0 - (1)))) #
                                ((d.(poffset)) + (40)) ==
                                (Some 0))).[memory].[offset] :<
                              (offset + ((i_0 * (8))))))
                        ) with
                        | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                          if (v_6 =? (1))
                          then (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "null" 0)
                                key
                                ((st_1.[memory].[data] :<
                                  (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                    ((d.(poffset)) + (32)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (40)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                          else (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "null" 0)
                                key
                                ((st_1.[memory].[data] :<
                                  (((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (16)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (24)) == (Some i_0)) #
                                    ((d.(poffset)) + (32)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (40)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                        | None => None
                        end))
                    else (
                      match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                      | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                        if (v_6 =? (1))
                        then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                        else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                      | None => None
                      end))
                  else (
                    when ret_2 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ (d.(poffset))));
                    if ((ret_2 - (MEMORY_BASE)) >=? (0))
                    then (
                      when ret_6 == (
                          (((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                            ((d.(poffset)) + (64)) ==
                            (Some (i_0 - (1)))) #
                            ((d.(poffset)) + (72)) ==
                            (Some 0)) #
                            ((d.(poffset)) + (80)) ==
                            (Some 0)) @ (ret_2 - (MEMORY_BASE))));
                      if ((ret_6 - (MEMORY_BASE)) >=? (0))
                      then (
                        match (
                          (_dictKeyIndex_loop_0
                            (dictHashKey_fptr_para
                              (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                              key
                              ((st_1.[memory].[data] :<
                                ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                  ((d.(poffset)) + (64)) ==
                                  (Some (i_0 - (1)))) #
                                  ((d.(poffset)) + (72)) ==
                                  (Some 0)) #
                                  ((d.(poffset)) + (80)) ==
                                  (Some 0))).[memory].[offset] :<
                                (offset + ((i_0 * (8))))))
                            d
                            0
                            0
                            ((st_1.[memory].[data] :<
                              ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                ((d.(poffset)) + (64)) ==
                                (Some (i_0 - (1)))) #
                                ((d.(poffset)) + (72)) ==
                                (Some 0)) #
                                ((d.(poffset)) + (80)) ==
                                (Some 0))).[memory].[offset] :<
                              (offset + ((i_0 * (8))))))
                        ) with
                        | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                          if (v_6 =? (1))
                          then (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                                key
                                ((st_1.[memory].[data] :<
                                  ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                    ((d.(poffset)) + (64)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (72)) ==
                                    (Some 0)) #
                                    ((d.(poffset)) + (80)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                          else (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "memory" (ret_6 - (MEMORY_BASE)))
                                key
                                ((st_1.[memory].[data] :<
                                  ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                    ((d.(poffset)) + (64)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (72)) ==
                                    (Some 0)) #
                                    ((d.(poffset)) + (80)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                        | None => None
                        end)
                      else (
                        match (
                          (_dictKeyIndex_loop_0
                            (dictHashKey_fptr_para
                              (mkPtr "null" 0)
                              key
                              ((st_1.[memory].[data] :<
                                ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                  ((d.(poffset)) + (64)) ==
                                  (Some (i_0 - (1)))) #
                                  ((d.(poffset)) + (72)) ==
                                  (Some 0)) #
                                  ((d.(poffset)) + (80)) ==
                                  (Some 0))).[memory].[offset] :<
                                (offset + ((i_0 * (8))))))
                            d
                            0
                            0
                            ((st_1.[memory].[data] :<
                              ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                ((d.(poffset)) + (64)) ==
                                (Some (i_0 - (1)))) #
                                ((d.(poffset)) + (72)) ==
                                (Some 0)) #
                                ((d.(poffset)) + (80)) ==
                                (Some 0))).[memory].[offset] :<
                              (offset + ((i_0 * (8))))))
                        ) with
                        | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                          if (v_6 =? (1))
                          then (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "null" 0)
                                key
                                ((st_1.[memory].[data] :<
                                  ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                    ((d.(poffset)) + (64)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (72)) ==
                                    (Some 0)) #
                                    ((d.(poffset)) + (80)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                          else (
                            (Some (
                              (dictHashKey_fptr_para
                                (mkPtr "null" 0)
                                key
                                ((st_1.[memory].[data] :<
                                  ((((((((st_1.(memory)).(data)) # offset == (Some 0)) # ((d.(poffset)) + (48)) == (Some (MEMORY_BASE + (offset)))) # ((d.(poffset)) + (56)) == (Some i_0)) #
                                    ((d.(poffset)) + (64)) ==
                                    (Some (i_0 - (1)))) #
                                    ((d.(poffset)) + (72)) ==
                                    (Some 0)) #
                                    ((d.(poffset)) + (80)) ==
                                    (Some 0))).[memory].[offset] :<
                                  (offset + ((i_0 * (8))))))  ,
                              st_5
                            )))
                        | None => None
                        end))
                    else (
                      match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
                      | (Some (call1_after, d_after, table_0_after, v_6, st_5)) =>
                        if (v_6 =? (1))
                        then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                        else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_5))
                      | None => None
                      end))))
            | None => None
            end))
        else (
          when ret_2 == ((((st.(memory)).(data)) @ (d.(poffset))));
          if ((ret_2 - (MEMORY_BASE)) >=? (0))
          then (
            when ret_3 == ((((st.(memory)).(data)) @ (ret_2 - (MEMORY_BASE))));
            if ((ret_3 - (MEMORY_BASE)) >=? (0))
            then (
              match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st) d 0 0 st)) with
              | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                if (v_6 =? (1))
                then (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st), st_4))
                else (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st), st_4))
              | None => None
              end)
            else (
              match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key st) d 0 0 st)) with
              | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
                if (v_6 =? (1))
                then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
                else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
              | None => None
              end))
          else (
            match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
            | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
              if (v_6 =? (1))
              then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
              else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
            | None => None
            end)))
      else (
        when ret_2 == ((((st.(memory)).(data)) @ (d.(poffset))));
        if ((ret_2 - (MEMORY_BASE)) >=? (0))
        then (
          when ret_3 == ((((st.(memory)).(data)) @ (ret_2 - (MEMORY_BASE))));
          if ((ret_3 - (MEMORY_BASE)) >=? (0))
          then (
            match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st) d 0 0 st)) with
            | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
              if (v_6 =? (1))
              then (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st), st_4))
              else (Some ((dictHashKey_fptr_para (mkPtr "memory" (ret_3 - (MEMORY_BASE))) key st), st_4))
            | None => None
            end)
          else (
            match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key st) d 0 0 st)) with
            | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
              if (v_6 =? (1))
              then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
              else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key st), st_4))
            | None => None
            end))
        else (
          match ((_dictKeyIndex_loop_0 (dictHashKey_fptr_para (mkPtr "null" 0) key bad_st) d 0 0 bad_st)) with
          | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
            if (v_6 =? (1))
            then (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
            else (Some ((dictHashKey_fptr_para (mkPtr "null" 0) key bad_st), st_4))
          | None => None
          end)))).

Definition _dictRehashStep_spec (d: Ptr) (st: RData) : (option RData) :=
  rely (((d.(pbase)) = ("memory")));
  when ret == ((((st.(memory)).(data)) @ ((d.(poffset)) + (84))));
  if (ret =? (0))
  then (
    when ret_0 == ((((st.(memory)).(data)) @ ((d.(poffset)) + (80))));
    if (ret_0 <>? ((-1)))
    then (
      match ((dictRehash_loop_0 d 1 0 st)) with
      | (Some (d_after, n_addr_0_after, v_24, st_1)) =>
        if (v_24 =? (1))
        then (
          when ret_1 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (16))));
          if ((ret_1 - (MEMORY_BASE)) >=? (0))
          then (
            (Some (st_1.[memory].[data] :<
              ((((((((st_1.(memory)).(data)) # (ret_1 - (MEMORY_BASE)) == None) # (((d.(poffset)) + (16)) + (32)) == (Some 0)) #
                ((((d.(poffset)) + (16)) + (32)) + (8)) ==
                (Some 0)) #
                ((((d.(poffset)) + (16)) + (32)) + (16)) ==
                (Some 0)) #
                ((((d.(poffset)) + (16)) + (32)) + (24)) ==
                (Some 0)) #
                ((d.(poffset)) + (80)) ==
                (Some (-1))))))
          else (
            (Some (st_1.[memory].[data] :<
              (((((((st_1.(memory)).(data)) # (((d.(poffset)) + (16)) + (32)) == (Some 0)) # ((((d.(poffset)) + (16)) + (32)) + (8)) == (Some 0)) #
                ((((d.(poffset)) + (16)) + (32)) + (16)) ==
                (Some 0)) #
                ((((d.(poffset)) + (16)) + (32)) + (24)) ==
                (Some 0)) #
                ((d.(poffset)) + (80)) ==
                (Some (-1)))))))
        else (Some st_1)
      | None => None
      end)
    else (Some st))
  else (Some st).

