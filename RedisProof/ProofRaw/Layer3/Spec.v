Require Import CommonDeps.
Require Import DataTypes.
Require Import GlobalDefs.

Local Open Scope string_scope.
Local Open Scope Z_scope.

Section Layer3_Spec.

  Context `{int_ptr: IntPtrCast}.

  Definition dictCreate_spec (type: Ptr) (privDataPtr: Ptr) (st: RData) : (option (Ptr * RData)) :=
    let offset := ((st.(memory)).(offset)) in
    if ((type.(pbase)) =s ("null"))
    then (
      if ((privDataPtr.(pbase)) =s ("null"))
      then (
        (Some (
          (mkPtr "memory" offset)  ,
          ((st.[memory].[data] :<
            ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
              ((offset + (16)) + (24)) ==
              (Some 0)) #
              ((offset + (16)) + (32)) ==
              (Some 0)) #
              (((offset + (16)) + (32)) + (8)) ==
              (Some 0)) #
              (((offset + (16)) + (32)) + (16)) ==
              (Some 0)) #
              (((offset + (16)) + (32)) + (24)) ==
              (Some 0)) #
              offset ==
              (Some 0)) #
              (offset + (8)) ==
              (Some 0)) #
              (offset + (80)) ==
              (Some (-1))) #
              (offset + (84)) ==
              (Some 0))).[memory].[offset] :<
            (offset + (88)))
        )))
      else (
        if ((privDataPtr.(pbase)) =s ("memory"))
        then (
          (Some (
            (mkPtr "memory" offset)  ,
            ((st.[memory].[data] :<
              ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                ((offset + (16)) + (24)) ==
                (Some 0)) #
                ((offset + (16)) + (32)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (8)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (16)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (24)) ==
                (Some 0)) #
                offset ==
                (Some 0)) #
                (offset + (8)) ==
                (Some (MEMORY_BASE + ((privDataPtr.(poffset)))))) #
                (offset + (80)) ==
                (Some (-1))) #
                (offset + (84)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (88)))
          )))
        else (
          (Some (
            (mkPtr "memory" offset)  ,
            ((st.[memory].[data] :<
              ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                ((offset + (16)) + (24)) ==
                (Some 0)) #
                ((offset + (16)) + (32)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (8)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (16)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (24)) ==
                (Some 0)) #
                offset ==
                (Some 0)) #
                (offset + (8)) ==
                (Some BAD_PTR_BASE)) #
                (offset + (80)) ==
                (Some (-1))) #
                (offset + (84)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (88)))
          )))))
    else (
      if ((type.(pbase)) =s ("memory"))
      then (
        if ((privDataPtr.(pbase)) =s ("null"))
        then (
          (Some (
            (mkPtr "memory" offset)  ,
            ((st.[memory].[data] :<
              ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                ((offset + (16)) + (24)) ==
                (Some 0)) #
                ((offset + (16)) + (32)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (8)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (16)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (24)) ==
                (Some 0)) #
                offset ==
                (Some (MEMORY_BASE + ((type.(poffset)))))) #
                (offset + (8)) ==
                (Some 0)) #
                (offset + (80)) ==
                (Some (-1))) #
                (offset + (84)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (88)))
          )))
        else (
          if ((privDataPtr.(pbase)) =s ("memory"))
          then (
            (Some (
              (mkPtr "memory" offset)  ,
              ((st.[memory].[data] :<
                ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                  ((offset + (16)) + (24)) ==
                  (Some 0)) #
                  ((offset + (16)) + (32)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (8)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  offset ==
                  (Some (MEMORY_BASE + ((type.(poffset)))))) #
                  (offset + (8)) ==
                  (Some (MEMORY_BASE + ((privDataPtr.(poffset)))))) #
                  (offset + (80)) ==
                  (Some (-1))) #
                  (offset + (84)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + (88)))
            )))
          else (
            (Some (
              (mkPtr "memory" offset)  ,
              ((st.[memory].[data] :<
                ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                  ((offset + (16)) + (24)) ==
                  (Some 0)) #
                  ((offset + (16)) + (32)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (8)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  offset ==
                  (Some (MEMORY_BASE + ((type.(poffset)))))) #
                  (offset + (8)) ==
                  (Some BAD_PTR_BASE)) #
                  (offset + (80)) ==
                  (Some (-1))) #
                  (offset + (84)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + (88)))
            )))))
      else (
        if ((privDataPtr.(pbase)) =s ("null"))
        then (
          (Some (
            (mkPtr "memory" offset)  ,
            ((st.[memory].[data] :<
              ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                ((offset + (16)) + (24)) ==
                (Some 0)) #
                ((offset + (16)) + (32)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (8)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (16)) ==
                (Some 0)) #
                (((offset + (16)) + (32)) + (24)) ==
                (Some 0)) #
                offset ==
                (Some BAD_PTR_BASE)) #
                (offset + (8)) ==
                (Some 0)) #
                (offset + (80)) ==
                (Some (-1))) #
                (offset + (84)) ==
                (Some 0))).[memory].[offset] :<
              (offset + (88)))
          )))
        else (
          if ((privDataPtr.(pbase)) =s ("memory"))
          then (
            (Some (
              (mkPtr "memory" offset)  ,
              ((st.[memory].[data] :<
                ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                  ((offset + (16)) + (24)) ==
                  (Some 0)) #
                  ((offset + (16)) + (32)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (8)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  offset ==
                  (Some BAD_PTR_BASE)) #
                  (offset + (8)) ==
                  (Some (MEMORY_BASE + ((privDataPtr.(poffset)))))) #
                  (offset + (80)) ==
                  (Some (-1))) #
                  (offset + (84)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + (88)))
            )))
          else (
            (Some (
              (mkPtr "memory" offset)  ,
              ((st.[memory].[data] :<
                ((((((((((((((st.(memory)).(data)) # (offset + (16)) == (Some 0)) # ((offset + (16)) + (8)) == (Some 0)) # ((offset + (16)) + (16)) == (Some 0)) #
                  ((offset + (16)) + (24)) ==
                  (Some 0)) #
                  ((offset + (16)) + (32)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (8)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (16)) ==
                  (Some 0)) #
                  (((offset + (16)) + (32)) + (24)) ==
                  (Some 0)) #
                  offset ==
                  (Some BAD_PTR_BASE)) #
                  (offset + (8)) ==
                  (Some BAD_PTR_BASE)) #
                  (offset + (80)) ==
                  (Some (-1))) #
                  (offset + (84)) ==
                  (Some 0))).[memory].[offset] :<
                (offset + (88)))
            )))))).

End Layer3_Spec.

#[global] Hint Unfold dictCreate_spec: spec.
