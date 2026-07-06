Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1_test_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition test_spec_low (st: RData) : (option RData) :=
    when call, st_0 == ((printf_spec (ptr_offset (mkPtr "_str_1" 0) 0) st));
    (Some st_0).

End Layer1_test_LowSpec.

#[global] Hint Unfold test_spec_low: spec.
