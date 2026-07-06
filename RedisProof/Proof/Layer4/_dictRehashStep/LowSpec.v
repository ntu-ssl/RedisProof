Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer4__dictRehashStep_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictRehashStep_spec_low (d: Ptr) (st: RData) : (option RData) :=
    rely (((d.(pbase)) = ("memory")));
    when v_0, st_0 == ((load_RData 4 (ptr_offset d 84) st));
    if (v_0 =? (0))
    then (
      when call, st_1 == ((dictRehash_spec d 1 st_0));
      (Some st_1))
    else (Some st_0).

End Layer4__dictRehashStep_LowSpec.

#[global] Hint Unfold _dictRehashStep_spec_low: spec.
