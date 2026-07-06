Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictStringKeyValCopyHTValDestructor_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictStringKeyValCopyHTValDestructor_spec_low (privdata: Ptr) (val: Ptr) (st: RData) : (option RData) :=
    when st_0 == ((_dictFree_spec val st));
    (Some st_0).

End Layer2__dictStringKeyValCopyHTValDestructor_LowSpec.

#[global] Hint Unfold _dictStringKeyValCopyHTValDestructor_spec_low: spec.
