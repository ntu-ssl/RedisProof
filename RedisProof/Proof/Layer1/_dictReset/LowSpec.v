Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1__dictReset_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictReset_spec_low (ht: Ptr) (st: RData) : (option RData) :=
    when st_0 == ((store_RData 8 (ptr_offset ht 0) (ptr_to_int (mkPtr "null" 0)) st));
    when st_1 == ((store_RData 8 (ptr_offset ht 8) 0 st_0));
    when st_2 == ((store_RData 8 (ptr_offset ht 16) 0 st_1));
    when st_3 == ((store_RData 8 (ptr_offset ht 24) 0 st_2));
    (Some st_3).

End Layer1__dictReset_LowSpec.

#[global] Hint Unfold _dictReset_spec_low: spec.
