Require Import Bottom.Layer.
Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer1.Layer.
Require Import Layer1.RefineRel.
Require Import Layer1.Spec.
Require Import Layer1._dictNextPower.LowSpec.
Require Import GlobalDefs.
Require Import LayerSem.Libs.Zutils.div_mod_to_equations.

Require Import Coq.Program.Wf.
Require Import Coq.ZArith.ZArith.

(* Local Open Scope string_scope. *)
Local Open Scope Z_scope.
Local Opaque Z.add Z.mul Z.div Z.sub Z.land Z.lor Z.lxor Z.shiftl Z.shiftr Z.quot Z.rem.

Section DictPrim__dictNextPower_RefProof.

  Context `{int_ptr: IntPtrCast}.

  Lemma f__dictNextPower_loop_refine:
    forall v_size v_i_0 v_dummy0 v_dummy1 v_size' v_i_0' v_retval_0' v_retval_1' lst hst hst'
           (Hrel: refrel hst lst)
           (Hspec: _dictNextPower_loop_0 v_size v_i_0 v_dummy0 v_dummy1 hst = Some (v_size', v_i_0', v_retval_0', v_retval_1', hst')),
      exists lst', _dictNextPower_loop_0_low v_size v_i_0 v_dummy0 v_dummy1 lst = Some (v_size', v_i_0', v_retval_0', v_retval_1', lst') /\ refrel hst' lst'.
    Proof.
      intros; inv Hrel.
      autounfold with spec in *; autounfold with sem in *; simpl in *.
      destruct_spec Hspec; repeat solve_refproof.
        repeat eexists; try unfold refrel; solve_equality.
    Qed.


  Lemma f__dictNextPower_refine_high:
    forall v_size lst hst hst' res
           (Hrel: refrel hst lst)
           (Hspec: _dictNextPower_spec v_size hst = Some (res, hst')),
      exists lst', _dictNextPower_spec_low v_size lst = Some (res, lst') /\ refrel hst' lst'.
    Proof.
      intros; inv Hrel.
      autounfold with spec in *; autounfold with sem in *; simpl in *.
      destruct_spec Hspec; repeat (solve_refproof; repeat rewrite annotation_eq);
        repeat eexists; try unfold refrel; solve_equality.
    Qed.

End DictPrim__dictNextPower_RefProof.