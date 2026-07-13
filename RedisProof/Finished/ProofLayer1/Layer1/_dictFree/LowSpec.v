Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1__dictFree_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictFree_spec_low (ptr: Ptr) (st: RData) : (option RData) :=
    when st_0 == ((zfree_spec ptr st));
    (Some st_0).

End Layer1__dictFree_LowSpec.

#[global] Hint Unfold _dictFree_spec_low: spec.
