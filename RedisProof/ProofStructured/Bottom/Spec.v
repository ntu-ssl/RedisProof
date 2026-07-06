Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Bottom_Spec.

  Context `{int_ptr: IntPtrCast}.

  Definition abort_spec (st: RData) : (option RData) :=
    (Some st).

  Definition strcmp_spec (p1: Ptr) (p2: Ptr) (st: RData) : (option (Z * RData)) :=
    (Some (0, st)).

  Definition timeInMilliseconds_spec (st: RData) : (option (Z * RData)) :=
    (Some ((st.(time)), (st.[time] :< ((st.(time)) + (10))))).

  Definition printf_spec (p: Ptr) (st: RData) : (option (Z * RData)) :=
    (Some (1, st)).

  Definition _dictAlloc_spec (v_size: Z) (st: RData) : (option (Ptr * RData)) :=
    when offset == (((st.(dicthtStore)).(offset)));
    when n_offset == (((offset + (PTR_SIZE)) + ((UNSIGNED_LONG_SIZE * (3)))));
    when n_data == (
        ((((((st.(dicthtStore)).(data)) # offset == 0) # (offset + (PTR_SIZE)) == 0) # ((offset + (PTR_SIZE)) + (UNSIGNED_LONG_SIZE)) == 0) #
          ((offset + (PTR_SIZE)) + ((UNSIGNED_LONG_SIZE * (2)))) ==
          0));
    (Some ((mkPtr "dictht" ((st.(dicthtStore)).(offset))), ((st.[dicthtStore].[offset] :< n_offset).[dicthtStore].[data] :< n_data))).

End Bottom_Spec.

#[global] Hint Unfold abort_spec: spec.
#[global] Hint Unfold strcmp_spec: spec.
#[global] Hint Unfold timeInMilliseconds_spec: spec.
#[global] Hint Unfold printf_spec: spec.
#[global] Hint Unfold _dictAlloc_spec: spec.
