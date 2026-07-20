Definition PROJ_NAME: string := "RedisProof".
Definition PROJ_BASE: string := "./ProofGen".
Definition PROJ_BC_PATH: string := "./Redis.bc".

Definition MEMORY_BASE : Z := 1048576.
Definition BAD_PTR_BASE : Z := (1).

Definition ptr_eqb (p1: Ptr) (p2: Ptr) : bool :=
  (p1.(pbase) =s p2.(pbase)) && (p1.(poffset) =? p2.(poffset)).

Definition int_to_ptr (v: Z) : Ptr :=
    if (v >=? (MEMORY_BASE)) then (
        mkPtr "memory" (v - (MEMORY_BASE))
    ) else
    (mkPtr "null" 0).

Definition ptr_to_int (p: Ptr) : Z :=
    if (p.(pbase) =s "null") then
        0
    else if (p.(pbase) =s "memory") then
        MEMORY_BASE + p.(poffset)
    else
        BAD_PTR_BASE.

Definition spoq_zext_spec (v_0: bool) : Z := (* used to model LLVM zext *)
  if (v_0) then 1 else 0.

Include "datatypes.v".
Include "constant.v".
Include "load_store.v".

(* function pointers *)
Parameter dictHashKey_fptr_para : (Ptr -> (Ptr -> ((RData) -> (Z)))).
Parameter dictHashKey_1_fptr_para : (Ptr -> ((RData) -> (Z))).
Parameter dictCompareHashKeys_fptr_para : (Ptr -> (Ptr -> (Ptr -> (Ptr -> ((RData) -> (Z)))))).

