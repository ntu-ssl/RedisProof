Require Import CommonDeps.
Require Import DataTypes.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Parameter bad_st : RData.

Parameter dictHashKey_fptr_para : Ptr -> (Ptr -> (RData -> Z)).

Parameter dictHashKey_1_fptr_para : Ptr -> (RData -> Z).

Parameter dictCompareHashKeys_fptr_para : Ptr -> (Ptr -> (Ptr -> (Ptr -> (RData -> Z)))).

Section GlobalDefs.

  Context `{int_ptr: IntPtrCast}.

  Definition ptr_offset (_ptr: Ptr) (_offs: Z) : Ptr :=
    (mkPtr (_ptr.(pbase)) ((_ptr.(poffset)) + (_offs))).

  Definition bool_to_int (_b: bool) : Z :=
    if _b
    then 1
    else 0.

  Definition MEMORY_BASE  : Z :=
    1048576.

  Definition BAD_PTR_BASE  : Z :=
    1.

  Definition ptr_eqb (p1: Ptr) (p2: Ptr) : bool :=
    (((p1.(pbase)) =s ((p2.(pbase)))) && (((p1.(poffset)) =? ((p2.(poffset)))))).

  Definition int_to_ptr (v: Z) : Ptr :=
    if (v >=? (MEMORY_BASE))
    then (mkPtr "memory" (v - (MEMORY_BASE)))
    else (mkPtr "null" 0).

  Definition ptr_to_int (p: Ptr) : Z :=
    if ((p.(pbase)) =s ("null"))
    then 0
    else (
      if ((p.(pbase)) =s ("memory"))
      then (MEMORY_BASE + ((p.(poffset))))
      else BAD_PTR_BASE).

  Definition spoq_zext_spec (v_0: bool) : Z :=
    if v_0
    then 1
    else 0.

  Definition PTR_SIZE  : Z :=
    8.

  Definition UNSIGNED_LONG_SIZE  : Z :=
    8.

  Definition load_RData (sz: Z) (p: Ptr) (st: RData) : (option (Z * RData)) :=
    if ((p.(pbase)) =s ("memory"))
    then (
      when ret == ((((st.(memory)).(data)) @ (p.(poffset))));
      (Some (ret, st)))
    else (
      if ((p.(pbase)) =s ("dict_can_resize"))
      then (Some ((st.(dict_can_resize)), st))
      else (Some (0, bad_st))).

  Definition store_RData (sz: Z) (p: Ptr) (v: Z) (st: RData) : (option RData) :=
    if ((p.(pbase)) =s ("memory"))
    then (
      let n_data := (((st.(memory)).(data)) # (p.(poffset)) == (Some v)) in
      (Some (st.[memory].[data] :< n_data)))
    else (
      if ((p.(pbase)) =s ("dict_can_resize"))
      then (Some (st.[dict_can_resize] :< v))
      else (Some bad_st)).

  Definition v_12_1_fptr_dictRehash_spec (v_0: Ptr) (v_1: Ptr) (st: RData) : (option (Z * RData)) :=
    (Some ((dictHashKey_fptr_para v_0 v_1 st), st)).

  Definition v_1_1_fptr__dictKeyIndex_spec (v_0: Ptr) (v_1: Ptr) (st: RData) : (option (Z * RData)) :=
    (Some ((dictHashKey_fptr_para v_0 v_1 st), st)).

End GlobalDefs.

Notation "x <=d y" := (Z_le_dec x y) (at level 70, no associativity) : Z_scope.
Notation "x >=d y" := (Z_ge_dec x y) (at level 70, no associativity) : Z_scope.

Notation "'relyp' P ; F" :=
  (match prop P with
   | left _  => F
   | right _ => None
   end)
  (at level 200, P at level 100, F at level 200).

#[global] Hint Unfold ptr_offset: spec.
#[global] Hint Unfold bool_to_int: spec.
#[global] Hint Unfold MEMORY_BASE: spec.
#[global] Hint Unfold BAD_PTR_BASE: spec.
#[global] Hint Unfold ptr_eqb: spec.
#[global] Hint Unfold int_to_ptr: spec.
#[global] Hint Unfold ptr_to_int: spec.
#[global] Hint Unfold spoq_zext_spec: spec.
#[global] Hint Unfold PTR_SIZE: spec.
#[global] Hint Unfold UNSIGNED_LONG_SIZE: spec.
#[global] Hint Unfold load_RData: spec.
#[global] Hint Unfold store_RData: spec.
#[global] Hint Unfold v_12_1_fptr_dictRehash_spec: spec.
#[global] Hint Unfold v_1_1_fptr__dictKeyIndex_spec: spec.
