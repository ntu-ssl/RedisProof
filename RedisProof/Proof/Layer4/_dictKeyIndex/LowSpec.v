Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer4__dictKeyIndex_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Fixpoint _dictKeyIndex_loop_0_low (call1: Z) (d: Ptr) (table_0: Z) (arg_dummy0: Z) (st: RData) : (option (Z * Ptr * Z * Z * RData)) :=
    if (table_0 <=? (1))
    then (
      when v_2, st_0 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) (table_0 * (32))) 16) st));
      when v_3_ptr_in_Z, st_1 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) (table_0 * (32))) 0) st_0));
      when v_4_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_3_ptr_in_Z) ((call1 & (v_2)) * (8))) st_1));
      when v_5, st_3 == ((load_RData 4 (ptr_offset d 80) st_2));
      if (v_5 <>? ((-1)))
      then (_dictKeyIndex_loop_0_low call1 d (table_0 + (1)) arg_dummy0 st_3)
      else (Some (call1, d, table_0, 1, st_3)))
    else (Some (call1, d, table_0, 0, st)).

  Definition _dictKeyIndex_spec_low (d: Ptr) (key: Ptr) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when call, st_0 == ((_dictExpandIfNeeded_spec d st));
    if (call =? (1))
    then (Some ((-1), st_0))
    else (
      when v_0_ptr_in_Z, st_1 == ((load_RData 8 (ptr_offset d 0) st_0));
      when v_1_ptr_in_Z, st_2 == ((load_RData 8 (ptr_offset (int_to_ptr v_0_ptr_in_Z) 0) st_1));
      when call1, st_3 == ((v_1_1_fptr__dictKeyIndex_spec (int_to_ptr v_1_ptr_in_Z) key st_2));
      match ((_dictKeyIndex_loop_0_low call1 d 0 0 st_3)) with
      | (Some (call1_after, d_after, table_0_after, v_6, st_4)) =>
        if (v_6 =? (1))
        then (Some (call1, st_4))
        else (Some (call1, st_4))
      | None => None
      end).

End Layer4__dictKeyIndex_LowSpec.

#[global] Hint Unfold _dictKeyIndex_loop_0_low: spec.
#[global] Hint Unfold _dictKeyIndex_spec_low: spec.
