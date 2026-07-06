Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictInit_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictInit_spec_low (d: Ptr) (type: Ptr) (privDataPtr: Ptr) (st: RData) : (option (Z * RData)) :=
    rely ((((d.(pbase)) = ("memory")) /\ (((type.(pbase)) = ("memory")))));
    when st_0 == ((_dictReset_spec (ptr_offset (ptr_offset d 16) 0) st));
    when st_1 == ((_dictReset_spec (ptr_offset (ptr_offset d 16) 32) st_0));
    when st_2 == ((store_RData 8 (ptr_offset d 0) (ptr_to_int type) st_1));
    when st_3 == ((store_RData 8 (ptr_offset d 8) (ptr_to_int privDataPtr) st_2));
    when st_4 == ((store_RData 4 (ptr_offset d 80) (-1) st_3));
    when st_5 == ((store_RData 4 (ptr_offset d 84) 0 st_4));
    (Some (0, st_5)).

End Layer2__dictInit_LowSpec.

#[global] Hint Unfold _dictInit_spec_low: spec.
