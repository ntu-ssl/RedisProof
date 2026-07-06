Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer3.Spec.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter Layer3_init: RData.

Section Layer3_Layer.

  Context `{int_ptr: IntPtrCast}.

  Definition Layer3_newframe (fname: string) (st: RData) : option (RData) := None.

  Definition Layer3_alloca (fname: string) (size: Z) (align: Z) (st: RData) : option (Ptr * RData) := None.

  Definition Layer3_free (fname: string) (init_st: RData) (st: RData) : option RData := None.

  Definition Layer3_get_reg (reg: regset) (st: RData) : option Z := None.

  Definition Layer3_set_reg (reg: regset) (val: Z) (st: RData) : option RData := None.

  Definition Layer3_get_flag (f: flag) (st: RData) : bool := false.

  Definition Layer3_set_flag (f: flag) (val: bool) (st: RData) : option RData := None.

  Definition Layer3_ptr_gtb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Layer3_layer :=
    {|
      State := RData;
      Init := Layer3_init;
      Load := ;
      Store := ;
      NewFrame := Layer3_newframe;
      Alloca := Layer3_alloca;
      Free := Layer3_free;
      GetReg :=Layer3_get_reg;
      SetReg := Layer3_set_reg;
      GetFlag := Layer3_get_flag;
      SetFlag := Layer3_set_flag;
      Ptr2Int := ;
      Int2Ptr := ;
      PtrEqb := ;
      PtrLtb := ;
      PtrGtb := Layer3_ptr_gtb;
      PrimCall :=
          ("_dictExpandIfNeeded", prim _dictExpandIfNeeded_spec)
          :: ("dictRehash", prim dictRehash_spec)
          :: nil
    |}.

End Layer3_Layer.
