Definition abort_spec (st: RData) : (option RData) :=
  (Some st).

Definition timeInMilliseconds_spec (st: RData) : (option (Z * RData)) :=
  (Some ((st.(time)), (st.[time] :< ((st.(time)) + (10))))).

Definition printf_spec (p: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (1, st)).

Definition zmalloc_spec (v_size: Z) (st: RData) : (option (Ptr * RData)) :=
  let offset := ((st.(memory)).(offset)) in
  (Some ((mkPtr "memory" offset), (st.[memory].[offset] :< (offset + (v_size))))).

Definition _dictPanic_spec (p: Ptr) (st: RData) : (option RData) :=
  (Some st).

Definition zfree_spec (p: Ptr) (st: RData) : (option RData) :=
  if ((p.(pbase)) =s ("memory"))
  then (
    let n_data := (((st.(memory)).(data)) # (p.(poffset)) == None) in
    (Some (st.[memory].[data] :< n_data)))
  else (Some st).

Definition random_spec (st: RData) : (option (Z * RData)) :=
  (Some (0, st)).

Definition llvm_memset_p0i8_i64_spec (p: Ptr) (v: Z) (sz: Z) (b: bool) (st: RData) : (option RData) :=
  rely (((p.(pbase)) = ("memory")));
  let n_data := (((st.(memory)).(data)) # (p.(poffset)) == (Some v)) in
  (Some (st.[memory].[data] :< n_data)).

Definition llvm_memcpy_p0i8_p0i8_i64_spec (dst: Ptr) (src: Ptr) (sz: Z) (b: bool) (st: RData) : (option RData) :=
  (Some st).

Definition strcmp_spec (p1: Ptr) (p2: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (0, st)).

Definition strlen_spec (p: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (0, st)).

Definition _dictExpandIfNeeded_spec (p: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (0, st)).

