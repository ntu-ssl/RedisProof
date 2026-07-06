Definition abort_spec (st: RData) : (option RData) :=
  (Some st).

Definition strcmp_spec (p1: Ptr) (p2: Ptr) (st: RData) : (option (Z * RData)) :=
  (Some (0, st)).

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
  st.

