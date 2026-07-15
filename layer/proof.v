Section Bottom.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "zfree" ::
        "llvm.memset.p0i8.i64" ::
        "llvm.memcpy.p0i8.p0i8.i64" ::
        "zmalloc" ::
        "puts" ::
        "llvm.lifetime.start.p0i8" ::
        "llvm.lifetime.end.p0i8" ::
        "strlen" ::
        "strcmp" ::
        "timeInMilliseconds" ::
        "abort" ::
        "random" ::
        nil.

End Bottom.

Section External.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=

        nil.

End External.

Section Layer_1.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "_dictFree" ::
        "_dictReset" ::
        "_dictAlloc" ::
        "_dictNextPower" ::
        "_dictPrintStatsHt" ::
        "dictPrintStats" ::
        "dictIdentityHashFunction" ::
        "_dictStringCopyHTKeyCompare" ::
        "test" ::
        "zmalloc_oom" ::
        "dictIntHashFunction" ::
        nil.

End Layer_1.

Section Layer_2.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "dictExpand" ::
        "_dictStringKeyValCopyHTValDestructor" ::
        "_dictInit" ::
        "_dictClear" ::
        "_dictStringCopyHTKeyDup" ::
        "_dictStringCopyHTKeyDestructor" ::
        "_dictStringKeyValCopyHTValDup" ::
        nil.

End Layer_2.

Section Layer_3.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "dictRehash" ::
        "_dictExpandIfNeeded" ::
        nil.

End Layer_3.

Section Layer_4.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "_dictRehashStep" ::
        "_dictKeyIndex" ::
        nil.

End Layer_4.

Section Layer_5.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "dictGenericDelete" ::
        "dictAdd" ::
        "dictGenHashFunction" ::
        "dictFind" ::
        nil.

End Layer_5.

Section Layer_6.
    Definition LAYER_DATA := RData.
    Definition LAYER_CODE: string := "./Redis.json".
    Definition LAYER_LOAD: string := "load_RData".
    Definition LAYER_STORE: string := "store_RData".
    Definition LAYER_ALLOC : string := "alloc".
    Definition LAYER_GET_REG: string := "get_reg_RData".
    Definition LAYER_SET_REG: string := "set_reg_RData".
    Definition LAYER_PRIMS: list string :=
        "dictEnableResize" ::
        "dictDeleteNoFree" ::
        "_dictStringCopyHTHashFunction" ::
        "dictRelease" ::
        "dictDisableResize" ::
        "dictGetIterator" ::
        "dictRehashMilliseconds" ::
        "dictNext" ::
        "dictCreate" ::
        "dictResize" ::
        "dictDelete" ::
        "dictGetRandomKey" ::
        "dictEmpty" ::
        "dictReplace" ::
        "dictFetchValue" ::
        "dictReleaseIterator" ::
        nil.

End Layer_6.

