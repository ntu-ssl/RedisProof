Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1_dictIdentityHashFunction_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition dictIdentityHashFunction_spec_low (key: Z) (st: RData) : (option (Z * RData)) :=
    (Some (key, st)).

End Layer1_dictIdentityHashFunction_LowSpec.

#[global] Hint Unfold dictIdentityHashFunction_spec_low: spec.
