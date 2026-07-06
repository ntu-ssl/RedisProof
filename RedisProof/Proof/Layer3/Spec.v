Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.
Require Import Layer1.Spec.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer3_Spec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictExpandIfNeeded_spec (d: Ptr) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when ret == ((((st.(memory)).(data)) @ ((d.(poffset)) + (80))));
    if (ret <>? ((-1)))
    then (Some (0, st))
    else (
      when ret_0 == ((((st.(memory)).(data)) @ (((d.(poffset)) + (16)) + (8))));
      if (ret_0 =? (0))
      then (
        match ((_dictNextPower_loop_0 4 4 0 0 st)) with
        | (Some (size_after, i_0_after, i_0, v_0, st_1)) =>
          when ret_1 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (80))));
          if (ret_1 <>? ((-1)))
          then (Some (1, st_1))
          else (
            when ret_2 == ((((st_1.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
            if ((ret_2 - (4)) >? (0))
            then (Some (1, st_1))
            else (
              let offset := ((st_1.(memory)).(offset)) in
              when ret_3 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
              if (
                if ((ret_3 - (MEMORY_BASE)) >=? (0))
                then (false && (((ret_3 - (MEMORY_BASE)) =? (0))))
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
                ))))
            else (
              match ((_dictNextPower_loop_0 (ret_1 * (2)) 4 0 0 st)) with
              | (Some (size_after, i_0_after, i_0, v_0, st_1)) =>
                when ret_3 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (80))));
                if (ret_3 <>? ((-1)))
                then (Some (1, st_1))
                else (
                  when ret_4 == ((((st_1.(memory)).(data)) @ (((d.(poffset)) + (16)) + (24))));
                  if ((ret_4 - ((ret_1 * (2)))) >? (0))
                  then (Some (1, st_1))
                  else (
                    let offset := ((st_1.(memory)).(offset)) in
                    when ret_5 == (((((st_1.(memory)).(data)) # offset == (Some 0)) @ ((d.(poffset)) + (16))));
                    if (
                      if ((ret_5 - (MEMORY_BASE)) >=? (0))
                      then (false && (((ret_5 - (MEMORY_BASE)) =? (0))))
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
              end))
          else (Some (0, st)))
        else (Some (0, st)))).

  Fixpoint dictRehash_loop_1 (d: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * RData)) :=
    when v_2_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st));
    when v_3, st_1 == ((load_RData 4 (ptr_offset d 80) st_0));
    when v_4_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_2_ptr_in_Z) (v_3 * (8))) st_1));
    if (ptr_eqb (int_to_ptr v_4_ptr_in_Z) (mkPtr "null" 0))
    then (
      when v_5, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
      when st_4 == ((store_RData 4 (ptr_offset d 80) (v_5 + (1)) st_3));
      (dictRehash_loop_1 d arg_dummy0 st_4))
    else (Some (d, 0, st_2)).

  Fixpoint dictRehash_loop_2 (d: Ptr) (de_0: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
    if (! (ptr_eqb de_0 (mkPtr "null" 0)))
    then (
      when v_10_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset de_0 16) st));
      when v_11_ptr_in_Z, st_1 == ((load_RData 8 (ptr_offset d 0) st_0));
      when v_12_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_11_ptr_in_Z) 0) st_1));
      when v_13_ptr_in_Z, st_3 == ((load_RData 8 (ptr_offset de_0 0) st_2));
      when call, st_4 == ((v_12_1_fptr_dictRehash_spec (int_to_ptr v_12_ptr_in_Z) (int_to_ptr v_13_ptr_in_Z) st_3));
      when v_14, st_5 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 32) 16) st_4));
      when v_15_ptr_in_Z, st_6 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 32) 0) st_5));
      when v_16_ptr_in_Z, st_7 == ((load_RData 8 (ptr_offset (int_to_ptr v_15_ptr_in_Z) ((call & (v_14)) * (8))) st_6));
      when st_8 == ((store_RData 8 (ptr_offset de_0 16) v_16_ptr_in_Z st_7));
      when v_17_ptr_in_Z, st_9 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 32) 0) st_8));
      when st_10 == ((store_RData 8 (ptr_offset (int_to_ptr v_17_ptr_in_Z) ((call & (v_14)) * (8))) (ptr_to_int de_0) st_9));
      when v_18, st_11 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st_10));
      when st_12 == ((store_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) (v_18 + ((-1))) st_11));
      when v_19, st_13 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 32) 24) st_12));
      when st_14 == ((store_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 32) 24) (v_19 + (1)) st_13));
      (dictRehash_loop_2 d (int_to_ptr v_10_ptr_in_Z) arg_dummy0 st_14))
    else (Some (d, de_0, 0, st)).

  Fixpoint dictRehash_loop_0 (d: Ptr) (n_addr_0: Z) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * Z * RData)) :=
    if (n_addr_0 <>? (0))
    then (
      when v_1, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st));
      if (v_1 =? (0))
      then (Some (d, n_addr_0, 1, st_0))
      else (
        match ((dictRehash_loop_1 d 0 st_0)) with
        | (Some (d_after, v_6, st_1)) =>
          when v_7_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_1));
          when v_8, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
          when v_9_ptr_in_Z, st_4 == ((load_RData 8 (ptr_offset (int_to_ptr v_7_ptr_in_Z) (v_8 * (8))) st_3));
          match ((dictRehash_loop_2 d (int_to_ptr v_9_ptr_in_Z) 0 st_4)) with
          | (Some (d_after_0, de_0_after, v_20, st_5)) =>
            when v_21_ptr_in_Z, st_6 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_5));
            when v_22, st_7 == ((load_RData 4 (ptr_offset d 80) st_6));
            when st_8 == ((store_RData 8 (ptr_offset (int_to_ptr v_21_ptr_in_Z) (v_22 * (8))) (ptr_to_int (mkPtr "null" 0)) st_7));
            when v_23, st_9 == ((load_RData 4 (ptr_offset d 80) st_8));
            when st_10 == ((store_RData 4 (ptr_offset d 80) (v_23 + (1)) st_9));
            (dictRehash_loop_0 d (n_addr_0 + ((-1))) arg_dummy0 st_10)
          | None => None
          end
        | None => None
        end))
    else (Some (d, n_addr_0, 0, st)).

  Definition dictRehash_spec (d: Ptr) (n: Z) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when ret == ((((st.(memory)).(data)) @ ((d.(poffset)) + (80))));
    if (ret <>? ((-1)))
    then (
      match ((dictRehash_loop_0 d n 0 st)) with
      | (Some (d_after, n_addr_0_after, v_24, st_1)) =>
        if (v_24 =? (1))
        then (
          when ret_0 == ((((st_1.(memory)).(data)) @ ((d.(poffset)) + (16))));
          if ((ret_0 - (MEMORY_BASE)) >=? (0))
          then (
            (Some (
              0  ,
              (st_1.[memory].[data] :<
                ((((((((st_1.(memory)).(data)) # (ret_0 - (MEMORY_BASE)) == None) # (((d.(poffset)) + (16)) + (32)) == (Some 0)) #
                  ((((d.(poffset)) + (16)) + (32)) + (8)) ==
                  (Some 0)) #
                  ((((d.(poffset)) + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  ((((d.(poffset)) + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  ((d.(poffset)) + (80)) ==
                  (Some (-1))))
            )))
          else (
            (Some (
              0  ,
              (st_1.[memory].[data] :<
                (((((((st_1.(memory)).(data)) # (((d.(poffset)) + (16)) + (32)) == (Some 0)) # ((((d.(poffset)) + (16)) + (32)) + (8)) == (Some 0)) #
                  ((((d.(poffset)) + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  ((((d.(poffset)) + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  ((d.(poffset)) + (80)) ==
                  (Some (-1))))
            ))))
        else (Some (1, st_1))
      | None => None
      end)
    else (Some (0, st)).

End Layer3_Spec.

#[global] Hint Unfold _dictExpandIfNeeded_spec: spec.
#[global] Hint Unfold dictRehash_loop_1: spec.
#[global] Hint Unfold dictRehash_loop_2: spec.
#[global] Hint Unfold dictRehash_loop_0: spec.
#[global] Hint Unfold dictRehash_spec: spec.
