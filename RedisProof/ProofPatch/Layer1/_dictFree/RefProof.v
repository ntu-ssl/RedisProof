Require Import Bottom.Layer.
Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer1.Layer.
Require Import Layer1.RefineRel.
Require Import Layer1.Spec.
Require Import Layer1._dictFree.LowSpec.
Require Import GlobalDefs.
Require Import LayerSem.Libs.Zutils.div_mod_to_equations.

Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Opaque Z.add Z.mul Z.div Z.sub Z.land Z.lor Z.lxor Z.shiftl Z.shiftr Z.quot Z.rem.

Section DictPrim__dictFree_RefProof.

  Context `{int_ptr: IntPtrCast}.

  Lemma f__dictFree_refine:
    forall v_ptr lst hst hst'
           (Hrel: refrel hst lst)
           (Hspec: _dictFree_spec v_ptr hst = Some hst'),
      exists lst', _dictFree_spec_low v_ptr lst = Some lst' /\ refrel hst' lst'.
    Proof.
      intros; inv Hrel.
      autounfold with spec in *; autounfold with sem in *; simpl in *.
      destruct_spec Hspec; repeat solve_refproof;
        repeat eexists; try unfold refrel; solve_equality.
    Qed.

End DictPrim__dictFree_RefProof.