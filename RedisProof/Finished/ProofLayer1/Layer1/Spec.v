Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

(* loop fix *)
Require Import Coq.Program.Wf.
Require Import Coq.ZArith.ZArith.

Section Layer1_Spec.

  Context `{int_ptr: IntPtrCast}.

  Definition _dictFree_spec (ptr: Ptr) (st: RData) : (option RData) :=
    if ((ptr.(pbase)) =s ("memory"))
    then (Some (st.[memory].[data] :< (((st.(memory)).(data)) # (ptr.(poffset)) == None)))
    else (Some st).

  Definition _dictAlloc_spec (size: Z) (st: RData) : (option (Ptr * RData)) :=
    let offset := ((st.(memory)).(offset)) in
    (Some ((mkPtr "memory" offset), (st.[memory].[offset] :< (offset + (size))))).

  Definition _dictReset_spec (ht: Ptr) (st: RData) : (option RData) :=
    if ((ht.(pbase)) =s ("memory"))
    then (
      (Some (st.[memory].[data] :<
        ((((((st.(memory)).(data)) # (ht.(poffset)) == (Some 0)) # ((ht.(poffset)) + (8)) == (Some 0)) # ((ht.(poffset)) + (16)) == (Some 0)) #
          ((ht.(poffset)) + (24)) ==
          (Some 0)))))
    else (
      if ((ht.(pbase)) =s ("dict_can_resize"))
      then (Some (st.[dict_can_resize] :< 0))
      else (Some bad_st)).

  (* Fixpoint _dictNextPower_loop_0 (size: Z) (i_0: Z) (arg_dummy0: Z) (arg_dummy1: Z) (st: RData) : (option (Z * Z * Z * Z * RData)) :=
    if ((i_0 - (size)) >=? (0))
    then (Some (size, i_0, i_0, 0, st))
    else (_dictNextPower_loop_0 size (i_0 * (2)) arg_dummy0 arg_dummy1 st). *)

  Program Fixpoint _dictNextPower_loop_0
        (size i_0 arg_dummy0 arg_dummy1 : Z)
        (st : RData)
  {measure (Z.to_nat (size - i_0))}
  : option (Z * Z * Z * Z * RData) :=
    relyp (i_0 > 0);
      match i_0 >=d size with
      | left _   => Some (size, i_0, i_0, 0, st)
      | right Hlt => _dictNextPower_loop_0 size (i_0 * 2) arg_dummy0 arg_dummy1 st
      end.
  Next Obligation.
    (* Goal: Z.to_nat (size - i_0 * 2) < Z.to_nat (size - i_0)
      Context: ~ i_0 <= 0       => i_0 > 0
               ~ i_0 >= size    => i_0 < size  *)
    lia.
  Defined.

  Definition _dictNextPower_spec (size: Z) (st: RData) : (option (Z * RData)) :=
    if (size >=? (9223372036854775807))
    then (Some (9223372036854775807, st))
    else (
      match ((_dictNextPower_loop_0 size 4 0 0 st)) with
      | (Some (size_after, i_0_after, i_0, v_0, st_0)) => (Some (i_0, st_0))
      | None => None
      end).

End Layer1_Spec.

#[global] Hint Unfold _dictFree_spec: spec.
#[global] Hint Unfold _dictAlloc_spec: spec.
#[global] Hint Unfold _dictReset_spec: spec.
#[global] Hint Unfold _dictNextPower_loop_0: spec.
#[global] Hint Unfold _dictNextPower_spec: spec.
