Require Import Code.
Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer1__dictNextPower_LowSpec.

  Context `{int_ptr: IntPtrCast}.

  Fixpoint _dictNextPower_loop_0_low (size: Z) (i_0: Z) (arg_dummy0: Z) (arg_dummy1: Z) (st: RData) : (option (Z * Z * Z * Z * RData)) :=
    if ((i_0 - (size)) >=? (0))
    then (Some (size, i_0, i_0, 0, st))
    else (_dictNextPower_loop_0_low size (i_0 * (2)) arg_dummy0 arg_dummy1 st).

  Definition _dictNextPower_spec_low (size: Z) (st: RData) : (option (Z * RData)) :=
    if (size >=? (9223372036854775807))
    then (Some (9223372036854775807, st))
    else (
      match ((_dictNextPower_loop_0_low size 4 0 0 st)) with
      | (Some (size_after, i_0_after, i_0, v_0, st_0)) => (Some (i_0, st_0))
      | None => None
      end).

End Layer1__dictNextPower_LowSpec.

#[global] Hint Unfold _dictNextPower_loop_0_low: spec.
#[global] Hint Unfold _dictNextPower_spec_low: spec.
