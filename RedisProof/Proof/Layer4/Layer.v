Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer4.Spec.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter Layer4_init: RData.

Section Layer4_Layer.

  Context `{int_ptr: IntPtrCast}.

  Definition Layer4_newframe (fname: string) (st: RData) : option (RData) := None.

  Definition Layer4_alloca (fname: string) (size: Z) (align: Z) (st: RData) : option (Ptr * RData) := None.

  Definition Layer4_free (fname: string) (init_st: RData) (st: RData) : option RData := None.

  Definition Layer4_get_reg (reg: regset) (st: RData) : option Z := None.

  Definition Layer4_set_reg (reg: regset) (val: Z) (st: RData) : option RData := None.

  Definition Layer4_get_flag (f: flag) (st: RData) : bool := false.

  Definition Layer4_set_flag (f: flag) (val: bool) (st: RData) : option RData := None.

  Definition Layer4_ptr_gtb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Layer4_layer :=
    {|
      State := RData;
      Init := Layer4_init;
      Load := ;
      Store := ;
      NewFrame := Layer4_newframe;
      Alloca := Layer4_alloca;
      Free := Layer4_free;
      GetReg :=Layer4_get_reg;
      SetReg := Layer4_set_reg;
      GetFlag := Layer4_get_flag;
      SetFlag := Layer4_set_flag;
      Ptr2Int := ;
      Int2Ptr := ;
      PtrEqb := ;
      PtrLtb := ;
      PtrGtb := Layer4_ptr_gtb;
      PrimCall :=
          ("_dictKeyIndex", prim _dictKeyIndex_spec)
          :: ("_dictRehashStep", prim _dictRehashStep_spec)
          :: nil
    |}.

End Layer4_Layer.
