Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter Bottom_init: RData.

Section Bottom_Layer.

  Context `{int_ptr: IntPtrCast}.

  Definition Bottom_load (size: Z) (p: Ptr) (st: RData) : option (Z * RData) := None.

  Definition Bottom_store (size: Z) (p: Ptr) (val: Z) (st: RData) : option RData := None.

  Definition Bottom_newframe (fname: string) (st: RData) : option (RData) := None.

  Definition Bottom_alloca (fname: string) (size: Z) (align: Z) (st: RData) : option (Ptr * RData) := None.

  Definition Bottom_free (fname: string) (init_st: RData) (st: RData) : option RData := None.

  Definition Bottom_get_reg (reg: regset) (st: RData) : option Z := None.

  Definition Bottom_set_reg (reg: regset) (val: Z) (st: RData) : option RData := None.

  Definition Bottom_get_flag (f: flag) (st: RData) : bool := false.

  Definition Bottom_set_flag (f: flag) (val: bool) (st: RData) : option RData := None.

  Definition Bottom_ptr2int (p: Ptr) : Z := 0.

  Definition Bottom_int2ptr (v: Z) : Ptr := (mkPtr "NULL" 0).

  Definition Bottom_ptr_eqb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Bottom_ptr_ltb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Bottom_ptr_gtb (p1: Ptr) (p2: Ptr) : bool := false.

  Definition Bottom_layer :=
    {|
      State := RData;
      Init := Bottom_init;
      Load := Bottom_load;
      Store := Bottom_store;
      NewFrame := Bottom_newframe;
      Alloca := Bottom_alloca;
      Free := Bottom_free;
      GetReg :=Bottom_get_reg;
      SetReg := Bottom_set_reg;
      GetFlag := Bottom_get_flag;
      SetFlag := Bottom_set_flag;
      Ptr2Int := Bottom_ptr2int;
      Int2Ptr := Bottom_int2ptr;
      PtrEqb := Bottom_ptr_eqb;
      PtrLtb := Bottom_ptr_ltb;
      PtrGtb := Bottom_ptr_gtb;
      PrimCall :=
          ("_dictPanic", prim _dictPanic_spec)
          :: ("abort", prim abort_spec)
          :: ("llvm_memcpy_p0i8_p0i8_i64", prim llvm_memcpy_p0i8_p0i8_i64_spec)
          :: ("llvm_memset_p0i8_i64", prim llvm_memset_p0i8_i64_spec)
          :: ("printf", prim printf_spec)
          :: ("random", prim random_spec)
          :: ("strcmp", prim strcmp_spec)
          :: ("strlen", prim strlen_spec)
          :: ("timeInMilliseconds", prim timeInMilliseconds_spec)
          :: ("zfree", prim zfree_spec)
          :: ("zmalloc", prim zmalloc_spec)
          :: nil
    |}.

End Bottom_Layer.
