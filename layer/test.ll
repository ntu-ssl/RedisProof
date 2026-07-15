; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @test1(i32 noundef %key) #0 !dbg !249 {
entry:
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @test2(metadata i32* %key.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %0 = load i32, i32* %key.addr, align 4, !dbg !252
  ret i32 %0, !dbg !253
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @test2(i32 noundef %key) #0 !dbg !249 {
entry:
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @test1(metadata i32* %key.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %0 = load i32, i32* %key.addr, align 4, !dbg !252
  ret i32 %0, !dbg !253
}
