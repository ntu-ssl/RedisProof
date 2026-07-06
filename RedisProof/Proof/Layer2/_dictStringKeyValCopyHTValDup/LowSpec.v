Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2__dictStringKeyValCopyHTValDup_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictStringKeyValCopyHTValDup_spec_low (privdata: Ptr) (val: Ptr) (st: RData) : (option (Ptr * RData)) :=
    when call, st_0 == ((strlen_spec val st));
    when call2, st_1 == ((_dictAlloc_spec (call + (1)) st_0));
    when st_2 == ((llvm_memcpy_p0i8_p0i8_i64_spec call2 val call false st_1));
    when st_3 == ((store_RData 1 (ptr_offset call2 (call * (1))) 0 st_2));
    (Some (call2, st_3)).

End Layer2__dictStringKeyValCopyHTValDup_LowSpec.

#[global] Hint Unfold _dictStringKeyValCopyHTValDup_spec_low: spec.