Definition v_12_1_fptr_dictRehash_spec (v_0 : Ptr) (v_1 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((dictHashKey_fptr_para v_0 v_1 st), st).

Definition v_1_1_fptr__dictKeyIndex_spec (v_0 : Ptr) (v_1 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((dictHashKey_fptr_para v_0 v_1 st), st).

(* Definition v_8_3_fptr__dictKeyIndex_spec (v_0 : Ptr) (v_1 : Ptr) (v_2 : Ptr) (v_3 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((dictCompareHashKeys_fptr_para v_0 v_1 v_2 v_3 st), st). *)

(* Parameter v_1_1_fptr__dictKeyIndex_fptr_para : (Ptr -> (Ptr -> ((RData) -> (Z)))).
Definition v_1_1_fptr__dictKeyIndex_spec (v_0 : Ptr) (v_1 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((v_1_1_fptr__dictKeyIndex_fptr_para v_0 v_1 st), st).

Parameter v_8_3_fptr__dictKeyIndex_fptr_para : (Ptr -> (Ptr -> (Ptr -> (Ptr -> ((RData) -> (Z)))))).
Definition v_3_3_fptr__dictKeyIndex_spec (v_0 : Ptr) (v_1 : Ptr) (v_2 : Ptr) (v_3 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((v_8_3_fptr__dictKeyIndex_fptr_para v_0 v_1 v_2 v_3 st), st).

Parameter v_3_1_fptr_dictFind_fptr_para : (Ptr -> (Ptr -> ((RData) -> (Z)))).
Definition v_3_1_fptr_dictFind_spec (v_0 : Ptr) (v_1 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((v_3_1_fptr_dictFind_fptr_para v_0 v_1 st), st).

Parameter v_10_3_fptr_dictFind_fptr_para : (Ptr -> (Ptr -> (Ptr -> (Ptr -> ((RData) -> (Z)))))).
Definition v_10_3_fptr_dictFind_spec (v_0 : Ptr) (v_1 : Ptr) (v_2 : Ptr) (v_3 : Ptr) (st : RData) : option (Z * RData) :=
    Some ((v_10_3_fptr_dictFind_fptr_para v_0 v_1 v_2 v_3 st), st). *)

(* memory stuff/library function *)
Section Bottom.
    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        (* lib *)
        "abort" ::
        "strcmp" ::
        "timeInMilliseconds" ::
        "printf" ::
        "random" ::
        "strlen" ::
        (* llvm *)
        "llvm_memset_p0i8_i64" ::
        "llvm_memcpy_p0i8_p0i8_i64" ::
        (* redis *)
        "zmalloc" ::
        "zfree" ::
        "_dictPanic" ::
        nil.

    Definition abort_spec (st : RData) : option RData := Some st.

    Definition timeInMilliseconds_spec (st : RData) : option (Z * RData) :=
        Some (st.(time), st.[time] :< st.(time) + 10).

    Definition printf_spec (p : Ptr) (st : RData) : option (Z * RData) := Some (1, st).

    Definition zmalloc_spec (v_size : Z) (st : RData) : option (Ptr * RData) :=
        let offset := st.(memory).(offset) in
        Some ((mkPtr "memory" offset), (st.[memory].[offset] :< (offset + v_size))).

    Definition _dictPanic_spec (p: Ptr) (st : RData) : (option RData) := Some st.

    Definition zfree_spec (p : Ptr) (st : RData) : option RData :=
        if p.(pbase) =s "memory" then
            let n_data := st.(memory).(data) # p.(poffset) == None in
            Some (st.[memory].[data] :< n_data)
        else
            Some st.

    Definition random_spec (st : RData) : option (Z * RData) := Some (0, st).

    Definition llvm_memset_p0i8_i64_spec (p : Ptr) (v : Z) (sz : Z) (b : bool) (st : RData) : option (RData) :=
        rely (p.(pbase) = "memory");
        let n_data := st.(memory).(data) # p.(poffset) == Some v in
        Some (st.[memory].[data] :< n_data).

    Definition llvm_memcpy_p0i8_p0i8_i64_spec (dst : Ptr) (src : Ptr) (sz : Z) (b : bool) (st : RData) : option RData :=
        Some st.

    (* string stuff, fix later *)
    Definition strcmp_spec (p1 : Ptr) (p2 : Ptr) (st : RData) : option (Z * RData) := Some (0, st).

    Definition strlen_spec (p : Ptr) (st : RData) : option (Z * RData) := Some (0, st).

    (* debug *)
    Definition _dictExpandIfNeeded_spec (p : Ptr) ( st : RData) : option (Z * RData) := Some (0, st).

End Bottom.

Section Layer1.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "_dictFree" ::
        "_dictAlloc" ::
        "_dictReset" ::
        "_dictNextPower" ::
        (* functions for db struct *)
        "dictIntHashFunction" ::
        "dictIdentityHashFunction" ::
        "dictGenHashFunction" ::
        nil.

    (* Definition _dictNextPower_loop_0_rank (v_i_0: Z) (v_size: Z) : Z :=
        v_size - v_i_0. *)

End Layer1.

(* Section Layer2.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "_dictInit" ::
        "_dictClear" ::
        "dictExpand" ::
        (* functions for db struct *)
        (* "_dictStringCopyHTHashFunction" ::
        "_dictStringCopyHTKeyDup" ::
        "_dictStringKeyValCopyHTValDup" ::
        "_dictStringCopyHTKeyCompare" ::
        "_dictStringCopyHTKeyDestructor" ::
        "_dictStringKeyValCopyHTValDestructor" :: *)
        nil.

    Hint InitRely _dictInit (d.(pbase) = "memory" /\ (type.(pbase) = "memory")).
    Hint InitRely dictExpand (d.(pbase) = "memory").

End Layer2. *)

(* Section Layer3.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "_dictExpandIfNeeded" ::
        "dictRehash" ::
        nil.

    
    Hint InitRely _dictExpandIfNeeded (d.(pbase) = "memory").
    Hint InitRely dictRehash (d.(pbase) = "memory").

End Layer3.

Section Layer4.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "_dictKeyIndex" ::
        "_dictRehashStep" ::
        nil.

    Hint InitRely _dictKeyIndex (d.(pbase) = "memory").
    Hint InitRely _dictRehashStep (d.(pbase) = "memory").

End Layer4. *)

(* Section Layer5.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "dictFind" ::
        "dictAdd" ::
        "dictGenericDelete" ::
        nil.

End Layer5.

Section Layer6.

    Definition LAYER_DATA := RData.
    Definition LAYER_PRIMS: list string :=
        "dictReleaseIterator" ::
        "dictFetchValue" ::
        "dictReplace" ::
        "dictEmpty"::
        "dictGetRandomKey" ::
        "dictDelete" ::
        "dictResize" ::
        "dictCreate" ::
        "dictNext" ::
        "dictRehashMilliseconds" ::
        "dictGetIterator" ::
        "dictDisableResize" ::
        "dictRelease" ::
        "dictDeleteNoFree" ::
        "dictEnableResize" ::
        nil.

End Layer6. *)
