Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictStringCopyHTKeyCompare_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictStringCopyHTKeyCompare_spec_low (privdata: Ptr) (key1: Ptr) (key2: Ptr) (st: RData) : (option (Z * RData)) :=
    when call, st_0 == ((strcmp_spec key1 key2 st));
    (Some ((spoq_zext_spec (call =? (0))), st_0)).

End Layer2__dictStringCopyHTKeyCompare_LowSpec.

#[global] Hint Unfold _dictStringCopyHTKeyCompare_spec_low: spec.
