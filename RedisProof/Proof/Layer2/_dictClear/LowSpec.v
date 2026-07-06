Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictClear_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Fixpoint _dictClear_loop_1_low (ht: Ptr) (he_0_dup: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
    if (! (ptr_eqb he_0_dup (mkPtr "null" 0)))
    then (
      when v_4_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset he_0_dup 16) st));
      when st_1 == ((_dictFree_spec he_0_dup st_0));
      when v_6, st_2 == ((load_RData 8 (ptr_offset ht 24) st_1));
      when st_3 == ((store_RData 8 (ptr_offset ht 24) (v_6 + ((-1))) st_2));
      (_dictClear_loop_1_low ht (int_to_ptr v_4_ptr_in_Z) arg_dummy0 st_3))
    else (Some (ht, he_0_dup, 0, st)).

  Fixpoint _dictClear_loop_2_low (ht: Ptr) (he_0: Ptr) (arg_dummy0: Z) (st: RData) : (option (Ptr * Ptr * Z * RData)) :=
    if (! (ptr_eqb he_0 (mkPtr "null" 0)))
    then (
      when v_10_ptr_in_Z, st_0 == ((load_RData 8 (ptr_offset he_0 16) st));
      when st_1 == ((_dictFree_spec he_0 st_0));
      when v_12, st_2 == ((load_RData 8 (ptr_offset ht 24) st_1));
      when st_3 == ((store_RData 8 (ptr_offset ht 24) (v_12 + ((-1))) st_2));
      (_dictClear_loop_2_low ht (int_to_ptr v_10_ptr_in_Z) arg_dummy0 st_3))
    else (Some (ht, he_0, 0, st)).

  Fixpoint _dictClear_loop_0_low (ht: Ptr) (i_0: Z) (arg_dummy0: Z) (st: RData) : (option (Ptr * Z * Z * RData)) :=
    when v_0, st_0 == ((load_RData 8 (ptr_offset ht 8) st));
    if ((i_0 - (v_0)) <? (0))
    then (
      when v_1, st_1 == ((load_RData 8 (ptr_offset ht 24) st_0));
      if (v_1 >? (0))
      then (
        when v_2_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset ht 0) st_1));
        when v_3_ptr_in_Z, st_3 == ((load_RData 8 (ptr_offset (int_to_ptr v_2_ptr_in_Z) (i_0 * (8))) st_2));
        if (ptr_eqb (int_to_ptr v_3_ptr_in_Z) (mkPtr "null" 0))
        then (_dictClear_loop_0_low ht (i_0 + (1)) arg_dummy0 st_3)
        else (
          match ((_dictClear_loop_1_low ht (int_to_ptr v_3_ptr_in_Z) 0 st_3)) with
          | (Some (ht_after, he_0_dup_after, v_7, st_4)) => (_dictClear_loop_0_low ht (i_0 + (1)) arg_dummy0 st_4)
          | None => None
          end))
      else (Some (ht, i_0, 0, st_1)))
    else (Some (ht, i_0, 0, st_0)).

  Definition _dictClear_spec_low (d: Ptr) (ht: Ptr) (st: RData) : (option (Z * RData)) :=
    match ((_dictClear_loop_0_low ht 0 0 st)) with
    | (Some (ht_after, i_0_after, v_14, st_0)) =>
      when v_15_ptr_in_Z, st_1 == ((load_RData 8 (ptr_offset ht 0) st_0));
      when st_2 == ((_dictFree_spec (int_to_ptr v_15_ptr_in_Z) st_1));
      when st_3 == ((_dictReset_spec ht st_2));
      (Some (0, st_3))
    | None => None
    end.

End Layer2__dictClear_LowSpec.

#[global] Hint Unfold _dictClear_loop_1_low: spec.
#[global] Hint Unfold _dictClear_loop_2_low: spec.
#[global] Hint Unfold _dictClear_loop_0_low: spec.
#[global] Hint Unfold _dictClear_spec_low: spec.
