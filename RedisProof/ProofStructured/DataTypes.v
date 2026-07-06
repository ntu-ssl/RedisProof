Require Import CommonDeps.

Local Open Scope Z_scope.

Inductive nat: Type :=
 | O 
 | S (pred: nat).


Record DictHTStore :=
  mkDictHTStore {
    offset: Z;
    data: (ZMap.t (option Z));
}.


Record RData :=
  mkRData {
    dicthtStore: DictHTStore;
    time: Z;
}.


Definition update_DictHTStore_offset(_a: DictHTStore) _b :=
  mkDictHTStore _b (_a.(data)).
Notation "_a '.[offset]' ':<' _b" := (update_DictHTStore_offset _a _b) (at level 1).

Definition update_DictHTStore_data(_a: DictHTStore) _b :=
  mkDictHTStore (_a.(offset)) _b.
Notation "_a '.[data]' ':<' _b" := (update_DictHTStore_data _a _b) (at level 1).

Definition update_RData_dicthtStore(_a: RData) _b :=
  mkRData _b (_a.(time)).
Notation "_a '.[dicthtStore]' ':<' _b" := (update_RData_dicthtStore _a _b) (at level 1).

Definition update_RData_time(_a: RData) _b :=
  mkRData (_a.(dicthtStore)) _b.
Notation "_a '.[time]' ':<' _b" := (update_RData_time _a _b) (at level 1).

Definition update_RData_dicthtStore_offset(_a: RData) _b :=
  update_RData_dicthtStore _a ((_a.(dicthtStore)).[offset] :< _b).
Notation "_a '.[dicthtStore].[offset]' ':<' _b" := (update_RData_dicthtStore_offset _a _b) (at level 1).

Definition update_RData_dicthtStore_data(_a: RData) _b :=
  update_RData_dicthtStore _a ((_a.(dicthtStore)).[data] :< _b).
Notation "_a '.[dicthtStore].[data]' ':<' _b" := (update_RData_dicthtStore_data _a _b) (at level 1).

