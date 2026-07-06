Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer3__dictExpandIfNeeded_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictExpandIfNeeded_spec_low (d: Ptr) (st: RData) : (option (Z * RData)) :=
    rely (((d.(pbase)) = ("memory")));
    when v_0, st_0 == ((load_RData 4 (ptr_offset d 80) st));
    if (v_0 <>? ((-1)))
    then (Some (0, st_0))
    else (
      when v_1, st_1 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 8) st_0));
      if (v_1 =? (0))
      then (
        when call, st_2 == ((dictExpand_spec d 4 st_1));
        (Some (call, st_2)))
      else (
        when v_2, st_2 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st_1));
        when v_3, st_3 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 8) st_2));
        if ((v_2 - (v_3)) >=? (0))
        then (
          when v_4, st_4 == ((load_RData 4 (mkPtr "dict_can_resize" 0) st_3));
          if (v_4 <>? (0))
          then (
            when v_5, st_5 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 8) st_4));
            when v_6, st_6 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st_5));
            if ((v_5 - (v_6)) >? (0))
            then (
              when v_7, st_7 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 8) st_6));
              when call24_clone, st_8 == ((dictExpand_spec d (v_7 * (2)) st_7));
              (Some (call24_clone, st_8)))
            else (
              when v_8, st_7 == ((load_RData 8 (ptr_offset (ptr_offset (ptr_offset d 16) 0) 24) st_6));
              when call24, st_8 == ((dictExpand_spec d (v_8 * (2)) st_7));
              (Some (call24, st_8))))
          else (Some (0, st_4)))
        else (Some (0, st_3)))).

End Layer3__dictExpandIfNeeded_LowSpec.

#[global] Hint Unfold _dictExpandIfNeeded_spec_low: spec.
