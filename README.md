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

# Memory Model
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

# Trusted Primitives
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

# Layers
Layer structure of dict.c, leftmost layer is the trusted primitives
(This layer structure is automatically generated, the real layer structure have a few functions manually moved within the middle layers to better match their functionality)
The blue nodes meant to represent top level API functions, i.e., functions that are used by other c files inside redis repository. These nodes are forced to be as right(high in terms of layer heirachy) as possible.
<img width="1345" height="1151" alt="upload_96466392b1f0befd22c4a1bed84528d5" src="https://github.com/user-attachments/assets/706fcd49-35c7-4f30-9e26-809d90373741" />

# Modules
Currently focusing on dictionary module
TODO: organize the c files into multiple modules

# Ranking Functions
TODO: find them all

# Progress
TODO: count number of total functions in redis
