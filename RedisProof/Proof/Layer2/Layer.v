Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer1.Spec.
Require Import Layer2.Spec.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter Layer2_init: RData.

Section Layer2_Layer.

  Context `{int_ptr: IntPtrCast}.

  Definition Layer2_newframe (fname: string) (st: RData) : option (RData) := None.

  Definition Layer2_alloca (fname: string) (size: Z) (align: Z) (st: RData) : option (Ptr * RData) := None.

  Definition Layer2_free (fname: string) (init_st: RData) (st: RData) : option RData := None.

  Definition Layer2_get_reg (reg: regset) (st: RData) : option Z := None.

  Definition Layer2_set_reg (reg: regset) (val: Z) (st: RData) : option RData := None.

  Definition Layer2_get_flag (f: flag) (st: RData) : bool := false.

  Definition Layer2_set_flag (f: flag) (val: bool) (st: RData) : option RData := None.

  Definition Layer2_ptr_gtb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Layer2_layer :=
    {|
      State := RData;
      Init := Layer2_init;
      Load := ;
      Store := ;
      NewFrame := Layer2_newframe;
      Alloca := Layer2_alloca;
      Free := Layer2_free;
      GetReg :=Layer2_get_reg;
      SetReg := Layer2_set_reg;
      GetFlag := Layer2_get_flag;
      SetFlag := Layer2_set_flag;
      Ptr2Int := ;
      Int2Ptr := ;
      PtrEqb := ;
      PtrLtb := ;
      PtrGtb := Layer2_ptr_gtb;
      PrimCall :=
          ("_dictClear", prim _dictClear_spec)
          :: ("_dictFree", prim _dictFree_spec)
          :: ("_dictInit", prim _dictInit_spec)
          :: ("_dictReset", prim _dictReset_spec)
          :: ("_dictStringCopyHTHashFunction", prim _dictStringCopyHTHashFunction_spec)
          :: ("_dictStringCopyHTKeyCompare", prim _dictStringCopyHTKeyCompare_spec)
          :: ("_dictStringCopyHTKeyDestructor", prim _dictStringCopyHTKeyDestructor_spec)
          :: ("_dictStringCopyHTKeyDup", prim _dictStringCopyHTKeyDup_spec)
          :: ("_dictStringKeyValCopyHTValDestructor", prim _dictStringKeyValCopyHTValDestructor_spec)
          :: ("_dictStringKeyValCopyHTValDup", prim _dictStringKeyValCopyHTValDup_spec)
          :: ("dictExpand", prim dictExpand_spec)
          :: ("llvm_memcpy_p0i8_p0i8_i64", prim llvm_memcpy_p0i8_p0i8_i64_spec)
          :: nil
    |}.

End Layer2_Layer.
