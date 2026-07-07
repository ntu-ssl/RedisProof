# How To Run
I'll assume you have spoq compiled, (if not, there's a binary ./spoq you can use).
- Create docker from github.com/VeriGu/spoq2

- Compile Redis
```shell
# Clone redis and compile custom Redis.c
git clone https://github.com/redis/redis.git
cp RedisProof/Redis.c redis
cd redis

export BUILD_TLS=yes BUILD_WITH_MODULES=yes INSTALL_RUST_TOOLCHAIN=yes DISABLE_WERRORS=yes

clang -c -std=c99 -pedantic -Wall -W -g -ggdb -c -static -emit-llvm -fno-inline-functions -fno-inline -fno-discard-value-names -Wno-return-type -Wno-asm-operand-widths -Wno-int-conversion -Wno-gnu-variable-sized-type-not-at-end -Wno-macro-redefined -Wno-unused-function -Wno-pointer-sign -Wno-typedef-redefinition -Wno-unused-variable -llvm -Wno-implicit-function-declaration -Wno-unused-parameter -Wno-unused-command-line-argument Redis.c -o Redis.bc
```
- Copy compiled result
```shell=
cp Redis.bc ../RedisProof
```

- Generate Proof
```shell=
cd ../RedisProof
../spoq proof.v --llvm 2>&1 | tee log.txt 
```

# Current Proof Details
## Memory Model
Assume an infinitely large linear memory, allocator allocates from memory based on offset
```
Record Memory :=
  mkMemory {
    offset : Z;
    data : ZMap.t (option Z)
  }.
```
Global variables stored directly in RData
```
Record RData :=
  mkRData { 
    memory : Memory;     <- inifnitely large memory
    dict_can_resize : Z  <- global variable
  }.
```

## Trusted Primitives
```
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
```

These functions are treated as trusted primitives. There specification is hand-written and unverified. They mostly consists of native llvm instructions and stdlib functions that are manually translated. Whereas the only functions taken from redis code base are memory allocation functions (so a specification tailored to the custom model can be written) and _dictPanic, which simply prints a warning message (doesn't modify state) and has variable length arguments (can't be transformed by spoq).

## Layers
Layer structure of dict.c, leftmost layer is the trusted primitives
(This layer structure is automatically generated, the real layer structure have a few functions manually moved within the middle layers to better match their functionality)
The blue nodes meant to represent top level API functions, i.e., functions that are used by other c files inside redis repository. These nodes are forced to be as right(high in terms of layer heirachy) as possible.
<img width="1345" height="1151" alt="upload_96466392b1f0befd22c4a1bed84528d5" src="https://github.com/user-attachments/assets/706fcd49-35c7-4f30-9e26-809d90373741" />

## Modules
Currently focusing on dictionary module
TODO: organize the c files into multiple modules

## Ranking Functions
### dict.c
- `_dictNextPower` 
    log2 based ranking function, hard to reason with in proof, maybe find another way to represent it
- `dictRehash` 
    potentially unbounded pointer based loop condition
- `dictFind`
    potentially unbounded pointer based loop condition)
    nested loop problem, explained in more detail in {insert section}
- `dictGenericDelete`
    potentially unbounded pointer based loop condition       nested loop problem
- `dictGetRandomKe`
    potentially unbounded pointer based loop condition
- `dictRehashMilliseconds`
    RData can't really track time, so right now each call to get the time just increments time by 10ms
    potential to use prng to generate a pseudo random delay here but it'll make the loop termination proof unecessarily harder

## Progress
Total: ~20000 Loc
- dict.c/zmalloc.c: 835 Loc
- others: X

# Steps to Writing a Proof
- Create the abstract machine model
    Everything is stored inside a record called `RData`, which is defined in the file DataTypes.v. Access the data through pointer uses the functions `load_RData` and `store_RData` for get and set respectively; they are defined in load_store.v.
    Auxillary functions for pointer operations should be defined according to the machine model; some examples includes `ptr_eqb`, `int_to_ptr`, and `ptr_to_int`. Inspect `proof_rcsm.v` inside spoq2-artifacts for more potential exmaples.
    
- Determine trusted primitivies
    This step requires manual effort and I don't really see a way to automate it. Best I can think of right now is to gather all stdlib functions automatically, but the rest of the code base still need inspection to determine what is suitable to be a trusted primitive.
    Put all your trusted primitives into the section `Bottom` and write spec for them, example:
```c=
    int foo(int n, void * p)
```
translates to
```coq=
    Definition foo_spec (n : Z) (p : Ptr) (st : RData) : option (Z * RData)
```

- Layers
    Seperate the functions into seperate layers, where each layer only calls functions from previous layers. Recursive functions can be somewhat changed to fit this scheme by either rewriting it as a loop or seperating them into different functions for each call depth if the maximum call depth is known. This step can be done automatically (TODO add the auto layer script into repo).
    
- Generate the proof spec
    Compile source c code into a `.bc` file and reference it in `proof.v`
```
Definition PROJ_BC_PATH: string := "./{NameForSourceCode}.bc".
```
run spoq with `--llvm` option enabled and you should see a folder created named `ProofGen`

- Addendum
    1. Use Hint InitRely to auto generate rely conditions for specs, this both eliminates the need to manually insert rely statements and can also help spoq simplify specifications.

# Debugging Spoq Errors

TODO: list potential stuff/hurdles that will occur duting compilation (basically everything I've seen up until now)  
function pointers  
ranking function  
unknown symbol  
unknown function (inspect llvm)  
right now there's a bug within spoq that causes error when it sees a while loop inside a for loop; need to determine the source of this bug
