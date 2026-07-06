Require Import CommonDeps.
Require Import DataTypes.
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
          ("_dictInit", prim _dictInit_spec)
          :: nil
    |}.

End Layer2_Layer.
