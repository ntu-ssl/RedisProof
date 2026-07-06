Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer2_dictExpand_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition dictExpand_spec_low (d: Ptr) (size: Z) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when call, st_0 == ((_dictNextPower_spec size st));
    when v_0, st_1 == ((load_RData 4 (ptr_offset d 80) st_0));
    if (v_0 <>? ((-1)))
    then (Some (1, st_1))
    else (
      when v_1, st_2 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st_1));
      if ((v_1 - (size)) >? (0))
      then (Some (1, st_2))
      else (
        when call3, st_3 == ((_dictAlloc_spec (call * (8)) st_2));
        when st_4 == ((llvm_memset_p0i8_i64_spec call3 0 (call * (8)) false st_3));
        when v_4_ptr_in_Z, st_5 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 0) st_4));
        if (ptr_eqb (int_to_ptr v_4_ptr_in_Z) (mkPtr "null" 0))
        then (
          when st_6 == ((store_RData 8 (ptr_offset d 16) (ptr_to_int call3) st_5));
          when st_7 == ((store_RData 8 (ptr_offset d 24) call st_6));
          when st_8 == ((store_RData 8 (ptr_offset d 32) (call - (1)) st_7));
          when st_9 == ((store_RData 8 (ptr_offset d 40) 0 st_8));
          (Some (0, st_9)))
        else (
          when st_6 == ((store_RData 8 (ptr_offset d 48) (ptr_to_int call3) st_5));
          when st_7 == ((store_RData 8 (ptr_offset d 56) call st_6));
          when st_8 == ((store_RData 8 (ptr_offset d 64) (call - (1)) st_7));
          when st_9 == ((store_RData 8 (ptr_offset d 72) 0 st_8));
          when st_10 == ((store_RData 4 (ptr_offset d 80) 0 st_9));
          (Some (0, st_10))))).

End Layer2_dictExpand_LowSpec.

#[global] Hint Unfold dictExpand_spec_low: spec.
