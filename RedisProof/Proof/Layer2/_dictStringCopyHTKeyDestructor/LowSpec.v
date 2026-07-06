Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictStringCopyHTKeyDestructor_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictStringCopyHTKeyDestructor_spec_low (privdata: Ptr) (key: Ptr) (st: RData) : (option RData) :=
    when st_0 == ((_dictFree_spec key st));
    (Some st_0).

End Layer2__dictStringCopyHTKeyDestructor_LowSpec.

#[global] Hint Unfold _dictStringCopyHTKeyDestructor_spec_low: spec.
