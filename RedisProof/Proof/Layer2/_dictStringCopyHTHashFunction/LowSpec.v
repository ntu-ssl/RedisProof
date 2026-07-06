Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictStringCopyHTHashFunction_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictStringCopyHTHashFunction_spec_low (key: Ptr) (st: RData) : (option (Z * RData)) :=
    when call, st_0 == ((strlen_spec key st));
    when call1, st_1 == ((dictGenHashFunction_spec key call st_0));
    (Some (call1, st_1)).

End Layer2__dictStringCopyHTHashFunction_LowSpec.

#[global] Hint Unfold _dictStringCopyHTHashFunction_spec_low: spec.
