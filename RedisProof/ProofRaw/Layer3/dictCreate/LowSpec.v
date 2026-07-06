Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer3_dictCreate_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition dictCreate_spec_low (type: Ptr) (privDataPtr: Ptr) (st: RData) : (option (Ptr * RData)) :=
    when call, st_0 == ((_dictAlloc_spec 88 st));
    when call1, st_1 == ((_dictInit_spec call type privDataPtr st_0));
    (Some (call, st_1)).

End Layer3_dictCreate_LowSpec.

#[global] Hint Unfold dictCreate_spec_low: spec.
