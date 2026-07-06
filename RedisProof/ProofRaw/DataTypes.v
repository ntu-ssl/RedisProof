Require Import CommonDeps.

Local Open Scope Z_scope.

Inductive nat: Type :=
 | O 
 | S (pred: nat).


Record Memory :=
  mkMemory {
    offset: Z;
    data: (ZMap.t (option Z));
}.


Record RData :=
  mkRData {
    memory: Memory;
    time: Z;
}.


Definition update_Memory_offset(_a: Memory) _b :=
  mkMemory _b (_a.(data)).
Notation "_a '.[offset]' ':<' _b" := (update_Memory_offset _a _b) (at level 1).

Definition update_Memory_data(_a: Memory) _b :=
  mkMemory (_a.(offset)) _b.
Notation "_a '.[data]' ':<' _b" := (update_Memory_data _a _b) (at level 1).

Definition update_RData_memory(_a: RData) _b :=
  mkRData _b (_a.(time)).
Notation "_a '.[memory]' ':<' _b" := (update_RData_memory _a _b) (at level 1).

Definition update_RData_time(_a: RData) _b :=
  mkRData (_a.(memory)) _b.
Notation "_a '.[time]' ':<' _b" := (update_RData_time _a _b) (at level 1).

Definition update_RData_memory_offset(_a: RData) _b :=
  update_RData_memory _a ((_a.(memory)).[offset] :< _b).
Notation "_a '.[memory].[offset]' ':<' _b" := (update_RData_memory_offset _a _b) (at level 1).

Definition update_RData_memory_data(_a: RData) _b :=
  update_RData_memory _a ((_a.(memory)).[data] :< _b).
Notation "_a '.[memory].[data]' ':<' _b" := (update_RData_memory_data _a _b) (at level 1).

