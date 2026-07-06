Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer1.Spec.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter Layer1_init: RData.

Section Layer1_Layer.

  Context `{int_ptr: IntPtrCast}.

  Definition Layer1_newframe (fname: string) (st: RData) : option (RData) := None.

  Definition Layer1_alloca (fname: string) (size: Z) (align: Z) (st: RData) : option (Ptr * RData) := None.

  Definition Layer1_free (fname: string) (init_st: RData) (st: RData) : option RData := None.

  Definition Layer1_get_reg (reg: regset) (st: RData) : option Z := None.

  Definition Layer1_set_reg (reg: regset) (val: Z) (st: RData) : option RData := None.

  Definition Layer1_get_flag (f: flag) (st: RData) : bool := false.

  Definition Layer1_set_flag (f: flag) (val: bool) (st: RData) : option RData := None.

  Definition Layer1_ptr_gtb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Layer1_layer :=
    {|
      State := RData;
      Init := Layer1_init;
      Load := ;
      Store := ;
      NewFrame := Layer1_newframe;
      Alloca := Layer1_alloca;
      Free := Layer1_free;
      GetReg :=Layer1_get_reg;
      SetReg := Layer1_set_reg;
      GetFlag := Layer1_get_flag;
      SetFlag := Layer1_set_flag;
      Ptr2Int := ;
      Int2Ptr := ;
      PtrEqb := ;
      PtrLtb := ;
      PtrGtb := Layer1_ptr_gtb;
      PrimCall :=
          ("_dictAlloc", prim _dictAlloc_spec)
          :: ("_dictFree", prim _dictFree_spec)
          :: ("_dictNextPower", prim _dictNextPower_spec)
          :: ("_dictReset", prim _dictReset_spec)
          :: ("dictGenHashFunction", prim dictGenHashFunction_spec)
          :: ("dictIdentityHashFunction", prim dictIdentityHashFunction_spec)
          :: ("dictIntHashFunction", prim dictIntHashFunction_spec)
          :: ("llvm_memcpy_p0i8_p0i8_i64", prim llvm_memcpy_p0i8_p0i8_i64_spec)
          :: ("llvm_memset_p0i8_i64", prim llvm_memset_p0i8_i64_spec)
          :: ("strcmp", prim strcmp_spec)
          :: ("strlen", prim strlen_spec)
          :: nil
    |}.

End Layer1_Layer.
