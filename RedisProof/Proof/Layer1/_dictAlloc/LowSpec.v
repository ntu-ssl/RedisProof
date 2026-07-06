Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1__dictAlloc_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictAlloc_spec_low (size: Z) (st: RData) : (option (Ptr * RData)) :=
    when call, st_0 == ((zmalloc_spec size st));
    if (ptr_eqb call (mkPtr "null" 0))
    then (
      when st_1 == ((_dictPanic_spec (ptr_offset (mkPtr "_str_1" 0) 0) st_0));
      (Some (call, st_1)))
    else (Some (call, st_0)).

End Layer1__dictAlloc_LowSpec.

#[global] Hint Unfold _dictAlloc_spec_low: spec.
