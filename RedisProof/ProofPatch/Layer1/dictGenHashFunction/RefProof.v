Require Import Bottom.Layer.
Require Import Bottom.Spec.
Require Import CommonDeps.
Require Import DataTypes.
Require Import Layer1.Layer.
Require Import Layer1.RefineRel.
Require Import Layer1.Spec.
Require Import Layer1.dictGenHashFunction.LowSpec.
Require Import GlobalDefs.
Require Import LayerSem.Libs.Zutils.div_mod_to_equations.

Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Opaque Z.add Z.mul Z.div Z.sub Z.land Z.lor Z.lxor Z.shiftl Z.shiftr Z.quot Z.rem.

Section DictPrim_dictGenHashFunction_RefProof.

  Context `{int_ptr: IntPtrCast}.

  Lemma f_dictGenHashFunction_refine:
    forall v_buf v_len res lst hst hst'
           (Hrel: refrel hst lst)
           (Hspec: dictGenHashFunction_spec v_buf v_len hst = Some (res, hst')),
      exists lst', dictGenHashFunction_spec_low v_buf v_len lst = Some (res, lst') /\ refrel hst' lst'.
    Proof.
      intros; inv Hrel.
      autounfold with spec in *; autounfold with sem in *; simpl in *.
      destruct_spec Hspec; repeat (solve_refproof; repeat rewrite annotation_eq);
        repeat eexists; try unfold refrel; solve_equality.   
    Qed.

End DictPrim_dictGenHashFunction_RefProof.