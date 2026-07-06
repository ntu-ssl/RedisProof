Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1_dictGenHashFunction_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Fixpoint dictGenHashFunction_loop_0_low (buf_addr_0: Ptr) (len_addr_0: Z) (hash_0: Z) (arg_dummy0: Z) (arg_dummy1: Z) (st: RData) : (option (Ptr * Z * Z * Z * Z * RData)) :=
    if (len_addr_0 <>? (0))
    then (
      when v_0, st_0 == ((load_RData 1 buf_addr_0 st));
      (dictGenHashFunction_loop_0_low (ptr_offset buf_addr_0 1) (len_addr_0 + ((-1))) (((hash_0 << (5)) + (hash_0)) + (v_0)) arg_dummy0 arg_dummy1 st_0))
    else (Some (buf_addr_0, len_addr_0, hash_0, hash_0, 0, st)).

  Definition dictGenHashFunction_spec_low (buf: Ptr) (len: Z) (st: RData) : (option (Z * RData)) :=
    match ((dictGenHashFunction_loop_0_low buf len 5381 0 0 st)) with
    | (Some (buf_addr_0_after, len_addr_0_after, hash_0_after, hash_0, v_1, st_0)) => (Some (hash_0, st_0))
    | None => None
    end.

End Layer1_dictGenHashFunction_LowSpec.

#[global] Hint Unfold dictGenHashFunction_loop_0_low: spec.
#[global] Hint Unfold dictGenHashFunction_spec_low: spec.
