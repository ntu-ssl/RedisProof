Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1_Spec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictReset_spec (ht: Ptr) (st: RData) : (option RData) :=
    if ((ht.(pbase)) =s ("dictht"))
    then (
      (Some (st.[dicthtStore].[data] :<
        ((((((st.(dicthtStore)).(data)) # (ht.(poffset)) == (Some 0)) # ((ht.(poffset)) + (8)) == (Some 0)) # ((ht.(poffset)) + (16)) == (Some 0)) #
          ((ht.(poffset)) + (24)) ==
          (Some 0)))))
    else (Some bad_st).

End Layer1_Spec.

#[global] Hint Unfold _dictReset_spec: spec.
