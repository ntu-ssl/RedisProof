Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer3_dictRehash_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Fixpoint dictRehash_loop_1_low (d: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * RData)) :=
    when v_2_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st));
    when v_3, st_1 == ((load_RData 4 (ptr_offset d 80) st_0));
    when v_4_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_2_ptr_in_Z) (v_3 * (8))) st_1));
    if (ptr_eqb (int_to_ptr v_4_ptr_in_Z) (mkPtr "null" 0))
    then (
      when v_5, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
      when st_4 == ((store_RData 4 (ptr_offset d 80) (v_5 + (1)) st_3));
      (dictRehash_loop_1_low d arg_dummy0 st_4))
    else (Some (d, 0, st_2)).

  Fixpoint dictRehash_loop_2_low (d: Ptr) (de_0: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
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
      (dictRehash_loop_2_low d (int_to_ptr v_10_ptr_in_Z) arg_dummy0 st_14))
    else (Some (d, de_0, 0, st)).

  Fixpoint dictRehash_loop_0_low (d: Ptr) (n_addr_0: Z) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * Z * RData)) :=
    if (n_addr_0 <>? (0))
    then (
      when v_1, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st));
      if (v_1 =? (0))
      then (Some (d, n_addr_0, 1, st_0))
      else (
        match ((dictRehash_loop_1_low d 0 st_0)) with
        | (Some (d_after, v_6, st_1)) =>
          when v_7_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_1));
          when v_8, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
          when v_9_ptr_in_Z, st_4 == ((load_RData 8 (ptr_offset (int_to_ptr v_7_ptr_in_Z) (v_8 * (8))) st_3));
          match ((dictRehash_loop_2_low d (int_to_ptr v_9_ptr_in_Z) 0 st_4)) with
          | (Some (d_after_0, de_0_after, v_20, st_5)) =>
            when v_21_ptr_in_Z, st_6 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_5));
            when v_22, st_7 == ((load_RData 4 (ptr_offset d 80) st_6));
            when st_8 == ((store_RData 8 (ptr_offset (int_to_ptr v_21_ptr_in_Z) (v_22 * (8))) (ptr_to_int (mkPtr "null" 0)) st_7));
            when v_23, st_9 == ((load_RData 4 (ptr_offset d 80) st_8));
            when st_10 == ((store_RData 4 (ptr_offset d 80) (v_23 + (1)) st_9));
            (dictRehash_loop_0_low d (n_addr_0 + ((-1))) arg_dummy0 st_10)
          | None => None
          end
        | None => None
        end))
    else (Some (d, n_addr_0, 0, st)).

  Definition dictRehash_spec_low (d: Ptr) (n: Z) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when v_0, st_0 == ((load_RData 4 (ptr_offset d 80) st));
    if (v_0 <>? ((-1)))
    then (
      match ((dictRehash_loop_0_low d n 0 st_0)) with
      | (Some (d_after, n_addr_0_after, v_24, st_1)) =>
        if (v_24 =? (1))
        then (
          when v_26_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_1));
          when st_3 == ((_dictFree_spec (int_to_ptr v_26_ptr_in_Z) st_2));
          when st_4 == ((llvm_memcpy_p0i8_p0i8_i64_spec (ptr_offset (ptr_offset d 16) 0) (ptr_offset (ptr_offset d 16) 32) 32 false st_3));
          when st_5 == ((_dictReset_spec (ptr_offset (ptr_offset d 16) 32) st_4));
          when st_6 == ((store_RData 4 (ptr_offset d 80) (-1) st_5));
          (Some (0, st_6)))
        else (Some (1, st_1))
      | None => None
      end)
    else (Some (0, st_0)).

End Layer3_dictRehash_LowSpec.

#[global] Hint Unfold dictRehash_loop_1_low: spec.
#[global] Hint Unfold dictRehash_loop_2_low: spec.
#[global] Hint Unfold dictRehash_loop_0_low: spec.
#[global] Hint Unfold dictRehash_spec_low: spec.
