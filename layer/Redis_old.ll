; ModuleID = 'Redis.c'
source_filename = "Redis.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.dictType = type { i32 (i8*)*, i8* (i8*, i8*)*, i8* (i8*, i8*)*, i32 (i8*, i8*, i8*)*, void (i8*, i8*)*, void (i8*, i8*)* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.dictht = type { %struct.dictEntry**, i64, i64, i64 }
%struct.dictEntry = type { i8*, i8*, %struct.dictEntry* }
%struct.dict = type { %struct.dictType*, i8*, [2 x %struct.dictht], i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.dictIterator = type { %struct.dict*, i32, i32, %struct.dictEntry*, %struct.dictEntry* }

@used_memory = dso_local global i64 0, align 8, !dbg !0
@zmalloc_thread_safe = dso_local global i32 0, align 4, !dbg !16
@used_memory_mutex = dso_local global %union.pthread_mutex_t zeroinitializer, align 8, !dbg !18
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [53 x i8] c"zmalloc: Out of memory trying to allocate %zu bytes\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"asd\00", align 1
@dict_can_resize = dso_local global i32 1, align 4, !dbg !51
@.str.2 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"No stats available for empty dictionaries\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Hash table stats:\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c" table size: %ld\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c" number of elements: %ld\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c" different slots: %ld\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c" max chain length: %ld\0A\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c" avg chain length (counted): %.02f\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c" avg chain length (computed): %.02f\0A\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c" Chain length distribution:\0A\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"   %s%ld: %ld (%.02f%%)\0A\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c">= \00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [26 x i8] c"-- Rehashing into ht[1]:\0A\00", align 1
@dictTypeHeapStringCopyKey = dso_local global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* @_dictStringCopyHTKeyDup, i8* (i8*, i8*)* null, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* null }, align 8, !dbg !53
@dictTypeHeapStrings = dso_local global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* null, i8* (i8*, i8*)* null, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* null }, align 8, !dbg !79
@dictTypeHeapStringCopyKeyValue = dso_local global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* @_dictStringCopyHTKeyDup, i8* (i8*, i8*)* @_dictStringKeyValCopyHTValDup, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* @_dictStringKeyValCopyHTValDestructor }, align 8, !dbg !81
@.str.16 = private unnamed_addr constant [22 x i8] c"\0ADICT LIBRARY PANIC: \00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @zmalloc_oom(i64 noundef %size) #0 !dbg !89 {
entry:
  %size.addr = alloca i64, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !95
  %1 = load i64, i64* %size.addr, align 8, !dbg !96
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @.str, i64 0, i64 0), i64 noundef %1), !dbg !97
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !98
  %call1 = call i32 @fflush(%struct._IO_FILE* noundef %2), !dbg !99
  call void @abort() #9, !dbg !100
  unreachable, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #2

declare dso_local i32 @fflush(%struct._IO_FILE* noundef) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @zmalloc(i64 noundef %size) #0 !dbg !101 {
entry:
  %size.addr = alloca i64, align 8
  %ptr = alloca i8*, align 8
  %_n = alloca i64, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i64, i64* %size.addr, align 8, !dbg !108
  %add = add i64 %0, 8, !dbg !109
  %call = call noalias i8* @malloc(i64 noundef %add) #10, !dbg !110
  store i8* %call, i8** %ptr, align 8, !dbg !107
  %1 = load i8*, i8** %ptr, align 8, !dbg !111
  %tobool = icmp ne i8* %1, null, !dbg !111
  br i1 %tobool, label %if.end, label %if.then, !dbg !113

if.then:                                          ; preds = %entry
  %2 = load i64, i64* %size.addr, align 8, !dbg !114
  call void @zmalloc_oom(i64 noundef %2), !dbg !115
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, i64* %size.addr, align 8, !dbg !116
  %4 = load i8*, i8** %ptr, align 8, !dbg !117
  %5 = bitcast i8* %4 to i64*, !dbg !118
  store i64 %3, i64* %5, align 8, !dbg !119
  br label %do.body, !dbg !120

do.body:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %_n, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = load i64, i64* %size.addr, align 8, !dbg !123
  %add1 = add i64 %6, 8, !dbg !123
  store i64 %add1, i64* %_n, align 8, !dbg !123
  %7 = load i64, i64* %_n, align 8, !dbg !124
  %and = and i64 %7, 7, !dbg !124
  %tobool2 = icmp ne i64 %and, 0, !dbg !124
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !123

if.then3:                                         ; preds = %do.body
  %8 = load i64, i64* %_n, align 8, !dbg !124
  %and4 = and i64 %8, 7, !dbg !124
  %sub = sub i64 8, %and4, !dbg !124
  %9 = load i64, i64* %_n, align 8, !dbg !124
  %add5 = add i64 %9, %sub, !dbg !124
  store i64 %add5, i64* %_n, align 8, !dbg !124
  br label %if.end6, !dbg !124

if.end6:                                          ; preds = %if.then3, %do.body
  %10 = load i32, i32* @zmalloc_thread_safe, align 4, !dbg !126
  %tobool7 = icmp ne i32 %10, 0, !dbg !126
  br i1 %tobool7, label %if.then8, label %if.else, !dbg !123

if.then8:                                         ; preds = %if.end6
  %call9 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef @used_memory_mutex) #10, !dbg !128
  %11 = load i64, i64* %_n, align 8, !dbg !128
  %12 = load i64, i64* @used_memory, align 8, !dbg !128
  %add10 = add i64 %12, %11, !dbg !128
  store i64 %add10, i64* @used_memory, align 8, !dbg !128
  %call11 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef @used_memory_mutex) #10, !dbg !128
  br label %if.end13, !dbg !128

if.else:                                          ; preds = %if.end6
  %13 = load i64, i64* %_n, align 8, !dbg !130
  %14 = load i64, i64* @used_memory, align 8, !dbg !130
  %add12 = add i64 %14, %13, !dbg !130
  store i64 %add12, i64* @used_memory, align 8, !dbg !130
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then8
  br label %do.end, !dbg !123

do.end:                                           ; preds = %if.end13
  %15 = load i8*, i8** %ptr, align 8, !dbg !132
  %add.ptr = getelementptr inbounds i8, i8* %15, i64 8, !dbg !133
  ret i8* %add.ptr, !dbg !134
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64 noundef) #4

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef) #4

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @zfree(i8* noundef %ptr) #0 !dbg !135 {
entry:
  %ptr.addr = alloca i8*, align 8
  %realptr = alloca i8*, align 8
  %oldsize = alloca i64, align 8
  %_n = alloca i64, align 8
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i8** %realptr, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %oldsize, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i8*, i8** %ptr.addr, align 8, !dbg !144
  %cmp = icmp eq i8* %0, null, !dbg !146
  br i1 %cmp, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %entry
  br label %return, !dbg !148

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %ptr.addr, align 8, !dbg !149
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 -8, !dbg !150
  store i8* %add.ptr, i8** %realptr, align 8, !dbg !151
  %2 = load i8*, i8** %realptr, align 8, !dbg !152
  %3 = bitcast i8* %2 to i64*, !dbg !153
  %4 = load i64, i64* %3, align 8, !dbg !154
  store i64 %4, i64* %oldsize, align 8, !dbg !155
  br label %do.body, !dbg !156

do.body:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %_n, metadata !157, metadata !DIExpression()), !dbg !159
  %5 = load i64, i64* %oldsize, align 8, !dbg !159
  %add = add i64 %5, 8, !dbg !159
  store i64 %add, i64* %_n, align 8, !dbg !159
  %6 = load i64, i64* %_n, align 8, !dbg !160
  %and = and i64 %6, 7, !dbg !160
  %tobool = icmp ne i64 %and, 0, !dbg !160
  br i1 %tobool, label %if.then1, label %if.end4, !dbg !159

if.then1:                                         ; preds = %do.body
  %7 = load i64, i64* %_n, align 8, !dbg !160
  %and2 = and i64 %7, 7, !dbg !160
  %sub = sub i64 8, %and2, !dbg !160
  %8 = load i64, i64* %_n, align 8, !dbg !160
  %add3 = add i64 %8, %sub, !dbg !160
  store i64 %add3, i64* %_n, align 8, !dbg !160
  br label %if.end4, !dbg !160

if.end4:                                          ; preds = %if.then1, %do.body
  %9 = load i32, i32* @zmalloc_thread_safe, align 4, !dbg !162
  %tobool5 = icmp ne i32 %9, 0, !dbg !162
  br i1 %tobool5, label %if.then6, label %if.else, !dbg !159

if.then6:                                         ; preds = %if.end4
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef @used_memory_mutex) #10, !dbg !164
  %10 = load i64, i64* %_n, align 8, !dbg !164
  %11 = load i64, i64* @used_memory, align 8, !dbg !164
  %sub7 = sub i64 %11, %10, !dbg !164
  store i64 %sub7, i64* @used_memory, align 8, !dbg !164
  %call8 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef @used_memory_mutex) #10, !dbg !164
  br label %if.end10, !dbg !164

if.else:                                          ; preds = %if.end4
  %12 = load i64, i64* %_n, align 8, !dbg !166
  %13 = load i64, i64* @used_memory, align 8, !dbg !166
  %sub9 = sub i64 %13, %12, !dbg !166
  store i64 %sub9, i64* @used_memory, align 8, !dbg !166
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then6
  br label %do.end, !dbg !159

do.end:                                           ; preds = %if.end10
  %14 = load i8*, i8** %realptr, align 8, !dbg !168
  call void @free(i8* noundef %14) #10, !dbg !169
  br label %return, !dbg !170

return:                                           ; preds = %do.end, %if.then
  ret void, !dbg !170
}

; Function Attrs: nounwind
declare dso_local void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test() #0 !dbg !171 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !174
  ret void, !dbg !175
}

declare dso_local i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_dictAlloc(i64 noundef %size) #0 !dbg !176 {
entry:
  %size.addr = alloca i64, align 8
  %p = alloca i8*, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i8** %p, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = load i64, i64* %size.addr, align 8, !dbg !181
  %call = call i8* @zmalloc(i64 noundef %0), !dbg !182
  store i8* %call, i8** %p, align 8, !dbg !180
  %1 = load i8*, i8** %p, align 8, !dbg !183
  %cmp = icmp eq i8* %1, null, !dbg !185
  br i1 %cmp, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  call void (i8*, ...) @_dictPanic(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)), !dbg !187
  br label %if.end, !dbg !187

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %p, align 8, !dbg !188
  ret i8* %2, !dbg !189
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_dictPanic(i8* noundef %fmt, ...) #0 !dbg !190 {
entry:
  %fmt.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %fmt, i8** %fmt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fmt.addr, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %ap, metadata !197, metadata !DIExpression()), !dbg !211
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !212
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !212
  call void @llvm.va_start(i8* %arraydecay1), !dbg !212
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !213
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0)), !dbg !214
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !215
  %2 = load i8*, i8** %fmt.addr, align 8, !dbg !216
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !217
  %call3 = call i32 @vfprintf(%struct._IO_FILE* noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef %arraydecay2), !dbg !218
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !219
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %3, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i64 0, i64 0)), !dbg !220
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !221
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*, !dbg !221
  call void @llvm.va_end(i8* %arraydecay56), !dbg !221
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictFree(i8* noundef %ptr) #0 !dbg !223 {
entry:
  %ptr.addr = alloca i8*, align 8
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i8*, i8** %ptr.addr, align 8, !dbg !226
  call void @zfree(i8* noundef %0), !dbg !227
  ret void, !dbg !228
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictIntHashFunction(i32 noundef %key) #0 !dbg !229 {
entry:
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %key.addr, metadata !232, metadata !DIExpression()), !dbg !233
  %0 = load i32, i32* %key.addr, align 4, !dbg !234
  %shl = shl i32 %0, 15, !dbg !234
  %or = or i32 %shl, -1, !dbg !234
  %1 = load i32, i32* %key.addr, align 4, !dbg !234
  %shl1 = shl i32 %1, 15, !dbg !234
  %and = and i32 %shl1, -1, !dbg !234
  %sub = sub i32 %or, %and, !dbg !234
  %2 = load i32, i32* %key.addr, align 4, !dbg !235
  %add = add i32 %2, %sub, !dbg !235
  store i32 %add, i32* %key.addr, align 4, !dbg !235
  %3 = load i32, i32* %key.addr, align 4, !dbg !236
  %4 = load i32, i32* %key.addr, align 4, !dbg !236
  %shr = lshr i32 %4, 10, !dbg !236
  %or2 = or i32 %3, %shr, !dbg !236
  %5 = load i32, i32* %key.addr, align 4, !dbg !236
  %6 = load i32, i32* %key.addr, align 4, !dbg !236
  %shr3 = lshr i32 %6, 10, !dbg !236
  %and4 = and i32 %5, %shr3, !dbg !236
  %sub5 = sub i32 %or2, %and4, !dbg !236
  store i32 %sub5, i32* %key.addr, align 4, !dbg !237
  %7 = load i32, i32* %key.addr, align 4, !dbg !238
  %shl6 = shl i32 %7, 3, !dbg !239
  %8 = load i32, i32* %key.addr, align 4, !dbg !240
  %add7 = add i32 %8, %shl6, !dbg !240
  store i32 %add7, i32* %key.addr, align 4, !dbg !240
  %9 = load i32, i32* %key.addr, align 4, !dbg !241
  %10 = load i32, i32* %key.addr, align 4, !dbg !241
  %shr8 = lshr i32 %10, 6, !dbg !241
  %or9 = or i32 %9, %shr8, !dbg !241
  %11 = load i32, i32* %key.addr, align 4, !dbg !241
  %12 = load i32, i32* %key.addr, align 4, !dbg !241
  %shr10 = lshr i32 %12, 6, !dbg !241
  %and11 = and i32 %11, %shr10, !dbg !241
  %sub12 = sub i32 %or9, %and11, !dbg !241
  store i32 %sub12, i32* %key.addr, align 4, !dbg !242
  %13 = load i32, i32* %key.addr, align 4, !dbg !243
  %shl13 = shl i32 %13, 11, !dbg !243
  %or14 = or i32 %shl13, -1, !dbg !243
  %14 = load i32, i32* %key.addr, align 4, !dbg !243
  %shl15 = shl i32 %14, 11, !dbg !243
  %and16 = and i32 %shl15, -1, !dbg !243
  %sub17 = sub i32 %or14, %and16, !dbg !243
  %15 = load i32, i32* %key.addr, align 4, !dbg !244
  %add18 = add i32 %15, %sub17, !dbg !244
  store i32 %add18, i32* %key.addr, align 4, !dbg !244
  %16 = load i32, i32* %key.addr, align 4, !dbg !245
  %17 = load i32, i32* %key.addr, align 4, !dbg !245
  %shr19 = lshr i32 %17, 16, !dbg !245
  %or20 = or i32 %16, %shr19, !dbg !245
  %18 = load i32, i32* %key.addr, align 4, !dbg !245
  %19 = load i32, i32* %key.addr, align 4, !dbg !245
  %shr21 = lshr i32 %19, 16, !dbg !245
  %and22 = and i32 %18, %shr21, !dbg !245
  %sub23 = sub i32 %or20, %and22, !dbg !245
  store i32 %sub23, i32* %key.addr, align 4, !dbg !246
  %20 = load i32, i32* %key.addr, align 4, !dbg !247
  ret i32 %20, !dbg !248
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictIdentityHashFunction(i32 noundef %key) #0 !dbg !249 {
entry:
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %key.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %0 = load i32, i32* %key.addr, align 4, !dbg !252
  ret i32 %0, !dbg !253
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictGenHashFunction(i8* noundef %buf, i32 noundef %len) #0 !dbg !254 {
entry:
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %hash = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %hash, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 5381, i32* %hash, align 4, !dbg !265
  br label %while.cond, !dbg !266

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %len.addr, align 4, !dbg !267
  %dec = add nsw i32 %0, -1, !dbg !267
  store i32 %dec, i32* %len.addr, align 4, !dbg !267
  %tobool = icmp ne i32 %0, 0, !dbg !266
  br i1 %tobool, label %while.body, label %while.end, !dbg !266

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %hash, align 4, !dbg !268
  %shl = shl i32 %1, 5, !dbg !269
  %2 = load i32, i32* %hash, align 4, !dbg !270
  %add = add i32 %shl, %2, !dbg !271
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !272
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !272
  store i8* %incdec.ptr, i8** %buf.addr, align 8, !dbg !272
  %4 = load i8, i8* %3, align 1, !dbg !273
  %conv = zext i8 %4 to i32, !dbg !274
  %add1 = add i32 %add, %conv, !dbg !275
  store i32 %add1, i32* %hash, align 4, !dbg !276
  br label %while.cond, !dbg !266, !llvm.loop !277

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %hash, align 4, !dbg !279
  ret i32 %5, !dbg !280
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictReset(%struct.dictht* noundef %ht) #0 !dbg !281 {
entry:
  %ht.addr = alloca %struct.dictht*, align 8
  store %struct.dictht* %ht, %struct.dictht** %ht.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictht** %ht.addr, metadata !301, metadata !DIExpression()), !dbg !302
  %0 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !303
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %0, i32 0, i32 0, !dbg !304
  store %struct.dictEntry** null, %struct.dictEntry*** %table, align 8, !dbg !305
  %1 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !306
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %1, i32 0, i32 1, !dbg !307
  store i64 0, i64* %size, align 8, !dbg !308
  %2 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !309
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %2, i32 0, i32 2, !dbg !310
  store i64 0, i64* %sizemask, align 8, !dbg !311
  %3 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !312
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %3, i32 0, i32 3, !dbg !313
  store i64 0, i64* %used, align 8, !dbg !314
  ret void, !dbg !315
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.dict* @dictCreate(%struct.dictType* noundef %type, i8* noundef %privDataPtr) #0 !dbg !316 {
entry:
  %type.addr = alloca %struct.dictType*, align 8
  %privDataPtr.addr = alloca i8*, align 8
  %d = alloca %struct.dict*, align 8
  store %struct.dictType* %type, %struct.dictType** %type.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictType** %type.addr, metadata !332, metadata !DIExpression()), !dbg !333
  store i8* %privDataPtr, i8** %privDataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privDataPtr.addr, metadata !334, metadata !DIExpression()), !dbg !335
  call void @llvm.dbg.declare(metadata %struct.dict** %d, metadata !336, metadata !DIExpression()), !dbg !337
  %call = call i8* @_dictAlloc(i64 noundef 88), !dbg !338
  %0 = bitcast i8* %call to %struct.dict*, !dbg !338
  store %struct.dict* %0, %struct.dict** %d, align 8, !dbg !337
  %1 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !339
  %2 = load %struct.dictType*, %struct.dictType** %type.addr, align 8, !dbg !340
  %3 = load i8*, i8** %privDataPtr.addr, align 8, !dbg !341
  %call1 = call i32 @_dictInit(%struct.dict* noundef %1, %struct.dictType* noundef %2, i8* noundef %3), !dbg !342
  %4 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !343
  ret %struct.dict* %4, !dbg !344
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictInit(%struct.dict* noundef %d, %struct.dictType* noundef %type, i8* noundef %privDataPtr) #0 !dbg !345 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  %type.addr = alloca %struct.dictType*, align 8
  %privDataPtr.addr = alloca i8*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !348, metadata !DIExpression()), !dbg !349
  store %struct.dictType* %type, %struct.dictType** %type.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictType** %type.addr, metadata !350, metadata !DIExpression()), !dbg !351
  store i8* %privDataPtr, i8** %privDataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privDataPtr.addr, metadata !352, metadata !DIExpression()), !dbg !353
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !354
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 2, !dbg !355
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !354
  call void @_dictReset(%struct.dictht* noundef %arrayidx), !dbg !356
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !357
  %ht1 = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 2, !dbg !358
  %arrayidx2 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht1, i64 0, i64 1, !dbg !357
  call void @_dictReset(%struct.dictht* noundef %arrayidx2), !dbg !359
  %2 = load %struct.dictType*, %struct.dictType** %type.addr, align 8, !dbg !360
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !361
  %type3 = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 0, !dbg !362
  store %struct.dictType* %2, %struct.dictType** %type3, align 8, !dbg !363
  %4 = load i8*, i8** %privDataPtr.addr, align 8, !dbg !364
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !365
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 1, !dbg !366
  store i8* %4, i8** %privdata, align 8, !dbg !367
  %6 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !368
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %6, i32 0, i32 3, !dbg !369
  store i32 -1, i32* %rehashidx, align 8, !dbg !370
  %7 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !371
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %7, i32 0, i32 4, !dbg !372
  store i32 0, i32* %iterators, align 4, !dbg !373
  ret i32 0, !dbg !374
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictResize(%struct.dict* noundef %d) #0 !dbg !375 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %minimal = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata i32* %minimal, metadata !380, metadata !DIExpression()), !dbg !381
  %0 = load i32, i32* @dict_can_resize, align 4, !dbg !382
  %tobool = icmp ne i32 %0, 0, !dbg !382
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !384

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !385
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 3, !dbg !385
  %2 = load i32, i32* %rehashidx, align 8, !dbg !385
  %cmp = icmp ne i32 %2, -1, !dbg !385
  br i1 %cmp, label %if.then, label %if.end, !dbg !386

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4, !dbg !387
  br label %return, !dbg !387

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !388
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !389
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !388
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 3, !dbg !390
  %4 = load i64, i64* %used, align 8, !dbg !390
  %conv = trunc i64 %4 to i32, !dbg !388
  store i32 %conv, i32* %minimal, align 4, !dbg !391
  %5 = load i32, i32* %minimal, align 4, !dbg !392
  %cmp1 = icmp slt i32 %5, 4, !dbg !394
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !395

if.then3:                                         ; preds = %if.end
  store i32 4, i32* %minimal, align 4, !dbg !396
  br label %if.end4, !dbg !397

if.end4:                                          ; preds = %if.then3, %if.end
  %6 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !398
  %7 = load i32, i32* %minimal, align 4, !dbg !399
  %conv5 = sext i32 %7 to i64, !dbg !399
  %call = call i32 @dictExpand(%struct.dict* noundef %6, i64 noundef %conv5), !dbg !400
  store i32 %call, i32* %retval, align 4, !dbg !401
  br label %return, !dbg !401

return:                                           ; preds = %if.end4, %if.then
  %8 = load i32, i32* %retval, align 4, !dbg !402
  ret i32 %8, !dbg !402
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictExpand(%struct.dict* noundef %d, i64 noundef %size) #0 !dbg !403 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %size.addr = alloca i64, align 8
  %n = alloca %struct.dictht, align 8
  %realsize = alloca i64, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !406, metadata !DIExpression()), !dbg !407
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !408, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.declare(metadata %struct.dictht* %n, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i64* %realsize, metadata !412, metadata !DIExpression()), !dbg !413
  %0 = load i64, i64* %size.addr, align 8, !dbg !414
  %call = call i64 @_dictNextPower(i64 noundef %0), !dbg !415
  store i64 %call, i64* %realsize, align 8, !dbg !413
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !416
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 3, !dbg !416
  %2 = load i32, i32* %rehashidx, align 8, !dbg !416
  %cmp = icmp ne i32 %2, -1, !dbg !416
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !418

lor.lhs.false:                                    ; preds = %entry
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !419
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !420
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !419
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 3, !dbg !421
  %4 = load i64, i64* %used, align 8, !dbg !421
  %5 = load i64, i64* %size.addr, align 8, !dbg !422
  %cmp1 = icmp ugt i64 %4, %5, !dbg !423
  br i1 %cmp1, label %if.then, label %if.end, !dbg !424

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4, !dbg !425
  br label %return, !dbg !425

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i64, i64* %realsize, align 8, !dbg !426
  %size2 = getelementptr inbounds %struct.dictht, %struct.dictht* %n, i32 0, i32 1, !dbg !427
  store i64 %6, i64* %size2, align 8, !dbg !428
  %7 = load i64, i64* %realsize, align 8, !dbg !429
  %sub = sub i64 %7, 1, !dbg !430
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %n, i32 0, i32 2, !dbg !431
  store i64 %sub, i64* %sizemask, align 8, !dbg !432
  %8 = load i64, i64* %realsize, align 8, !dbg !433
  %mul = mul i64 %8, 8, !dbg !434
  %call3 = call i8* @_dictAlloc(i64 noundef %mul), !dbg !435
  %9 = bitcast i8* %call3 to %struct.dictEntry**, !dbg !435
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %n, i32 0, i32 0, !dbg !436
  store %struct.dictEntry** %9, %struct.dictEntry*** %table, align 8, !dbg !437
  %used4 = getelementptr inbounds %struct.dictht, %struct.dictht* %n, i32 0, i32 3, !dbg !438
  store i64 0, i64* %used4, align 8, !dbg !439
  %table5 = getelementptr inbounds %struct.dictht, %struct.dictht* %n, i32 0, i32 0, !dbg !440
  %10 = load %struct.dictEntry**, %struct.dictEntry*** %table5, align 8, !dbg !440
  %11 = bitcast %struct.dictEntry** %10 to i8*, !dbg !441
  %12 = load i64, i64* %realsize, align 8, !dbg !442
  %mul6 = mul i64 %12, 8, !dbg !443
  call void @llvm.memset.p0i8.i64(i8* align 8 %11, i8 0, i64 %mul6, i1 false), !dbg !441
  %13 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !444
  %ht7 = getelementptr inbounds %struct.dict, %struct.dict* %13, i32 0, i32 2, !dbg !446
  %arrayidx8 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht7, i64 0, i64 0, !dbg !444
  %table9 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx8, i32 0, i32 0, !dbg !447
  %14 = load %struct.dictEntry**, %struct.dictEntry*** %table9, align 8, !dbg !447
  %cmp10 = icmp eq %struct.dictEntry** %14, null, !dbg !448
  br i1 %cmp10, label %if.then11, label %if.end14, !dbg !449

if.then11:                                        ; preds = %if.end
  %15 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !450
  %ht12 = getelementptr inbounds %struct.dict, %struct.dict* %15, i32 0, i32 2, !dbg !452
  %arrayidx13 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht12, i64 0, i64 0, !dbg !450
  %16 = bitcast %struct.dictht* %arrayidx13 to i8*, !dbg !453
  %17 = bitcast %struct.dictht* %n to i8*, !dbg !453
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %16, i8* align 8 %17, i64 32, i1 false), !dbg !453
  store i32 0, i32* %retval, align 4, !dbg !454
  br label %return, !dbg !454

if.end14:                                         ; preds = %if.end
  %18 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !455
  %ht15 = getelementptr inbounds %struct.dict, %struct.dict* %18, i32 0, i32 2, !dbg !456
  %arrayidx16 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht15, i64 0, i64 1, !dbg !455
  %19 = bitcast %struct.dictht* %arrayidx16 to i8*, !dbg !457
  %20 = bitcast %struct.dictht* %n to i8*, !dbg !457
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %19, i8* align 8 %20, i64 32, i1 false), !dbg !457
  %21 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !458
  %rehashidx17 = getelementptr inbounds %struct.dict, %struct.dict* %21, i32 0, i32 3, !dbg !459
  store i32 0, i32* %rehashidx17, align 8, !dbg !460
  store i32 0, i32* %retval, align 4, !dbg !461
  br label %return, !dbg !461

return:                                           ; preds = %if.end14, %if.then11, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !462
  ret i32 %22, !dbg !462
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_dictNextPower(i64 noundef %size) #0 !dbg !463 {
entry:
  %retval = alloca i64, align 8
  %size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata i64* %i, metadata !468, metadata !DIExpression()), !dbg !469
  store i64 4, i64* %i, align 8, !dbg !469
  %0 = load i64, i64* %size.addr, align 8, !dbg !470
  %cmp = icmp uge i64 %0, 9223372036854775807, !dbg !472
  br i1 %cmp, label %if.then, label %if.end, !dbg !473

if.then:                                          ; preds = %entry
  store i64 9223372036854775807, i64* %retval, align 8, !dbg !474
  br label %return, !dbg !474

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !475

while.body:                                       ; preds = %if.end, %if.end3
  %1 = load i64, i64* %i, align 8, !dbg !476
  %2 = load i64, i64* %size.addr, align 8, !dbg !479
  %cmp1 = icmp uge i64 %1, %2, !dbg !480
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !481

if.then2:                                         ; preds = %while.body
  %3 = load i64, i64* %i, align 8, !dbg !482
  store i64 %3, i64* %retval, align 8, !dbg !483
  br label %return, !dbg !483

if.end3:                                          ; preds = %while.body
  %4 = load i64, i64* %i, align 8, !dbg !484
  %mul = mul i64 %4, 2, !dbg !484
  store i64 %mul, i64* %i, align 8, !dbg !484
  br label %while.body, !dbg !475, !llvm.loop !485

return:                                           ; preds = %if.then2, %if.then
  %5 = load i64, i64* %retval, align 8, !dbg !487
  ret i64 %5, !dbg !487
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictRehash(%struct.dict* noundef %d, i32 noundef %n) #0 !dbg !488 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %n.addr = alloca i32, align 4
  %de = alloca %struct.dictEntry*, align 8
  %nextde = alloca %struct.dictEntry*, align 8
  %h = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !491, metadata !DIExpression()), !dbg !492
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !493, metadata !DIExpression()), !dbg !494
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !495
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 3, !dbg !495
  %1 = load i32, i32* %rehashidx, align 8, !dbg !495
  %cmp = icmp ne i32 %1, -1, !dbg !495
  br i1 %cmp, label %if.end, label %if.then, !dbg !497

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !498
  br label %return, !dbg !498

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !499

while.cond:                                       ; preds = %while.end53, %if.end
  %2 = load i32, i32* %n.addr, align 4, !dbg !500
  %dec = add nsw i32 %2, -1, !dbg !500
  store i32 %dec, i32* %n.addr, align 4, !dbg !500
  %tobool = icmp ne i32 %2, 0, !dbg !499
  br i1 %tobool, label %while.body, label %while.end62, !dbg !499

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %de, metadata !501, metadata !DIExpression()), !dbg !503
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %nextde, metadata !504, metadata !DIExpression()), !dbg !505
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !506
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !508
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !506
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 3, !dbg !509
  %4 = load i64, i64* %used, align 8, !dbg !509
  %cmp1 = icmp eq i64 %4, 0, !dbg !510
  br i1 %cmp1, label %if.then2, label %if.end12, !dbg !511

if.then2:                                         ; preds = %while.body
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !512
  %ht3 = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 2, !dbg !514
  %arrayidx4 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht3, i64 0, i64 0, !dbg !512
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx4, i32 0, i32 0, !dbg !515
  %6 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !515
  %7 = bitcast %struct.dictEntry** %6 to i8*, !dbg !512
  call void @_dictFree(i8* noundef %7), !dbg !516
  %8 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !517
  %ht5 = getelementptr inbounds %struct.dict, %struct.dict* %8, i32 0, i32 2, !dbg !518
  %arrayidx6 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht5, i64 0, i64 0, !dbg !517
  %9 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !519
  %ht7 = getelementptr inbounds %struct.dict, %struct.dict* %9, i32 0, i32 2, !dbg !520
  %arrayidx8 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht7, i64 0, i64 1, !dbg !519
  %10 = bitcast %struct.dictht* %arrayidx6 to i8*, !dbg !519
  %11 = bitcast %struct.dictht* %arrayidx8 to i8*, !dbg !519
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 8 %11, i64 32, i1 false), !dbg !519
  %12 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !521
  %ht9 = getelementptr inbounds %struct.dict, %struct.dict* %12, i32 0, i32 2, !dbg !522
  %arrayidx10 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht9, i64 0, i64 1, !dbg !521
  call void @_dictReset(%struct.dictht* noundef %arrayidx10), !dbg !523
  %13 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !524
  %rehashidx11 = getelementptr inbounds %struct.dict, %struct.dict* %13, i32 0, i32 3, !dbg !525
  store i32 -1, i32* %rehashidx11, align 8, !dbg !526
  store i32 0, i32* %retval, align 4, !dbg !527
  br label %return, !dbg !527

if.end12:                                         ; preds = %while.body
  br label %while.cond13, !dbg !528

while.cond13:                                     ; preds = %while.body20, %if.end12
  %14 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !529
  %ht14 = getelementptr inbounds %struct.dict, %struct.dict* %14, i32 0, i32 2, !dbg !530
  %arrayidx15 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht14, i64 0, i64 0, !dbg !529
  %table16 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx15, i32 0, i32 0, !dbg !531
  %15 = load %struct.dictEntry**, %struct.dictEntry*** %table16, align 8, !dbg !531
  %16 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !532
  %rehashidx17 = getelementptr inbounds %struct.dict, %struct.dict* %16, i32 0, i32 3, !dbg !533
  %17 = load i32, i32* %rehashidx17, align 8, !dbg !533
  %idxprom = sext i32 %17 to i64, !dbg !529
  %arrayidx18 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %15, i64 %idxprom, !dbg !529
  %18 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx18, align 8, !dbg !529
  %cmp19 = icmp eq %struct.dictEntry* %18, null, !dbg !534
  br i1 %cmp19, label %while.body20, label %while.end, !dbg !528

while.body20:                                     ; preds = %while.cond13
  %19 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !535
  %rehashidx21 = getelementptr inbounds %struct.dict, %struct.dict* %19, i32 0, i32 3, !dbg !536
  %20 = load i32, i32* %rehashidx21, align 8, !dbg !537
  %inc = add nsw i32 %20, 1, !dbg !537
  store i32 %inc, i32* %rehashidx21, align 8, !dbg !537
  br label %while.cond13, !dbg !528, !llvm.loop !538

while.end:                                        ; preds = %while.cond13
  %21 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !539
  %ht22 = getelementptr inbounds %struct.dict, %struct.dict* %21, i32 0, i32 2, !dbg !540
  %arrayidx23 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht22, i64 0, i64 0, !dbg !539
  %table24 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx23, i32 0, i32 0, !dbg !541
  %22 = load %struct.dictEntry**, %struct.dictEntry*** %table24, align 8, !dbg !541
  %23 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !542
  %rehashidx25 = getelementptr inbounds %struct.dict, %struct.dict* %23, i32 0, i32 3, !dbg !543
  %24 = load i32, i32* %rehashidx25, align 8, !dbg !543
  %idxprom26 = sext i32 %24 to i64, !dbg !539
  %arrayidx27 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %22, i64 %idxprom26, !dbg !539
  %25 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx27, align 8, !dbg !539
  store %struct.dictEntry* %25, %struct.dictEntry** %de, align 8, !dbg !544
  br label %while.cond28, !dbg !545

while.cond28:                                     ; preds = %while.body30, %while.end
  %26 = load %struct.dictEntry*, %struct.dictEntry** %de, align 8, !dbg !546
  %tobool29 = icmp ne %struct.dictEntry* %26, null, !dbg !545
  br i1 %tobool29, label %while.body30, label %while.end53, !dbg !545

while.body30:                                     ; preds = %while.cond28
  call void @llvm.dbg.declare(metadata i32* %h, metadata !547, metadata !DIExpression()), !dbg !549
  %27 = load %struct.dictEntry*, %struct.dictEntry** %de, align 8, !dbg !550
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %27, i32 0, i32 2, !dbg !551
  %28 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !551
  store %struct.dictEntry* %28, %struct.dictEntry** %nextde, align 8, !dbg !552
  %29 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !553
  %type = getelementptr inbounds %struct.dict, %struct.dict* %29, i32 0, i32 0, !dbg !553
  %30 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !553
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %30, i32 0, i32 0, !dbg !553
  %31 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !553
  %32 = load %struct.dictEntry*, %struct.dictEntry** %de, align 8, !dbg !553
  %key = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %32, i32 0, i32 0, !dbg !553
  %33 = load i8*, i8** %key, align 8, !dbg !553
  %call = call i32 %31(i8* noundef %33), !dbg !553
  %conv = zext i32 %call to i64, !dbg !553
  %34 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !554
  %ht31 = getelementptr inbounds %struct.dict, %struct.dict* %34, i32 0, i32 2, !dbg !555
  %arrayidx32 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht31, i64 0, i64 1, !dbg !554
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx32, i32 0, i32 2, !dbg !556
  %35 = load i64, i64* %sizemask, align 8, !dbg !556
  %and = and i64 %conv, %35, !dbg !557
  %conv33 = trunc i64 %and to i32, !dbg !553
  store i32 %conv33, i32* %h, align 4, !dbg !558
  %36 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !559
  %ht34 = getelementptr inbounds %struct.dict, %struct.dict* %36, i32 0, i32 2, !dbg !560
  %arrayidx35 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht34, i64 0, i64 1, !dbg !559
  %table36 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx35, i32 0, i32 0, !dbg !561
  %37 = load %struct.dictEntry**, %struct.dictEntry*** %table36, align 8, !dbg !561
  %38 = load i32, i32* %h, align 4, !dbg !562
  %idxprom37 = zext i32 %38 to i64, !dbg !559
  %arrayidx38 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %37, i64 %idxprom37, !dbg !559
  %39 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx38, align 8, !dbg !559
  %40 = load %struct.dictEntry*, %struct.dictEntry** %de, align 8, !dbg !563
  %next39 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %40, i32 0, i32 2, !dbg !564
  store %struct.dictEntry* %39, %struct.dictEntry** %next39, align 8, !dbg !565
  %41 = load %struct.dictEntry*, %struct.dictEntry** %de, align 8, !dbg !566
  %42 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !567
  %ht40 = getelementptr inbounds %struct.dict, %struct.dict* %42, i32 0, i32 2, !dbg !568
  %arrayidx41 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht40, i64 0, i64 1, !dbg !567
  %table42 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx41, i32 0, i32 0, !dbg !569
  %43 = load %struct.dictEntry**, %struct.dictEntry*** %table42, align 8, !dbg !569
  %44 = load i32, i32* %h, align 4, !dbg !570
  %idxprom43 = zext i32 %44 to i64, !dbg !567
  %arrayidx44 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %43, i64 %idxprom43, !dbg !567
  store %struct.dictEntry* %41, %struct.dictEntry** %arrayidx44, align 8, !dbg !571
  %45 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !572
  %ht45 = getelementptr inbounds %struct.dict, %struct.dict* %45, i32 0, i32 2, !dbg !573
  %arrayidx46 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht45, i64 0, i64 0, !dbg !572
  %used47 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx46, i32 0, i32 3, !dbg !574
  %46 = load i64, i64* %used47, align 8, !dbg !575
  %dec48 = add i64 %46, -1, !dbg !575
  store i64 %dec48, i64* %used47, align 8, !dbg !575
  %47 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !576
  %ht49 = getelementptr inbounds %struct.dict, %struct.dict* %47, i32 0, i32 2, !dbg !577
  %arrayidx50 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht49, i64 0, i64 1, !dbg !576
  %used51 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx50, i32 0, i32 3, !dbg !578
  %48 = load i64, i64* %used51, align 8, !dbg !579
  %inc52 = add i64 %48, 1, !dbg !579
  store i64 %inc52, i64* %used51, align 8, !dbg !579
  %49 = load %struct.dictEntry*, %struct.dictEntry** %nextde, align 8, !dbg !580
  store %struct.dictEntry* %49, %struct.dictEntry** %de, align 8, !dbg !581
  br label %while.cond28, !dbg !545, !llvm.loop !582

while.end53:                                      ; preds = %while.cond28
  %50 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !584
  %ht54 = getelementptr inbounds %struct.dict, %struct.dict* %50, i32 0, i32 2, !dbg !585
  %arrayidx55 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht54, i64 0, i64 0, !dbg !584
  %table56 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx55, i32 0, i32 0, !dbg !586
  %51 = load %struct.dictEntry**, %struct.dictEntry*** %table56, align 8, !dbg !586
  %52 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !587
  %rehashidx57 = getelementptr inbounds %struct.dict, %struct.dict* %52, i32 0, i32 3, !dbg !588
  %53 = load i32, i32* %rehashidx57, align 8, !dbg !588
  %idxprom58 = sext i32 %53 to i64, !dbg !584
  %arrayidx59 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %51, i64 %idxprom58, !dbg !584
  store %struct.dictEntry* null, %struct.dictEntry** %arrayidx59, align 8, !dbg !589
  %54 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !590
  %rehashidx60 = getelementptr inbounds %struct.dict, %struct.dict* %54, i32 0, i32 3, !dbg !591
  %55 = load i32, i32* %rehashidx60, align 8, !dbg !592
  %inc61 = add nsw i32 %55, 1, !dbg !592
  store i32 %inc61, i32* %rehashidx60, align 8, !dbg !592
  br label %while.cond, !dbg !499, !llvm.loop !593

while.end62:                                      ; preds = %while.cond
  store i32 1, i32* %retval, align 4, !dbg !595
  br label %return, !dbg !595

return:                                           ; preds = %while.end62, %if.then2, %if.then
  %56 = load i32, i32* %retval, align 4, !dbg !596
  ret i32 %56, !dbg !596
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @timeInMilliseconds() #0 !dbg !597 {
entry:
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !600, metadata !DIExpression()), !dbg !609
  %call = call i32 @gettimeofday(%struct.timeval* noundef %tv, i8* noundef null) #10, !dbg !610
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !611
  %0 = load i64, i64* %tv_sec, align 8, !dbg !611
  %mul = mul nsw i64 %0, 1000, !dbg !612
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1, !dbg !613
  %1 = load i64, i64* %tv_usec, align 8, !dbg !613
  %div = sdiv i64 %1, 1000, !dbg !614
  %add = add nsw i64 %mul, %div, !dbg !615
  ret i64 %add, !dbg !616
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval* noundef, i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictRehashMilliseconds(%struct.dict* noundef %d, i32 noundef %ms) #0 !dbg !617 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  %ms.addr = alloca i32, align 4
  %start = alloca i64, align 8
  %rehashes = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 %ms, i32* %ms.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ms.addr, metadata !620, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.declare(metadata i64* %start, metadata !622, metadata !DIExpression()), !dbg !623
  %call = call i64 @timeInMilliseconds(), !dbg !624
  store i64 %call, i64* %start, align 8, !dbg !623
  call void @llvm.dbg.declare(metadata i32* %rehashes, metadata !625, metadata !DIExpression()), !dbg !626
  store i32 0, i32* %rehashes, align 4, !dbg !626
  br label %while.cond, !dbg !627

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !628
  %call1 = call i32 @dictRehash(%struct.dict* noundef %0, i32 noundef 100), !dbg !629
  %tobool = icmp ne i32 %call1, 0, !dbg !627
  br i1 %tobool, label %while.body, label %while.end, !dbg !627

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %rehashes, align 4, !dbg !630
  %add = add nsw i32 %1, 100, !dbg !630
  store i32 %add, i32* %rehashes, align 4, !dbg !630
  %call2 = call i64 @timeInMilliseconds(), !dbg !632
  %2 = load i64, i64* %start, align 8, !dbg !634
  %sub = sub nsw i64 %call2, %2, !dbg !635
  %3 = load i32, i32* %ms.addr, align 4, !dbg !636
  %conv = sext i32 %3 to i64, !dbg !636
  %cmp = icmp sgt i64 %sub, %conv, !dbg !637
  br i1 %cmp, label %if.then, label %if.end, !dbg !638

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !639

if.end:                                           ; preds = %while.body
  br label %while.cond, !dbg !627, !llvm.loop !640

while.end:                                        ; preds = %if.then, %while.cond
  %4 = load i32, i32* %rehashes, align 4, !dbg !642
  ret i32 %4, !dbg !643
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictRehashStep(%struct.dict* noundef %d) #0 !dbg !644 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !647, metadata !DIExpression()), !dbg !648
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !649
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 4, !dbg !651
  %1 = load i32, i32* %iterators, align 4, !dbg !651
  %cmp = icmp eq i32 %1, 0, !dbg !652
  br i1 %cmp, label %if.then, label %if.end, !dbg !653

if.then:                                          ; preds = %entry
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !654
  %call = call i32 @dictRehash(%struct.dict* noundef %2, i32 noundef 1), !dbg !655
  br label %if.end, !dbg !655

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !656
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictAdd(%struct.dict* noundef %d, i8* noundef %key, i8* noundef %val) #0 !dbg !657 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %index = alloca i32, align 4
  %entry1 = alloca %struct.dictEntry*, align 8
  %ht = alloca %struct.dictht*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !660, metadata !DIExpression()), !dbg !661
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !662, metadata !DIExpression()), !dbg !663
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !664, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.declare(metadata i32* %index, metadata !666, metadata !DIExpression()), !dbg !667
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %entry1, metadata !668, metadata !DIExpression()), !dbg !669
  call void @llvm.dbg.declare(metadata %struct.dictht** %ht, metadata !670, metadata !DIExpression()), !dbg !671
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !672
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 3, !dbg !672
  %1 = load i32, i32* %rehashidx, align 8, !dbg !672
  %cmp = icmp ne i32 %1, -1, !dbg !672
  br i1 %cmp, label %if.then, label %if.end, !dbg !674

if.then:                                          ; preds = %entry
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !675
  call void @_dictRehashStep(%struct.dict* noundef %2), !dbg !676
  br label %if.end, !dbg !676

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !677
  %4 = load i8*, i8** %key.addr, align 8, !dbg !679
  %call = call i32 @_dictKeyIndex(%struct.dict* noundef %3, i8* noundef %4), !dbg !680
  store i32 %call, i32* %index, align 4, !dbg !681
  %cmp2 = icmp eq i32 %call, -1, !dbg !682
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !683

if.then3:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !684
  br label %return, !dbg !684

if.end4:                                          ; preds = %if.end
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !685
  %rehashidx5 = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 3, !dbg !685
  %6 = load i32, i32* %rehashidx5, align 8, !dbg !685
  %cmp6 = icmp ne i32 %6, -1, !dbg !685
  br i1 %cmp6, label %cond.true, label %cond.false, !dbg !685

cond.true:                                        ; preds = %if.end4
  %7 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !686
  %ht7 = getelementptr inbounds %struct.dict, %struct.dict* %7, i32 0, i32 2, !dbg !687
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht7, i64 0, i64 1, !dbg !686
  br label %cond.end, !dbg !685

cond.false:                                       ; preds = %if.end4
  %8 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !688
  %ht8 = getelementptr inbounds %struct.dict, %struct.dict* %8, i32 0, i32 2, !dbg !689
  %arrayidx9 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht8, i64 0, i64 0, !dbg !688
  br label %cond.end, !dbg !685

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.dictht* [ %arrayidx, %cond.true ], [ %arrayidx9, %cond.false ], !dbg !685
  store %struct.dictht* %cond, %struct.dictht** %ht, align 8, !dbg !690
  %call10 = call i8* @_dictAlloc(i64 noundef 24), !dbg !691
  %9 = bitcast i8* %call10 to %struct.dictEntry*, !dbg !691
  store %struct.dictEntry* %9, %struct.dictEntry** %entry1, align 8, !dbg !692
  %10 = load %struct.dictht*, %struct.dictht** %ht, align 8, !dbg !693
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %10, i32 0, i32 0, !dbg !694
  %11 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !694
  %12 = load i32, i32* %index, align 4, !dbg !695
  %idxprom = sext i32 %12 to i64, !dbg !693
  %arrayidx11 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %11, i64 %idxprom, !dbg !693
  %13 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx11, align 8, !dbg !693
  %14 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !696
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %14, i32 0, i32 2, !dbg !697
  store %struct.dictEntry* %13, %struct.dictEntry** %next, align 8, !dbg !698
  %15 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !699
  %16 = load %struct.dictht*, %struct.dictht** %ht, align 8, !dbg !700
  %table12 = getelementptr inbounds %struct.dictht, %struct.dictht* %16, i32 0, i32 0, !dbg !701
  %17 = load %struct.dictEntry**, %struct.dictEntry*** %table12, align 8, !dbg !701
  %18 = load i32, i32* %index, align 4, !dbg !702
  %idxprom13 = sext i32 %18 to i64, !dbg !700
  %arrayidx14 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %17, i64 %idxprom13, !dbg !700
  store %struct.dictEntry* %15, %struct.dictEntry** %arrayidx14, align 8, !dbg !703
  %19 = load %struct.dictht*, %struct.dictht** %ht, align 8, !dbg !704
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %19, i32 0, i32 3, !dbg !705
  %20 = load i64, i64* %used, align 8, !dbg !706
  %inc = add i64 %20, 1, !dbg !706
  store i64 %inc, i64* %used, align 8, !dbg !706
  br label %do.body, !dbg !707

do.body:                                          ; preds = %cond.end
  %21 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !708
  %type = getelementptr inbounds %struct.dict, %struct.dict* %21, i32 0, i32 0, !dbg !708
  %22 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !708
  %keyDup = getelementptr inbounds %struct.dictType, %struct.dictType* %22, i32 0, i32 1, !dbg !708
  %23 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %keyDup, align 8, !dbg !708
  %tobool = icmp ne i8* (i8*, i8*)* %23, null, !dbg !708
  br i1 %tobool, label %if.then15, label %if.else, !dbg !711

if.then15:                                        ; preds = %do.body
  %24 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !708
  %type16 = getelementptr inbounds %struct.dict, %struct.dict* %24, i32 0, i32 0, !dbg !708
  %25 = load %struct.dictType*, %struct.dictType** %type16, align 8, !dbg !708
  %keyDup17 = getelementptr inbounds %struct.dictType, %struct.dictType* %25, i32 0, i32 1, !dbg !708
  %26 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %keyDup17, align 8, !dbg !708
  %27 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !708
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %27, i32 0, i32 1, !dbg !708
  %28 = load i8*, i8** %privdata, align 8, !dbg !708
  %29 = load i8*, i8** %key.addr, align 8, !dbg !708
  %call18 = call i8* %26(i8* noundef %28, i8* noundef %29), !dbg !708
  %30 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !708
  %key19 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %30, i32 0, i32 0, !dbg !708
  store i8* %call18, i8** %key19, align 8, !dbg !708
  br label %if.end21, !dbg !708

if.else:                                          ; preds = %do.body
  %31 = load i8*, i8** %key.addr, align 8, !dbg !708
  %32 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !708
  %key20 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %32, i32 0, i32 0, !dbg !708
  store i8* %31, i8** %key20, align 8, !dbg !708
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then15
  br label %do.end, !dbg !711

do.end:                                           ; preds = %if.end21
  br label %do.body22, !dbg !712

do.body22:                                        ; preds = %do.end
  %33 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !713
  %type23 = getelementptr inbounds %struct.dict, %struct.dict* %33, i32 0, i32 0, !dbg !713
  %34 = load %struct.dictType*, %struct.dictType** %type23, align 8, !dbg !713
  %valDup = getelementptr inbounds %struct.dictType, %struct.dictType* %34, i32 0, i32 2, !dbg !713
  %35 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup, align 8, !dbg !713
  %tobool24 = icmp ne i8* (i8*, i8*)* %35, null, !dbg !713
  br i1 %tobool24, label %if.then25, label %if.else31, !dbg !716

if.then25:                                        ; preds = %do.body22
  %36 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !713
  %type26 = getelementptr inbounds %struct.dict, %struct.dict* %36, i32 0, i32 0, !dbg !713
  %37 = load %struct.dictType*, %struct.dictType** %type26, align 8, !dbg !713
  %valDup27 = getelementptr inbounds %struct.dictType, %struct.dictType* %37, i32 0, i32 2, !dbg !713
  %38 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup27, align 8, !dbg !713
  %39 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !713
  %privdata28 = getelementptr inbounds %struct.dict, %struct.dict* %39, i32 0, i32 1, !dbg !713
  %40 = load i8*, i8** %privdata28, align 8, !dbg !713
  %41 = load i8*, i8** %val.addr, align 8, !dbg !713
  %call29 = call i8* %38(i8* noundef %40, i8* noundef %41), !dbg !713
  %42 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !713
  %val30 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %42, i32 0, i32 1, !dbg !713
  store i8* %call29, i8** %val30, align 8, !dbg !713
  br label %if.end33, !dbg !713

if.else31:                                        ; preds = %do.body22
  %43 = load i8*, i8** %val.addr, align 8, !dbg !713
  %44 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !713
  %val32 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %44, i32 0, i32 1, !dbg !713
  store i8* %43, i8** %val32, align 8, !dbg !713
  br label %if.end33

if.end33:                                         ; preds = %if.else31, %if.then25
  br label %do.end34, !dbg !716

do.end34:                                         ; preds = %if.end33
  store i32 0, i32* %retval, align 4, !dbg !717
  br label %return, !dbg !717

return:                                           ; preds = %do.end34, %if.then3
  %45 = load i32, i32* %retval, align 4, !dbg !718
  ret i32 %45, !dbg !718
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictKeyIndex(%struct.dict* noundef %d, i8* noundef %key) #0 !dbg !719 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %h = alloca i32, align 4
  %idx = alloca i32, align 4
  %table = alloca i32, align 4
  %he = alloca %struct.dictEntry*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !722, metadata !DIExpression()), !dbg !723
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !724, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.declare(metadata i32* %h, metadata !726, metadata !DIExpression()), !dbg !727
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !728, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.declare(metadata i32* %table, metadata !730, metadata !DIExpression()), !dbg !731
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !732, metadata !DIExpression()), !dbg !733
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !734
  %call = call i32 @_dictExpandIfNeeded(%struct.dict* noundef %0), !dbg !736
  %cmp = icmp eq i32 %call, 1, !dbg !737
  br i1 %cmp, label %if.then, label %if.end, !dbg !738

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !739
  br label %return, !dbg !739

if.end:                                           ; preds = %entry
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !740
  %type = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 0, !dbg !740
  %2 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !740
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %2, i32 0, i32 0, !dbg !740
  %3 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !740
  %4 = load i8*, i8** %key.addr, align 8, !dbg !740
  %call1 = call i32 %3(i8* noundef %4), !dbg !740
  store i32 %call1, i32* %h, align 4, !dbg !741
  store i32 0, i32* %table, align 4, !dbg !742
  br label %for.cond, !dbg !744

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %table, align 4, !dbg !745
  %cmp2 = icmp ule i32 %5, 1, !dbg !747
  br i1 %cmp2, label %for.body, label %for.end, !dbg !748

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %h, align 4, !dbg !749
  %conv = zext i32 %6 to i64, !dbg !749
  %7 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !751
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %7, i32 0, i32 2, !dbg !752
  %8 = load i32, i32* %table, align 4, !dbg !753
  %idxprom = zext i32 %8 to i64, !dbg !751
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 %idxprom, !dbg !751
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 2, !dbg !754
  %9 = load i64, i64* %sizemask, align 8, !dbg !754
  %and = and i64 %conv, %9, !dbg !755
  %conv3 = trunc i64 %and to i32, !dbg !749
  store i32 %conv3, i32* %idx, align 4, !dbg !756
  %10 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !757
  %ht4 = getelementptr inbounds %struct.dict, %struct.dict* %10, i32 0, i32 2, !dbg !758
  %11 = load i32, i32* %table, align 4, !dbg !759
  %idxprom5 = zext i32 %11 to i64, !dbg !757
  %arrayidx6 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht4, i64 0, i64 %idxprom5, !dbg !757
  %table7 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx6, i32 0, i32 0, !dbg !760
  %12 = load %struct.dictEntry**, %struct.dictEntry*** %table7, align 8, !dbg !760
  %13 = load i32, i32* %idx, align 4, !dbg !761
  %idxprom8 = zext i32 %13 to i64, !dbg !757
  %arrayidx9 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %12, i64 %idxprom8, !dbg !757
  %14 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx9, align 8, !dbg !757
  store %struct.dictEntry* %14, %struct.dictEntry** %he, align 8, !dbg !762
  br label %while.cond, !dbg !763

while.cond:                                       ; preds = %if.end21, %for.body
  %15 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !764
  %tobool = icmp ne %struct.dictEntry* %15, null, !dbg !763
  br i1 %tobool, label %while.body, label %while.end, !dbg !763

while.body:                                       ; preds = %while.cond
  %16 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !765
  %type10 = getelementptr inbounds %struct.dict, %struct.dict* %16, i32 0, i32 0, !dbg !765
  %17 = load %struct.dictType*, %struct.dictType** %type10, align 8, !dbg !765
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %17, i32 0, i32 3, !dbg !765
  %18 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !765
  %tobool11 = icmp ne i32 (i8*, i8*, i8*)* %18, null, !dbg !765
  br i1 %tobool11, label %cond.true, label %cond.false, !dbg !768

cond.true:                                        ; preds = %while.body
  %19 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !765
  %type12 = getelementptr inbounds %struct.dict, %struct.dict* %19, i32 0, i32 0, !dbg !765
  %20 = load %struct.dictType*, %struct.dictType** %type12, align 8, !dbg !765
  %keyCompare13 = getelementptr inbounds %struct.dictType, %struct.dictType* %20, i32 0, i32 3, !dbg !765
  %21 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare13, align 8, !dbg !765
  %22 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !765
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %22, i32 0, i32 1, !dbg !765
  %23 = load i8*, i8** %privdata, align 8, !dbg !765
  %24 = load i8*, i8** %key.addr, align 8, !dbg !765
  %25 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !765
  %key14 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %25, i32 0, i32 0, !dbg !765
  %26 = load i8*, i8** %key14, align 8, !dbg !765
  %call15 = call i32 %21(i8* noundef %23, i8* noundef %24, i8* noundef %26), !dbg !765
  %tobool16 = icmp ne i32 %call15, 0, !dbg !765
  br i1 %tobool16, label %if.then20, label %if.end21, !dbg !765

cond.false:                                       ; preds = %while.body
  %27 = load i8*, i8** %key.addr, align 8, !dbg !765
  %28 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !765
  %key17 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %28, i32 0, i32 0, !dbg !765
  %29 = load i8*, i8** %key17, align 8, !dbg !765
  %cmp18 = icmp eq i8* %27, %29, !dbg !765
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !768

if.then20:                                        ; preds = %cond.false, %cond.true
  store i32 -1, i32* %retval, align 4, !dbg !769
  br label %return, !dbg !769

if.end21:                                         ; preds = %cond.false, %cond.true
  %30 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !770
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %30, i32 0, i32 2, !dbg !771
  %31 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !771
  store %struct.dictEntry* %31, %struct.dictEntry** %he, align 8, !dbg !772
  br label %while.cond, !dbg !763, !llvm.loop !773

while.end:                                        ; preds = %while.cond
  %32 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !775
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %32, i32 0, i32 3, !dbg !775
  %33 = load i32, i32* %rehashidx, align 8, !dbg !775
  %cmp22 = icmp ne i32 %33, -1, !dbg !775
  br i1 %cmp22, label %if.end25, label %if.then24, !dbg !777

if.then24:                                        ; preds = %while.end
  br label %for.end, !dbg !778

if.end25:                                         ; preds = %while.end
  br label %for.inc, !dbg !779

for.inc:                                          ; preds = %if.end25
  %34 = load i32, i32* %table, align 4, !dbg !780
  %inc = add i32 %34, 1, !dbg !780
  store i32 %inc, i32* %table, align 4, !dbg !780
  br label %for.cond, !dbg !781, !llvm.loop !782

for.end:                                          ; preds = %if.then24, %for.cond
  %35 = load i32, i32* %idx, align 4, !dbg !784
  store i32 %35, i32* %retval, align 4, !dbg !785
  br label %return, !dbg !785

return:                                           ; preds = %for.end, %if.then20, %if.then
  %36 = load i32, i32* %retval, align 4, !dbg !786
  ret i32 %36, !dbg !786
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictReplace(%struct.dict* noundef %d, i8* noundef %key, i8* noundef %val) #0 !dbg !787 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %entry1 = alloca %struct.dictEntry*, align 8
  %auxentry = alloca %struct.dictEntry, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !788, metadata !DIExpression()), !dbg !789
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !790, metadata !DIExpression()), !dbg !791
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !792, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %entry1, metadata !794, metadata !DIExpression()), !dbg !795
  call void @llvm.dbg.declare(metadata %struct.dictEntry* %auxentry, metadata !796, metadata !DIExpression()), !dbg !797
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !798
  %1 = load i8*, i8** %key.addr, align 8, !dbg !800
  %2 = load i8*, i8** %val.addr, align 8, !dbg !801
  %call = call i32 @dictAdd(%struct.dict* noundef %0, i8* noundef %1, i8* noundef %2), !dbg !802
  %cmp = icmp eq i32 %call, 0, !dbg !803
  br i1 %cmp, label %if.then, label %if.end, !dbg !804

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !805
  br label %return, !dbg !805

if.end:                                           ; preds = %entry
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !806
  %4 = load i8*, i8** %key.addr, align 8, !dbg !807
  %call2 = call %struct.dictEntry* @dictFind(%struct.dict* noundef %3, i8* noundef %4), !dbg !808
  store %struct.dictEntry* %call2, %struct.dictEntry** %entry1, align 8, !dbg !809
  %5 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !810
  %6 = bitcast %struct.dictEntry* %auxentry to i8*, !dbg !811
  %7 = bitcast %struct.dictEntry* %5 to i8*, !dbg !811
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 24, i1 false), !dbg !811
  br label %do.body, !dbg !812

do.body:                                          ; preds = %if.end
  %8 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !813
  %type = getelementptr inbounds %struct.dict, %struct.dict* %8, i32 0, i32 0, !dbg !813
  %9 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !813
  %valDup = getelementptr inbounds %struct.dictType, %struct.dictType* %9, i32 0, i32 2, !dbg !813
  %10 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup, align 8, !dbg !813
  %tobool = icmp ne i8* (i8*, i8*)* %10, null, !dbg !813
  br i1 %tobool, label %if.then3, label %if.else, !dbg !816

if.then3:                                         ; preds = %do.body
  %11 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !813
  %type4 = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 0, !dbg !813
  %12 = load %struct.dictType*, %struct.dictType** %type4, align 8, !dbg !813
  %valDup5 = getelementptr inbounds %struct.dictType, %struct.dictType* %12, i32 0, i32 2, !dbg !813
  %13 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup5, align 8, !dbg !813
  %14 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !813
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %14, i32 0, i32 1, !dbg !813
  %15 = load i8*, i8** %privdata, align 8, !dbg !813
  %16 = load i8*, i8** %val.addr, align 8, !dbg !813
  %call6 = call i8* %13(i8* noundef %15, i8* noundef %16), !dbg !813
  %17 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !813
  %val7 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %17, i32 0, i32 1, !dbg !813
  store i8* %call6, i8** %val7, align 8, !dbg !813
  br label %if.end9, !dbg !813

if.else:                                          ; preds = %do.body
  %18 = load i8*, i8** %val.addr, align 8, !dbg !813
  %19 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !813
  %val8 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %19, i32 0, i32 1, !dbg !813
  store i8* %18, i8** %val8, align 8, !dbg !813
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then3
  br label %do.end, !dbg !816

do.end:                                           ; preds = %if.end9
  %20 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !817
  %type10 = getelementptr inbounds %struct.dict, %struct.dict* %20, i32 0, i32 0, !dbg !817
  %21 = load %struct.dictType*, %struct.dictType** %type10, align 8, !dbg !817
  %valDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %21, i32 0, i32 5, !dbg !817
  %22 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor, align 8, !dbg !817
  %tobool11 = icmp ne void (i8*, i8*)* %22, null, !dbg !817
  br i1 %tobool11, label %if.then12, label %if.end17, !dbg !819

if.then12:                                        ; preds = %do.end
  %23 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !817
  %type13 = getelementptr inbounds %struct.dict, %struct.dict* %23, i32 0, i32 0, !dbg !817
  %24 = load %struct.dictType*, %struct.dictType** %type13, align 8, !dbg !817
  %valDestructor14 = getelementptr inbounds %struct.dictType, %struct.dictType* %24, i32 0, i32 5, !dbg !817
  %25 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor14, align 8, !dbg !817
  %26 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !817
  %privdata15 = getelementptr inbounds %struct.dict, %struct.dict* %26, i32 0, i32 1, !dbg !817
  %27 = load i8*, i8** %privdata15, align 8, !dbg !817
  %val16 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %auxentry, i32 0, i32 1, !dbg !817
  %28 = load i8*, i8** %val16, align 8, !dbg !817
  call void %25(i8* noundef %27, i8* noundef %28), !dbg !817
  br label %if.end17, !dbg !817

if.end17:                                         ; preds = %if.then12, %do.end
  store i32 0, i32* %retval, align 4, !dbg !820
  br label %return, !dbg !820

return:                                           ; preds = %if.end17, %if.then
  %29 = load i32, i32* %retval, align 4, !dbg !821
  ret i32 %29, !dbg !821
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.dictEntry* @dictFind(%struct.dict* noundef %d, i8* noundef %key) #0 !dbg !822 {
entry:
  %retval = alloca %struct.dictEntry*, align 8
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %he = alloca %struct.dictEntry*, align 8
  %h = alloca i32, align 4
  %idx = alloca i32, align 4
  %table = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !825, metadata !DIExpression()), !dbg !826
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !827, metadata !DIExpression()), !dbg !828
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !829, metadata !DIExpression()), !dbg !830
  call void @llvm.dbg.declare(metadata i32* %h, metadata !831, metadata !DIExpression()), !dbg !832
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !833, metadata !DIExpression()), !dbg !834
  call void @llvm.dbg.declare(metadata i32* %table, metadata !835, metadata !DIExpression()), !dbg !836
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !837
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 2, !dbg !839
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !837
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 1, !dbg !840
  %1 = load i64, i64* %size, align 8, !dbg !840
  %cmp = icmp eq i64 %1, 0, !dbg !841
  br i1 %cmp, label %if.then, label %if.end, !dbg !842

if.then:                                          ; preds = %entry
  store %struct.dictEntry* null, %struct.dictEntry** %retval, align 8, !dbg !843
  br label %return, !dbg !843

if.end:                                           ; preds = %entry
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !844
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %2, i32 0, i32 3, !dbg !844
  %3 = load i32, i32* %rehashidx, align 8, !dbg !844
  %cmp1 = icmp ne i32 %3, -1, !dbg !844
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !846

if.then2:                                         ; preds = %if.end
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !847
  call void @_dictRehashStep(%struct.dict* noundef %4), !dbg !848
  br label %if.end3, !dbg !848

if.end3:                                          ; preds = %if.then2, %if.end
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !849
  %type = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 0, !dbg !849
  %6 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !849
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %6, i32 0, i32 0, !dbg !849
  %7 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !849
  %8 = load i8*, i8** %key.addr, align 8, !dbg !849
  %call = call i32 %7(i8* noundef %8), !dbg !849
  store i32 %call, i32* %h, align 4, !dbg !850
  store i32 0, i32* %table, align 4, !dbg !851
  br label %for.cond, !dbg !853

for.cond:                                         ; preds = %for.inc, %if.end3
  %9 = load i32, i32* %table, align 4, !dbg !854
  %cmp4 = icmp ule i32 %9, 1, !dbg !856
  br i1 %cmp4, label %for.body, label %for.end, !dbg !857

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %h, align 4, !dbg !858
  %conv = zext i32 %10 to i64, !dbg !858
  %11 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !860
  %ht5 = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 2, !dbg !861
  %12 = load i32, i32* %table, align 4, !dbg !862
  %idxprom = zext i32 %12 to i64, !dbg !860
  %arrayidx6 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht5, i64 0, i64 %idxprom, !dbg !860
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx6, i32 0, i32 2, !dbg !863
  %13 = load i64, i64* %sizemask, align 8, !dbg !863
  %and = and i64 %conv, %13, !dbg !864
  %conv7 = trunc i64 %and to i32, !dbg !858
  store i32 %conv7, i32* %idx, align 4, !dbg !865
  %14 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !866
  %ht8 = getelementptr inbounds %struct.dict, %struct.dict* %14, i32 0, i32 2, !dbg !867
  %15 = load i32, i32* %table, align 4, !dbg !868
  %idxprom9 = zext i32 %15 to i64, !dbg !866
  %arrayidx10 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht8, i64 0, i64 %idxprom9, !dbg !866
  %table11 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx10, i32 0, i32 0, !dbg !869
  %16 = load %struct.dictEntry**, %struct.dictEntry*** %table11, align 8, !dbg !869
  %17 = load i32, i32* %idx, align 4, !dbg !870
  %idxprom12 = zext i32 %17 to i64, !dbg !866
  %arrayidx13 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %16, i64 %idxprom12, !dbg !866
  %18 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx13, align 8, !dbg !866
  store %struct.dictEntry* %18, %struct.dictEntry** %he, align 8, !dbg !871
  br label %while.cond, !dbg !872

while.cond:                                       ; preds = %if.end25, %for.body
  %19 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !873
  %tobool = icmp ne %struct.dictEntry* %19, null, !dbg !872
  br i1 %tobool, label %while.body, label %while.end, !dbg !872

while.body:                                       ; preds = %while.cond
  %20 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !874
  %type14 = getelementptr inbounds %struct.dict, %struct.dict* %20, i32 0, i32 0, !dbg !874
  %21 = load %struct.dictType*, %struct.dictType** %type14, align 8, !dbg !874
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %21, i32 0, i32 3, !dbg !874
  %22 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !874
  %tobool15 = icmp ne i32 (i8*, i8*, i8*)* %22, null, !dbg !874
  br i1 %tobool15, label %cond.true, label %cond.false, !dbg !877

cond.true:                                        ; preds = %while.body
  %23 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !874
  %type16 = getelementptr inbounds %struct.dict, %struct.dict* %23, i32 0, i32 0, !dbg !874
  %24 = load %struct.dictType*, %struct.dictType** %type16, align 8, !dbg !874
  %keyCompare17 = getelementptr inbounds %struct.dictType, %struct.dictType* %24, i32 0, i32 3, !dbg !874
  %25 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare17, align 8, !dbg !874
  %26 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !874
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %26, i32 0, i32 1, !dbg !874
  %27 = load i8*, i8** %privdata, align 8, !dbg !874
  %28 = load i8*, i8** %key.addr, align 8, !dbg !874
  %29 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !874
  %key18 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %29, i32 0, i32 0, !dbg !874
  %30 = load i8*, i8** %key18, align 8, !dbg !874
  %call19 = call i32 %25(i8* noundef %27, i8* noundef %28, i8* noundef %30), !dbg !874
  %tobool20 = icmp ne i32 %call19, 0, !dbg !874
  br i1 %tobool20, label %if.then24, label %if.end25, !dbg !874

cond.false:                                       ; preds = %while.body
  %31 = load i8*, i8** %key.addr, align 8, !dbg !874
  %32 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !874
  %key21 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %32, i32 0, i32 0, !dbg !874
  %33 = load i8*, i8** %key21, align 8, !dbg !874
  %cmp22 = icmp eq i8* %31, %33, !dbg !874
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !877

if.then24:                                        ; preds = %cond.false, %cond.true
  %34 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !878
  store %struct.dictEntry* %34, %struct.dictEntry** %retval, align 8, !dbg !879
  br label %return, !dbg !879

if.end25:                                         ; preds = %cond.false, %cond.true
  %35 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !880
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %35, i32 0, i32 2, !dbg !881
  %36 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !881
  store %struct.dictEntry* %36, %struct.dictEntry** %he, align 8, !dbg !882
  br label %while.cond, !dbg !872, !llvm.loop !883

while.end:                                        ; preds = %while.cond
  %37 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !885
  %rehashidx26 = getelementptr inbounds %struct.dict, %struct.dict* %37, i32 0, i32 3, !dbg !885
  %38 = load i32, i32* %rehashidx26, align 8, !dbg !885
  %cmp27 = icmp ne i32 %38, -1, !dbg !885
  br i1 %cmp27, label %if.end30, label %if.then29, !dbg !887

if.then29:                                        ; preds = %while.end
  store %struct.dictEntry* null, %struct.dictEntry** %retval, align 8, !dbg !888
  br label %return, !dbg !888

if.end30:                                         ; preds = %while.end
  br label %for.inc, !dbg !889

for.inc:                                          ; preds = %if.end30
  %39 = load i32, i32* %table, align 4, !dbg !890
  %inc = add i32 %39, 1, !dbg !890
  store i32 %inc, i32* %table, align 4, !dbg !890
  br label %for.cond, !dbg !891, !llvm.loop !892

for.end:                                          ; preds = %for.cond
  store %struct.dictEntry* null, %struct.dictEntry** %retval, align 8, !dbg !894
  br label %return, !dbg !894

return:                                           ; preds = %for.end, %if.then29, %if.then24, %if.then
  %40 = load %struct.dictEntry*, %struct.dictEntry** %retval, align 8, !dbg !895
  ret %struct.dictEntry* %40, !dbg !895
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictGenericDelete(%struct.dict* noundef %d, i8* noundef %key, i32 noundef %nofree) #0 !dbg !896 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %nofree.addr = alloca i32, align 4
  %h = alloca i32, align 4
  %idx = alloca i32, align 4
  %he = alloca %struct.dictEntry*, align 8
  %prevHe = alloca %struct.dictEntry*, align 8
  %table = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store i32 %nofree, i32* %nofree.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nofree.addr, metadata !903, metadata !DIExpression()), !dbg !904
  call void @llvm.dbg.declare(metadata i32* %h, metadata !905, metadata !DIExpression()), !dbg !906
  call void @llvm.dbg.declare(metadata i32* %idx, metadata !907, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !909, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %prevHe, metadata !911, metadata !DIExpression()), !dbg !912
  call void @llvm.dbg.declare(metadata i32* %table, metadata !913, metadata !DIExpression()), !dbg !914
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !915
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 2, !dbg !917
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !915
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 1, !dbg !918
  %1 = load i64, i64* %size, align 8, !dbg !918
  %cmp = icmp eq i64 %1, 0, !dbg !919
  br i1 %cmp, label %if.then, label %if.end, !dbg !920

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !921
  br label %return, !dbg !921

if.end:                                           ; preds = %entry
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !922
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %2, i32 0, i32 3, !dbg !922
  %3 = load i32, i32* %rehashidx, align 8, !dbg !922
  %cmp1 = icmp ne i32 %3, -1, !dbg !922
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !924

if.then2:                                         ; preds = %if.end
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !925
  call void @_dictRehashStep(%struct.dict* noundef %4), !dbg !926
  br label %if.end3, !dbg !926

if.end3:                                          ; preds = %if.then2, %if.end
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !927
  %type = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 0, !dbg !927
  %6 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !927
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %6, i32 0, i32 0, !dbg !927
  %7 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !927
  %8 = load i8*, i8** %key.addr, align 8, !dbg !927
  %call = call i32 %7(i8* noundef %8), !dbg !927
  store i32 %call, i32* %h, align 4, !dbg !928
  store i32 0, i32* %table, align 4, !dbg !929
  br label %for.cond, !dbg !931

for.cond:                                         ; preds = %for.inc, %if.end3
  %9 = load i32, i32* %table, align 4, !dbg !932
  %cmp4 = icmp sle i32 %9, 1, !dbg !934
  br i1 %cmp4, label %for.body, label %for.end, !dbg !935

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %h, align 4, !dbg !936
  %conv = zext i32 %10 to i64, !dbg !936
  %11 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !938
  %ht5 = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 2, !dbg !939
  %12 = load i32, i32* %table, align 4, !dbg !940
  %idxprom = sext i32 %12 to i64, !dbg !938
  %arrayidx6 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht5, i64 0, i64 %idxprom, !dbg !938
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx6, i32 0, i32 2, !dbg !941
  %13 = load i64, i64* %sizemask, align 8, !dbg !941
  %and = and i64 %conv, %13, !dbg !942
  %conv7 = trunc i64 %and to i32, !dbg !936
  store i32 %conv7, i32* %idx, align 4, !dbg !943
  %14 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !944
  %ht8 = getelementptr inbounds %struct.dict, %struct.dict* %14, i32 0, i32 2, !dbg !945
  %15 = load i32, i32* %table, align 4, !dbg !946
  %idxprom9 = sext i32 %15 to i64, !dbg !944
  %arrayidx10 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht8, i64 0, i64 %idxprom9, !dbg !944
  %table11 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx10, i32 0, i32 0, !dbg !947
  %16 = load %struct.dictEntry**, %struct.dictEntry*** %table11, align 8, !dbg !947
  %17 = load i32, i32* %idx, align 4, !dbg !948
  %idxprom12 = zext i32 %17 to i64, !dbg !944
  %arrayidx13 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %16, i64 %idxprom12, !dbg !944
  %18 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx13, align 8, !dbg !944
  store %struct.dictEntry* %18, %struct.dictEntry** %he, align 8, !dbg !949
  store %struct.dictEntry* null, %struct.dictEntry** %prevHe, align 8, !dbg !950
  br label %while.cond, !dbg !951

while.cond:                                       ; preds = %if.end57, %for.body
  %19 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !952
  %tobool = icmp ne %struct.dictEntry* %19, null, !dbg !951
  br i1 %tobool, label %while.body, label %while.end, !dbg !951

while.body:                                       ; preds = %while.cond
  %20 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !953
  %type14 = getelementptr inbounds %struct.dict, %struct.dict* %20, i32 0, i32 0, !dbg !953
  %21 = load %struct.dictType*, %struct.dictType** %type14, align 8, !dbg !953
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %21, i32 0, i32 3, !dbg !953
  %22 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !953
  %tobool15 = icmp ne i32 (i8*, i8*, i8*)* %22, null, !dbg !953
  br i1 %tobool15, label %cond.true, label %cond.false, !dbg !956

cond.true:                                        ; preds = %while.body
  %23 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !953
  %type16 = getelementptr inbounds %struct.dict, %struct.dict* %23, i32 0, i32 0, !dbg !953
  %24 = load %struct.dictType*, %struct.dictType** %type16, align 8, !dbg !953
  %keyCompare17 = getelementptr inbounds %struct.dictType, %struct.dictType* %24, i32 0, i32 3, !dbg !953
  %25 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare17, align 8, !dbg !953
  %26 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !953
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %26, i32 0, i32 1, !dbg !953
  %27 = load i8*, i8** %privdata, align 8, !dbg !953
  %28 = load i8*, i8** %key.addr, align 8, !dbg !953
  %29 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !953
  %key18 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %29, i32 0, i32 0, !dbg !953
  %30 = load i8*, i8** %key18, align 8, !dbg !953
  %call19 = call i32 %25(i8* noundef %27, i8* noundef %28, i8* noundef %30), !dbg !953
  %tobool20 = icmp ne i32 %call19, 0, !dbg !953
  br i1 %tobool20, label %if.then24, label %if.end57, !dbg !953

cond.false:                                       ; preds = %while.body
  %31 = load i8*, i8** %key.addr, align 8, !dbg !953
  %32 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !953
  %key21 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %32, i32 0, i32 0, !dbg !953
  %33 = load i8*, i8** %key21, align 8, !dbg !953
  %cmp22 = icmp eq i8* %31, %33, !dbg !953
  br i1 %cmp22, label %if.then24, label %if.end57, !dbg !956

if.then24:                                        ; preds = %cond.false, %cond.true
  %34 = load %struct.dictEntry*, %struct.dictEntry** %prevHe, align 8, !dbg !957
  %tobool25 = icmp ne %struct.dictEntry* %34, null, !dbg !957
  br i1 %tobool25, label %if.then26, label %if.else, !dbg !960

if.then26:                                        ; preds = %if.then24
  %35 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !961
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %35, i32 0, i32 2, !dbg !962
  %36 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !962
  %37 = load %struct.dictEntry*, %struct.dictEntry** %prevHe, align 8, !dbg !963
  %next27 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %37, i32 0, i32 2, !dbg !964
  store %struct.dictEntry* %36, %struct.dictEntry** %next27, align 8, !dbg !965
  br label %if.end35, !dbg !963

if.else:                                          ; preds = %if.then24
  %38 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !966
  %next28 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %38, i32 0, i32 2, !dbg !967
  %39 = load %struct.dictEntry*, %struct.dictEntry** %next28, align 8, !dbg !967
  %40 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !968
  %ht29 = getelementptr inbounds %struct.dict, %struct.dict* %40, i32 0, i32 2, !dbg !969
  %41 = load i32, i32* %table, align 4, !dbg !970
  %idxprom30 = sext i32 %41 to i64, !dbg !968
  %arrayidx31 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht29, i64 0, i64 %idxprom30, !dbg !968
  %table32 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx31, i32 0, i32 0, !dbg !971
  %42 = load %struct.dictEntry**, %struct.dictEntry*** %table32, align 8, !dbg !971
  %43 = load i32, i32* %idx, align 4, !dbg !972
  %idxprom33 = zext i32 %43 to i64, !dbg !968
  %arrayidx34 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %42, i64 %idxprom33, !dbg !968
  store %struct.dictEntry* %39, %struct.dictEntry** %arrayidx34, align 8, !dbg !973
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.then26
  %44 = load i32, i32* %nofree.addr, align 4, !dbg !974
  %tobool36 = icmp ne i32 %44, 0, !dbg !974
  br i1 %tobool36, label %if.end53, label %if.then37, !dbg !976

if.then37:                                        ; preds = %if.end35
  %45 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !977
  %type38 = getelementptr inbounds %struct.dict, %struct.dict* %45, i32 0, i32 0, !dbg !977
  %46 = load %struct.dictType*, %struct.dictType** %type38, align 8, !dbg !977
  %keyDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %46, i32 0, i32 4, !dbg !977
  %47 = load void (i8*, i8*)*, void (i8*, i8*)** %keyDestructor, align 8, !dbg !977
  %tobool39 = icmp ne void (i8*, i8*)* %47, null, !dbg !977
  br i1 %tobool39, label %if.then40, label %if.end45, !dbg !980

if.then40:                                        ; preds = %if.then37
  %48 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !977
  %type41 = getelementptr inbounds %struct.dict, %struct.dict* %48, i32 0, i32 0, !dbg !977
  %49 = load %struct.dictType*, %struct.dictType** %type41, align 8, !dbg !977
  %keyDestructor42 = getelementptr inbounds %struct.dictType, %struct.dictType* %49, i32 0, i32 4, !dbg !977
  %50 = load void (i8*, i8*)*, void (i8*, i8*)** %keyDestructor42, align 8, !dbg !977
  %51 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !977
  %privdata43 = getelementptr inbounds %struct.dict, %struct.dict* %51, i32 0, i32 1, !dbg !977
  %52 = load i8*, i8** %privdata43, align 8, !dbg !977
  %53 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !977
  %key44 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %53, i32 0, i32 0, !dbg !977
  %54 = load i8*, i8** %key44, align 8, !dbg !977
  call void %50(i8* noundef %52, i8* noundef %54), !dbg !977
  br label %if.end45, !dbg !977

if.end45:                                         ; preds = %if.then40, %if.then37
  %55 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !981
  %type46 = getelementptr inbounds %struct.dict, %struct.dict* %55, i32 0, i32 0, !dbg !981
  %56 = load %struct.dictType*, %struct.dictType** %type46, align 8, !dbg !981
  %valDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %56, i32 0, i32 5, !dbg !981
  %57 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor, align 8, !dbg !981
  %tobool47 = icmp ne void (i8*, i8*)* %57, null, !dbg !981
  br i1 %tobool47, label %if.then48, label %if.end52, !dbg !983

if.then48:                                        ; preds = %if.end45
  %58 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !981
  %type49 = getelementptr inbounds %struct.dict, %struct.dict* %58, i32 0, i32 0, !dbg !981
  %59 = load %struct.dictType*, %struct.dictType** %type49, align 8, !dbg !981
  %valDestructor50 = getelementptr inbounds %struct.dictType, %struct.dictType* %59, i32 0, i32 5, !dbg !981
  %60 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor50, align 8, !dbg !981
  %61 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !981
  %privdata51 = getelementptr inbounds %struct.dict, %struct.dict* %61, i32 0, i32 1, !dbg !981
  %62 = load i8*, i8** %privdata51, align 8, !dbg !981
  %63 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !981
  %val = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %63, i32 0, i32 1, !dbg !981
  %64 = load i8*, i8** %val, align 8, !dbg !981
  call void %60(i8* noundef %62, i8* noundef %64), !dbg !981
  br label %if.end52, !dbg !981

if.end52:                                         ; preds = %if.then48, %if.end45
  br label %if.end53, !dbg !984

if.end53:                                         ; preds = %if.end52, %if.end35
  %65 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !985
  %66 = bitcast %struct.dictEntry* %65 to i8*, !dbg !985
  call void @_dictFree(i8* noundef %66), !dbg !986
  %67 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !987
  %ht54 = getelementptr inbounds %struct.dict, %struct.dict* %67, i32 0, i32 2, !dbg !988
  %68 = load i32, i32* %table, align 4, !dbg !989
  %idxprom55 = sext i32 %68 to i64, !dbg !987
  %arrayidx56 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht54, i64 0, i64 %idxprom55, !dbg !987
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx56, i32 0, i32 3, !dbg !990
  %69 = load i64, i64* %used, align 8, !dbg !991
  %dec = add i64 %69, -1, !dbg !991
  store i64 %dec, i64* %used, align 8, !dbg !991
  store i32 0, i32* %retval, align 4, !dbg !992
  br label %return, !dbg !992

if.end57:                                         ; preds = %cond.false, %cond.true
  %70 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !993
  store %struct.dictEntry* %70, %struct.dictEntry** %prevHe, align 8, !dbg !994
  %71 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !995
  %next58 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %71, i32 0, i32 2, !dbg !996
  %72 = load %struct.dictEntry*, %struct.dictEntry** %next58, align 8, !dbg !996
  store %struct.dictEntry* %72, %struct.dictEntry** %he, align 8, !dbg !997
  br label %while.cond, !dbg !951, !llvm.loop !998

while.end:                                        ; preds = %while.cond
  %73 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1000
  %rehashidx59 = getelementptr inbounds %struct.dict, %struct.dict* %73, i32 0, i32 3, !dbg !1000
  %74 = load i32, i32* %rehashidx59, align 8, !dbg !1000
  %cmp60 = icmp ne i32 %74, -1, !dbg !1000
  br i1 %cmp60, label %if.end63, label %if.then62, !dbg !1002

if.then62:                                        ; preds = %while.end
  br label %for.end, !dbg !1003

if.end63:                                         ; preds = %while.end
  br label %for.inc, !dbg !1004

for.inc:                                          ; preds = %if.end63
  %75 = load i32, i32* %table, align 4, !dbg !1005
  %inc = add nsw i32 %75, 1, !dbg !1005
  store i32 %inc, i32* %table, align 4, !dbg !1005
  br label %for.cond, !dbg !1006, !llvm.loop !1007

for.end:                                          ; preds = %if.then62, %for.cond
  store i32 1, i32* %retval, align 4, !dbg !1009
  br label %return, !dbg !1009

return:                                           ; preds = %for.end, %if.end53, %if.then
  %76 = load i32, i32* %retval, align 4, !dbg !1010
  ret i32 %76, !dbg !1010
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictDelete(%struct.dict* noundef %ht, i8* noundef %key) #0 !dbg !1011 {
entry:
  %ht.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  store %struct.dict* %ht, %struct.dict** %ht.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %ht.addr, metadata !1012, metadata !DIExpression()), !dbg !1013
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  %0 = load %struct.dict*, %struct.dict** %ht.addr, align 8, !dbg !1016
  %1 = load i8*, i8** %key.addr, align 8, !dbg !1017
  %call = call i32 @dictGenericDelete(%struct.dict* noundef %0, i8* noundef %1, i32 noundef 0), !dbg !1018
  ret i32 %call, !dbg !1019
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @dictDeleteNoFree(%struct.dict* noundef %ht, i8* noundef %key) #0 !dbg !1020 {
entry:
  %ht.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  store %struct.dict* %ht, %struct.dict** %ht.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %ht.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  %0 = load %struct.dict*, %struct.dict** %ht.addr, align 8, !dbg !1025
  %1 = load i8*, i8** %key.addr, align 8, !dbg !1026
  %call = call i32 @dictGenericDelete(%struct.dict* noundef %0, i8* noundef %1, i32 noundef 1), !dbg !1027
  ret i32 %call, !dbg !1028
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictClear(%struct.dict* noundef %d, %struct.dictht* noundef %ht) #0 !dbg !1029 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  %ht.addr = alloca %struct.dictht*, align 8
  %i = alloca i64, align 8
  %he = alloca %struct.dictEntry*, align 8
  %nextHe = alloca %struct.dictEntry*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1032, metadata !DIExpression()), !dbg !1033
  store %struct.dictht* %ht, %struct.dictht** %ht.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictht** %ht.addr, metadata !1034, metadata !DIExpression()), !dbg !1035
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1036, metadata !DIExpression()), !dbg !1037
  store i64 0, i64* %i, align 8, !dbg !1038
  br label %for.cond, !dbg !1040

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !1041
  %1 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1043
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %1, i32 0, i32 1, !dbg !1044
  %2 = load i64, i64* %size, align 8, !dbg !1044
  %cmp = icmp ult i64 %0, %2, !dbg !1045
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !1046

land.rhs:                                         ; preds = %for.cond
  %3 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1047
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %3, i32 0, i32 3, !dbg !1048
  %4 = load i64, i64* %used, align 8, !dbg !1048
  %cmp1 = icmp ugt i64 %4, 0, !dbg !1049
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ], !dbg !1050
  br i1 %5, label %for.body, label %for.end, !dbg !1051

for.body:                                         ; preds = %land.end
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !1052, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %nextHe, metadata !1055, metadata !DIExpression()), !dbg !1056
  %6 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1057
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %6, i32 0, i32 0, !dbg !1059
  %7 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !1059
  %8 = load i64, i64* %i, align 8, !dbg !1060
  %arrayidx = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %7, i64 %8, !dbg !1057
  %9 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx, align 8, !dbg !1057
  store %struct.dictEntry* %9, %struct.dictEntry** %he, align 8, !dbg !1061
  %cmp2 = icmp eq %struct.dictEntry* %9, null, !dbg !1062
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1063

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !1064

if.end:                                           ; preds = %for.body
  br label %while.cond, !dbg !1065

while.cond:                                       ; preds = %if.end14, %if.end
  %10 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1066
  %tobool = icmp ne %struct.dictEntry* %10, null, !dbg !1065
  br i1 %tobool, label %while.body, label %while.end, !dbg !1065

while.body:                                       ; preds = %while.cond
  %11 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1067
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %11, i32 0, i32 2, !dbg !1069
  %12 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1069
  store %struct.dictEntry* %12, %struct.dictEntry** %nextHe, align 8, !dbg !1070
  %13 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1071
  %type = getelementptr inbounds %struct.dict, %struct.dict* %13, i32 0, i32 0, !dbg !1071
  %14 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !1071
  %keyDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %14, i32 0, i32 4, !dbg !1071
  %15 = load void (i8*, i8*)*, void (i8*, i8*)** %keyDestructor, align 8, !dbg !1071
  %tobool3 = icmp ne void (i8*, i8*)* %15, null, !dbg !1071
  br i1 %tobool3, label %if.then4, label %if.end7, !dbg !1073

if.then4:                                         ; preds = %while.body
  %16 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1071
  %type5 = getelementptr inbounds %struct.dict, %struct.dict* %16, i32 0, i32 0, !dbg !1071
  %17 = load %struct.dictType*, %struct.dictType** %type5, align 8, !dbg !1071
  %keyDestructor6 = getelementptr inbounds %struct.dictType, %struct.dictType* %17, i32 0, i32 4, !dbg !1071
  %18 = load void (i8*, i8*)*, void (i8*, i8*)** %keyDestructor6, align 8, !dbg !1071
  %19 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1071
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %19, i32 0, i32 1, !dbg !1071
  %20 = load i8*, i8** %privdata, align 8, !dbg !1071
  %21 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1071
  %key = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %21, i32 0, i32 0, !dbg !1071
  %22 = load i8*, i8** %key, align 8, !dbg !1071
  call void %18(i8* noundef %20, i8* noundef %22), !dbg !1071
  br label %if.end7, !dbg !1071

if.end7:                                          ; preds = %if.then4, %while.body
  %23 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1074
  %type8 = getelementptr inbounds %struct.dict, %struct.dict* %23, i32 0, i32 0, !dbg !1074
  %24 = load %struct.dictType*, %struct.dictType** %type8, align 8, !dbg !1074
  %valDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %24, i32 0, i32 5, !dbg !1074
  %25 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor, align 8, !dbg !1074
  %tobool9 = icmp ne void (i8*, i8*)* %25, null, !dbg !1074
  br i1 %tobool9, label %if.then10, label %if.end14, !dbg !1076

if.then10:                                        ; preds = %if.end7
  %26 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1074
  %type11 = getelementptr inbounds %struct.dict, %struct.dict* %26, i32 0, i32 0, !dbg !1074
  %27 = load %struct.dictType*, %struct.dictType** %type11, align 8, !dbg !1074
  %valDestructor12 = getelementptr inbounds %struct.dictType, %struct.dictType* %27, i32 0, i32 5, !dbg !1074
  %28 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor12, align 8, !dbg !1074
  %29 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1074
  %privdata13 = getelementptr inbounds %struct.dict, %struct.dict* %29, i32 0, i32 1, !dbg !1074
  %30 = load i8*, i8** %privdata13, align 8, !dbg !1074
  %31 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1074
  %val = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %31, i32 0, i32 1, !dbg !1074
  %32 = load i8*, i8** %val, align 8, !dbg !1074
  call void %28(i8* noundef %30, i8* noundef %32), !dbg !1074
  br label %if.end14, !dbg !1074

if.end14:                                         ; preds = %if.then10, %if.end7
  %33 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1077
  %34 = bitcast %struct.dictEntry* %33 to i8*, !dbg !1077
  call void @_dictFree(i8* noundef %34), !dbg !1078
  %35 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1079
  %used15 = getelementptr inbounds %struct.dictht, %struct.dictht* %35, i32 0, i32 3, !dbg !1080
  %36 = load i64, i64* %used15, align 8, !dbg !1081
  %dec = add i64 %36, -1, !dbg !1081
  store i64 %dec, i64* %used15, align 8, !dbg !1081
  %37 = load %struct.dictEntry*, %struct.dictEntry** %nextHe, align 8, !dbg !1082
  store %struct.dictEntry* %37, %struct.dictEntry** %he, align 8, !dbg !1083
  br label %while.cond, !dbg !1065, !llvm.loop !1084

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !1086

for.inc:                                          ; preds = %while.end, %if.then
  %38 = load i64, i64* %i, align 8, !dbg !1087
  %inc = add i64 %38, 1, !dbg !1087
  store i64 %inc, i64* %i, align 8, !dbg !1087
  br label %for.cond, !dbg !1088, !llvm.loop !1089

for.end:                                          ; preds = %land.end
  %39 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1091
  %table16 = getelementptr inbounds %struct.dictht, %struct.dictht* %39, i32 0, i32 0, !dbg !1092
  %40 = load %struct.dictEntry**, %struct.dictEntry*** %table16, align 8, !dbg !1092
  %41 = bitcast %struct.dictEntry** %40 to i8*, !dbg !1091
  call void @_dictFree(i8* noundef %41), !dbg !1093
  %42 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1094
  call void @_dictReset(%struct.dictht* noundef %42), !dbg !1095
  ret i32 0, !dbg !1096
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictRelease(%struct.dict* noundef %d) #0 !dbg !1097 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1098, metadata !DIExpression()), !dbg !1099
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1100
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1101
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 2, !dbg !1102
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !1101
  %call = call i32 @_dictClear(%struct.dict* noundef %0, %struct.dictht* noundef %arrayidx), !dbg !1103
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1104
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1105
  %ht1 = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !1106
  %arrayidx2 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht1, i64 0, i64 1, !dbg !1105
  %call3 = call i32 @_dictClear(%struct.dict* noundef %2, %struct.dictht* noundef %arrayidx2), !dbg !1107
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1108
  %5 = bitcast %struct.dict* %4 to i8*, !dbg !1108
  call void @_dictFree(i8* noundef %5), !dbg !1109
  ret void, !dbg !1110
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @dictFetchValue(%struct.dict* noundef %d, i8* noundef %key) #0 !dbg !1111 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  %key.addr = alloca i8*, align 8
  %he = alloca %struct.dictEntry*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1114, metadata !DIExpression()), !dbg !1115
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1116, metadata !DIExpression()), !dbg !1117
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !1118, metadata !DIExpression()), !dbg !1119
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1120
  %1 = load i8*, i8** %key.addr, align 8, !dbg !1121
  %call = call %struct.dictEntry* @dictFind(%struct.dict* noundef %0, i8* noundef %1), !dbg !1122
  store %struct.dictEntry* %call, %struct.dictEntry** %he, align 8, !dbg !1123
  %2 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1124
  %tobool = icmp ne %struct.dictEntry* %2, null, !dbg !1124
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !1124

cond.true:                                        ; preds = %entry
  %3 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1125
  %val = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %3, i32 0, i32 1, !dbg !1125
  %4 = load i8*, i8** %val, align 8, !dbg !1125
  br label %cond.end, !dbg !1124

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !1124

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ null, %cond.false ], !dbg !1124
  ret i8* %cond, !dbg !1126
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.dictIterator* @dictGetIterator(%struct.dict* noundef %d) #0 !dbg !1127 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  %iter = alloca %struct.dictIterator*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1139, metadata !DIExpression()), !dbg !1140
  call void @llvm.dbg.declare(metadata %struct.dictIterator** %iter, metadata !1141, metadata !DIExpression()), !dbg !1142
  %call = call i8* @_dictAlloc(i64 noundef 32), !dbg !1143
  %0 = bitcast i8* %call to %struct.dictIterator*, !dbg !1143
  store %struct.dictIterator* %0, %struct.dictIterator** %iter, align 8, !dbg !1142
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1144
  %2 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1145
  %d1 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %2, i32 0, i32 0, !dbg !1146
  store %struct.dict* %1, %struct.dict** %d1, align 8, !dbg !1147
  %3 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1148
  %table = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %3, i32 0, i32 1, !dbg !1149
  store i32 0, i32* %table, align 8, !dbg !1150
  %4 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1151
  %index = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %4, i32 0, i32 2, !dbg !1152
  store i32 -1, i32* %index, align 4, !dbg !1153
  %5 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1154
  %entry2 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %5, i32 0, i32 3, !dbg !1155
  store %struct.dictEntry* null, %struct.dictEntry** %entry2, align 8, !dbg !1156
  %6 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1157
  %nextEntry = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %6, i32 0, i32 4, !dbg !1158
  store %struct.dictEntry* null, %struct.dictEntry** %nextEntry, align 8, !dbg !1159
  %7 = load %struct.dictIterator*, %struct.dictIterator** %iter, align 8, !dbg !1160
  ret %struct.dictIterator* %7, !dbg !1161
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.dictEntry* @dictNext(%struct.dictIterator* noundef %iter) #0 !dbg !1162 {
entry:
  %retval = alloca %struct.dictEntry*, align 8
  %iter.addr = alloca %struct.dictIterator*, align 8
  %ht = alloca %struct.dictht*, align 8
  store %struct.dictIterator* %iter, %struct.dictIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictIterator** %iter.addr, metadata !1165, metadata !DIExpression()), !dbg !1166
  br label %while.body, !dbg !1167

while.body:                                       ; preds = %entry, %if.end43
  %0 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1168
  %entry1 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %0, i32 0, i32 3, !dbg !1171
  %1 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !1171
  %cmp = icmp eq %struct.dictEntry* %1, null, !dbg !1172
  br i1 %cmp, label %if.then, label %if.else35, !dbg !1173

if.then:                                          ; preds = %while.body
  call void @llvm.dbg.declare(metadata %struct.dictht** %ht, metadata !1174, metadata !DIExpression()), !dbg !1176
  %2 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1177
  %d = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %2, i32 0, i32 0, !dbg !1178
  %3 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !1178
  %ht2 = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !1179
  %4 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1180
  %table = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %4, i32 0, i32 1, !dbg !1181
  %5 = load i32, i32* %table, align 8, !dbg !1181
  %idxprom = sext i32 %5 to i64, !dbg !1177
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht2, i64 0, i64 %idxprom, !dbg !1177
  store %struct.dictht* %arrayidx, %struct.dictht** %ht, align 8, !dbg !1176
  %6 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1182
  %index = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %6, i32 0, i32 2, !dbg !1184
  %7 = load i32, i32* %index, align 4, !dbg !1184
  %cmp3 = icmp eq i32 %7, -1, !dbg !1185
  br i1 %cmp3, label %land.lhs.true, label %if.end, !dbg !1186

land.lhs.true:                                    ; preds = %if.then
  %8 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1187
  %table4 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %8, i32 0, i32 1, !dbg !1188
  %9 = load i32, i32* %table4, align 8, !dbg !1188
  %cmp5 = icmp eq i32 %9, 0, !dbg !1189
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !1190

if.then6:                                         ; preds = %land.lhs.true
  %10 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1191
  %d7 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %10, i32 0, i32 0, !dbg !1192
  %11 = load %struct.dict*, %struct.dict** %d7, align 8, !dbg !1192
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 4, !dbg !1193
  %12 = load i32, i32* %iterators, align 4, !dbg !1194
  %inc = add nsw i32 %12, 1, !dbg !1194
  store i32 %inc, i32* %iterators, align 4, !dbg !1194
  br label %if.end, !dbg !1191

if.end:                                           ; preds = %if.then6, %land.lhs.true, %if.then
  %13 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1195
  %index8 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %13, i32 0, i32 2, !dbg !1196
  %14 = load i32, i32* %index8, align 4, !dbg !1197
  %inc9 = add nsw i32 %14, 1, !dbg !1197
  store i32 %inc9, i32* %index8, align 4, !dbg !1197
  %15 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1198
  %index10 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %15, i32 0, i32 2, !dbg !1200
  %16 = load i32, i32* %index10, align 4, !dbg !1200
  %17 = load %struct.dictht*, %struct.dictht** %ht, align 8, !dbg !1201
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %17, i32 0, i32 1, !dbg !1202
  %18 = load i64, i64* %size, align 8, !dbg !1202
  %conv = trunc i64 %18 to i32, !dbg !1203
  %cmp11 = icmp sge i32 %16, %conv, !dbg !1204
  br i1 %cmp11, label %if.then13, label %if.end29, !dbg !1205

if.then13:                                        ; preds = %if.end
  %19 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1206
  %d14 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %19, i32 0, i32 0, !dbg !1206
  %20 = load %struct.dict*, %struct.dict** %d14, align 8, !dbg !1206
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %20, i32 0, i32 3, !dbg !1206
  %21 = load i32, i32* %rehashidx, align 8, !dbg !1206
  %cmp15 = icmp ne i32 %21, -1, !dbg !1206
  br i1 %cmp15, label %land.lhs.true17, label %if.else, !dbg !1209

land.lhs.true17:                                  ; preds = %if.then13
  %22 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1210
  %table18 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %22, i32 0, i32 1, !dbg !1211
  %23 = load i32, i32* %table18, align 8, !dbg !1211
  %cmp19 = icmp eq i32 %23, 0, !dbg !1212
  br i1 %cmp19, label %if.then21, label %if.else, !dbg !1213

if.then21:                                        ; preds = %land.lhs.true17
  %24 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1214
  %table22 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %24, i32 0, i32 1, !dbg !1216
  %25 = load i32, i32* %table22, align 8, !dbg !1217
  %inc23 = add nsw i32 %25, 1, !dbg !1217
  store i32 %inc23, i32* %table22, align 8, !dbg !1217
  %26 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1218
  %index24 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %26, i32 0, i32 2, !dbg !1219
  store i32 0, i32* %index24, align 4, !dbg !1220
  %27 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1221
  %d25 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %27, i32 0, i32 0, !dbg !1222
  %28 = load %struct.dict*, %struct.dict** %d25, align 8, !dbg !1222
  %ht26 = getelementptr inbounds %struct.dict, %struct.dict* %28, i32 0, i32 2, !dbg !1223
  %arrayidx27 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht26, i64 0, i64 1, !dbg !1221
  store %struct.dictht* %arrayidx27, %struct.dictht** %ht, align 8, !dbg !1224
  br label %if.end28, !dbg !1225

if.else:                                          ; preds = %land.lhs.true17, %if.then13
  br label %while.end, !dbg !1226

if.end28:                                         ; preds = %if.then21
  br label %if.end29, !dbg !1228

if.end29:                                         ; preds = %if.end28, %if.end
  %29 = load %struct.dictht*, %struct.dictht** %ht, align 8, !dbg !1229
  %table30 = getelementptr inbounds %struct.dictht, %struct.dictht* %29, i32 0, i32 0, !dbg !1230
  %30 = load %struct.dictEntry**, %struct.dictEntry*** %table30, align 8, !dbg !1230
  %31 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1231
  %index31 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %31, i32 0, i32 2, !dbg !1232
  %32 = load i32, i32* %index31, align 4, !dbg !1232
  %idxprom32 = sext i32 %32 to i64, !dbg !1229
  %arrayidx33 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %30, i64 %idxprom32, !dbg !1229
  %33 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx33, align 8, !dbg !1229
  %34 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1233
  %entry34 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %34, i32 0, i32 3, !dbg !1234
  store %struct.dictEntry* %33, %struct.dictEntry** %entry34, align 8, !dbg !1235
  br label %if.end37, !dbg !1236

if.else35:                                        ; preds = %while.body
  %35 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1237
  %nextEntry = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %35, i32 0, i32 4, !dbg !1239
  %36 = load %struct.dictEntry*, %struct.dictEntry** %nextEntry, align 8, !dbg !1239
  %37 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1240
  %entry36 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %37, i32 0, i32 3, !dbg !1241
  store %struct.dictEntry* %36, %struct.dictEntry** %entry36, align 8, !dbg !1242
  br label %if.end37

if.end37:                                         ; preds = %if.else35, %if.end29
  %38 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1243
  %entry38 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %38, i32 0, i32 3, !dbg !1245
  %39 = load %struct.dictEntry*, %struct.dictEntry** %entry38, align 8, !dbg !1245
  %tobool = icmp ne %struct.dictEntry* %39, null, !dbg !1243
  br i1 %tobool, label %if.then39, label %if.end43, !dbg !1246

if.then39:                                        ; preds = %if.end37
  %40 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1247
  %entry40 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %40, i32 0, i32 3, !dbg !1249
  %41 = load %struct.dictEntry*, %struct.dictEntry** %entry40, align 8, !dbg !1249
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %41, i32 0, i32 2, !dbg !1250
  %42 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1250
  %43 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1251
  %nextEntry41 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %43, i32 0, i32 4, !dbg !1252
  store %struct.dictEntry* %42, %struct.dictEntry** %nextEntry41, align 8, !dbg !1253
  %44 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1254
  %entry42 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %44, i32 0, i32 3, !dbg !1255
  %45 = load %struct.dictEntry*, %struct.dictEntry** %entry42, align 8, !dbg !1255
  store %struct.dictEntry* %45, %struct.dictEntry** %retval, align 8, !dbg !1256
  br label %return, !dbg !1256

if.end43:                                         ; preds = %if.end37
  br label %while.body, !dbg !1167, !llvm.loop !1257

while.end:                                        ; preds = %if.else
  store %struct.dictEntry* null, %struct.dictEntry** %retval, align 8, !dbg !1259
  br label %return, !dbg !1259

return:                                           ; preds = %while.end, %if.then39
  %46 = load %struct.dictEntry*, %struct.dictEntry** %retval, align 8, !dbg !1260
  ret %struct.dictEntry* %46, !dbg !1260
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictReleaseIterator(%struct.dictIterator* noundef %iter) #0 !dbg !1261 {
entry:
  %iter.addr = alloca %struct.dictIterator*, align 8
  store %struct.dictIterator* %iter, %struct.dictIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictIterator** %iter.addr, metadata !1264, metadata !DIExpression()), !dbg !1265
  %0 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1266
  %index = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %0, i32 0, i32 2, !dbg !1268
  %1 = load i32, i32* %index, align 4, !dbg !1268
  %cmp = icmp eq i32 %1, -1, !dbg !1269
  br i1 %cmp, label %land.lhs.true, label %if.then, !dbg !1270

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1271
  %table = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %2, i32 0, i32 1, !dbg !1272
  %3 = load i32, i32* %table, align 8, !dbg !1272
  %cmp1 = icmp eq i32 %3, 0, !dbg !1273
  br i1 %cmp1, label %if.end, label %if.then, !dbg !1274

if.then:                                          ; preds = %land.lhs.true, %entry
  %4 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1275
  %d = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %4, i32 0, i32 0, !dbg !1276
  %5 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !1276
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 4, !dbg !1277
  %6 = load i32, i32* %iterators, align 4, !dbg !1278
  %dec = add nsw i32 %6, -1, !dbg !1278
  store i32 %dec, i32* %iterators, align 4, !dbg !1278
  br label %if.end, !dbg !1275

if.end:                                           ; preds = %if.then, %land.lhs.true
  %7 = load %struct.dictIterator*, %struct.dictIterator** %iter.addr, align 8, !dbg !1279
  %8 = bitcast %struct.dictIterator* %7 to i8*, !dbg !1279
  call void @_dictFree(i8* noundef %8), !dbg !1280
  ret void, !dbg !1281
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.dictEntry* @dictGetRandomKey(%struct.dict* noundef %d) #0 !dbg !1282 {
entry:
  %retval = alloca %struct.dictEntry*, align 8
  %d.addr = alloca %struct.dict*, align 8
  %he = alloca %struct.dictEntry*, align 8
  %orighe = alloca %struct.dictEntry*, align 8
  %h = alloca i32, align 4
  %listlen = alloca i32, align 4
  %listele = alloca i32, align 4
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1285, metadata !DIExpression()), !dbg !1286
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !1287, metadata !DIExpression()), !dbg !1288
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %orighe, metadata !1289, metadata !DIExpression()), !dbg !1290
  call void @llvm.dbg.declare(metadata i32* %h, metadata !1291, metadata !DIExpression()), !dbg !1292
  call void @llvm.dbg.declare(metadata i32* %listlen, metadata !1293, metadata !DIExpression()), !dbg !1294
  call void @llvm.dbg.declare(metadata i32* %listele, metadata !1295, metadata !DIExpression()), !dbg !1296
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1297
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 2, !dbg !1297
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !1297
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 3, !dbg !1297
  %1 = load i64, i64* %used, align 8, !dbg !1297
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1297
  %ht1 = getelementptr inbounds %struct.dict, %struct.dict* %2, i32 0, i32 2, !dbg !1297
  %arrayidx2 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht1, i64 0, i64 1, !dbg !1297
  %used3 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx2, i32 0, i32 3, !dbg !1297
  %3 = load i64, i64* %used3, align 8, !dbg !1297
  %add = add i64 %1, %3, !dbg !1297
  %cmp = icmp eq i64 %add, 0, !dbg !1299
  br i1 %cmp, label %if.then, label %if.end, !dbg !1300

if.then:                                          ; preds = %entry
  store %struct.dictEntry* null, %struct.dictEntry** %retval, align 8, !dbg !1301
  br label %return, !dbg !1301

if.end:                                           ; preds = %entry
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1302
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %4, i32 0, i32 3, !dbg !1302
  %5 = load i32, i32* %rehashidx, align 8, !dbg !1302
  %cmp4 = icmp ne i32 %5, -1, !dbg !1302
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !1304

if.then5:                                         ; preds = %if.end
  %6 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1305
  call void @_dictRehashStep(%struct.dict* noundef %6), !dbg !1306
  br label %if.end6, !dbg !1306

if.end6:                                          ; preds = %if.then5, %if.end
  %7 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1307
  %rehashidx7 = getelementptr inbounds %struct.dict, %struct.dict* %7, i32 0, i32 3, !dbg !1307
  %8 = load i32, i32* %rehashidx7, align 8, !dbg !1307
  %cmp8 = icmp ne i32 %8, -1, !dbg !1307
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !1309

if.then9:                                         ; preds = %if.end6
  br label %do.body, !dbg !1310

do.body:                                          ; preds = %do.cond, %if.then9
  %call = call i32 (...) @random(), !dbg !1312
  %conv = sext i32 %call to i64, !dbg !1312
  %9 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1314
  %ht10 = getelementptr inbounds %struct.dict, %struct.dict* %9, i32 0, i32 2, !dbg !1315
  %arrayidx11 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht10, i64 0, i64 0, !dbg !1314
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx11, i32 0, i32 1, !dbg !1316
  %10 = load i64, i64* %size, align 8, !dbg !1316
  %11 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1317
  %ht12 = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 2, !dbg !1318
  %arrayidx13 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht12, i64 0, i64 1, !dbg !1317
  %size14 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx13, i32 0, i32 1, !dbg !1319
  %12 = load i64, i64* %size14, align 8, !dbg !1319
  %add15 = add i64 %10, %12, !dbg !1320
  %rem = urem i64 %conv, %add15, !dbg !1321
  %conv16 = trunc i64 %rem to i32, !dbg !1312
  store i32 %conv16, i32* %h, align 4, !dbg !1322
  %13 = load i32, i32* %h, align 4, !dbg !1323
  %conv17 = zext i32 %13 to i64, !dbg !1323
  %14 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1324
  %ht18 = getelementptr inbounds %struct.dict, %struct.dict* %14, i32 0, i32 2, !dbg !1325
  %arrayidx19 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht18, i64 0, i64 0, !dbg !1324
  %size20 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx19, i32 0, i32 1, !dbg !1326
  %15 = load i64, i64* %size20, align 8, !dbg !1326
  %cmp21 = icmp uge i64 %conv17, %15, !dbg !1327
  br i1 %cmp21, label %cond.true, label %cond.false, !dbg !1328

cond.true:                                        ; preds = %do.body
  %16 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1329
  %ht23 = getelementptr inbounds %struct.dict, %struct.dict* %16, i32 0, i32 2, !dbg !1330
  %arrayidx24 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht23, i64 0, i64 1, !dbg !1329
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx24, i32 0, i32 0, !dbg !1331
  %17 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !1331
  %18 = load i32, i32* %h, align 4, !dbg !1332
  %conv25 = zext i32 %18 to i64, !dbg !1332
  %19 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1333
  %ht26 = getelementptr inbounds %struct.dict, %struct.dict* %19, i32 0, i32 2, !dbg !1334
  %arrayidx27 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht26, i64 0, i64 0, !dbg !1333
  %size28 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx27, i32 0, i32 1, !dbg !1335
  %20 = load i64, i64* %size28, align 8, !dbg !1335
  %sub = sub i64 %conv25, %20, !dbg !1336
  %arrayidx29 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %17, i64 %sub, !dbg !1329
  %21 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx29, align 8, !dbg !1329
  br label %cond.end, !dbg !1328

cond.false:                                       ; preds = %do.body
  %22 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1337
  %ht30 = getelementptr inbounds %struct.dict, %struct.dict* %22, i32 0, i32 2, !dbg !1338
  %arrayidx31 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht30, i64 0, i64 0, !dbg !1337
  %table32 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx31, i32 0, i32 0, !dbg !1339
  %23 = load %struct.dictEntry**, %struct.dictEntry*** %table32, align 8, !dbg !1339
  %24 = load i32, i32* %h, align 4, !dbg !1340
  %idxprom = zext i32 %24 to i64, !dbg !1337
  %arrayidx33 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %23, i64 %idxprom, !dbg !1337
  %25 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx33, align 8, !dbg !1337
  br label %cond.end, !dbg !1328

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.dictEntry* [ %21, %cond.true ], [ %25, %cond.false ], !dbg !1328
  store %struct.dictEntry* %cond, %struct.dictEntry** %he, align 8, !dbg !1341
  br label %do.cond, !dbg !1342

do.cond:                                          ; preds = %cond.end
  %26 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1343
  %cmp34 = icmp eq %struct.dictEntry* %26, null, !dbg !1344
  br i1 %cmp34, label %do.body, label %do.end, !dbg !1342, !llvm.loop !1345

do.end:                                           ; preds = %do.cond
  br label %if.end51, !dbg !1347

if.else:                                          ; preds = %if.end6
  br label %do.body36, !dbg !1348

do.body36:                                        ; preds = %do.cond47, %if.else
  %call37 = call i32 (...) @random(), !dbg !1350
  %conv38 = sext i32 %call37 to i64, !dbg !1350
  %27 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1352
  %ht39 = getelementptr inbounds %struct.dict, %struct.dict* %27, i32 0, i32 2, !dbg !1353
  %arrayidx40 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht39, i64 0, i64 0, !dbg !1352
  %sizemask = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx40, i32 0, i32 2, !dbg !1354
  %28 = load i64, i64* %sizemask, align 8, !dbg !1354
  %and = and i64 %conv38, %28, !dbg !1355
  %conv41 = trunc i64 %and to i32, !dbg !1350
  store i32 %conv41, i32* %h, align 4, !dbg !1356
  %29 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1357
  %ht42 = getelementptr inbounds %struct.dict, %struct.dict* %29, i32 0, i32 2, !dbg !1358
  %arrayidx43 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht42, i64 0, i64 0, !dbg !1357
  %table44 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx43, i32 0, i32 0, !dbg !1359
  %30 = load %struct.dictEntry**, %struct.dictEntry*** %table44, align 8, !dbg !1359
  %31 = load i32, i32* %h, align 4, !dbg !1360
  %idxprom45 = zext i32 %31 to i64, !dbg !1357
  %arrayidx46 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %30, i64 %idxprom45, !dbg !1357
  %32 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx46, align 8, !dbg !1357
  store %struct.dictEntry* %32, %struct.dictEntry** %he, align 8, !dbg !1361
  br label %do.cond47, !dbg !1362

do.cond47:                                        ; preds = %do.body36
  %33 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1363
  %cmp48 = icmp eq %struct.dictEntry* %33, null, !dbg !1364
  br i1 %cmp48, label %do.body36, label %do.end50, !dbg !1362, !llvm.loop !1365

do.end50:                                         ; preds = %do.cond47
  br label %if.end51

if.end51:                                         ; preds = %do.end50, %do.end
  store i32 0, i32* %listlen, align 4, !dbg !1367
  %34 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1368
  store %struct.dictEntry* %34, %struct.dictEntry** %orighe, align 8, !dbg !1369
  br label %while.cond, !dbg !1370

while.cond:                                       ; preds = %while.body, %if.end51
  %35 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1371
  %tobool = icmp ne %struct.dictEntry* %35, null, !dbg !1370
  br i1 %tobool, label %while.body, label %while.end, !dbg !1370

while.body:                                       ; preds = %while.cond
  %36 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1372
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %36, i32 0, i32 2, !dbg !1374
  %37 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1374
  store %struct.dictEntry* %37, %struct.dictEntry** %he, align 8, !dbg !1375
  %38 = load i32, i32* %listlen, align 4, !dbg !1376
  %inc = add nsw i32 %38, 1, !dbg !1376
  store i32 %inc, i32* %listlen, align 4, !dbg !1376
  br label %while.cond, !dbg !1370, !llvm.loop !1377

while.end:                                        ; preds = %while.cond
  %call52 = call i32 (...) @random(), !dbg !1379
  %39 = load i32, i32* %listlen, align 4, !dbg !1380
  %rem53 = srem i32 %call52, %39, !dbg !1381
  store i32 %rem53, i32* %listele, align 4, !dbg !1382
  %40 = load %struct.dictEntry*, %struct.dictEntry** %orighe, align 8, !dbg !1383
  store %struct.dictEntry* %40, %struct.dictEntry** %he, align 8, !dbg !1384
  br label %while.cond54, !dbg !1385

while.cond54:                                     ; preds = %while.body56, %while.end
  %41 = load i32, i32* %listele, align 4, !dbg !1386
  %dec = add nsw i32 %41, -1, !dbg !1386
  store i32 %dec, i32* %listele, align 4, !dbg !1386
  %tobool55 = icmp ne i32 %41, 0, !dbg !1385
  br i1 %tobool55, label %while.body56, label %while.end58, !dbg !1385

while.body56:                                     ; preds = %while.cond54
  %42 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1387
  %next57 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %42, i32 0, i32 2, !dbg !1388
  %43 = load %struct.dictEntry*, %struct.dictEntry** %next57, align 8, !dbg !1388
  store %struct.dictEntry* %43, %struct.dictEntry** %he, align 8, !dbg !1389
  br label %while.cond54, !dbg !1385, !llvm.loop !1390

while.end58:                                      ; preds = %while.cond54
  %44 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1391
  store %struct.dictEntry* %44, %struct.dictEntry** %retval, align 8, !dbg !1392
  br label %return, !dbg !1392

return:                                           ; preds = %while.end58, %if.then
  %45 = load %struct.dictEntry*, %struct.dictEntry** %retval, align 8, !dbg !1393
  ret %struct.dictEntry* %45, !dbg !1393
}

declare dso_local i32 @random(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictExpandIfNeeded(%struct.dict* noundef %d) #0 !dbg !1394 {
entry:
  %retval = alloca i32, align 4
  %d.addr = alloca %struct.dict*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1395, metadata !DIExpression()), !dbg !1396
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1397
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 3, !dbg !1397
  %1 = load i32, i32* %rehashidx, align 8, !dbg !1397
  %cmp = icmp ne i32 %1, -1, !dbg !1397
  br i1 %cmp, label %if.then, label %if.end, !dbg !1399

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1400
  br label %return, !dbg !1400

if.end:                                           ; preds = %entry
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1401
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %2, i32 0, i32 2, !dbg !1403
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !1401
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx, i32 0, i32 1, !dbg !1404
  %3 = load i64, i64* %size, align 8, !dbg !1404
  %cmp1 = icmp eq i64 %3, 0, !dbg !1405
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !1406

if.then2:                                         ; preds = %if.end
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1407
  %call = call i32 @dictExpand(%struct.dict* noundef %4, i64 noundef 4), !dbg !1408
  store i32 %call, i32* %retval, align 4, !dbg !1409
  br label %return, !dbg !1409

if.end3:                                          ; preds = %if.end
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1410
  %ht4 = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 2, !dbg !1412
  %arrayidx5 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht4, i64 0, i64 0, !dbg !1410
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx5, i32 0, i32 3, !dbg !1413
  %6 = load i64, i64* %used, align 8, !dbg !1413
  %7 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1414
  %ht6 = getelementptr inbounds %struct.dict, %struct.dict* %7, i32 0, i32 2, !dbg !1415
  %arrayidx7 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht6, i64 0, i64 0, !dbg !1414
  %size8 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx7, i32 0, i32 1, !dbg !1416
  %8 = load i64, i64* %size8, align 8, !dbg !1416
  %cmp9 = icmp uge i64 %6, %8, !dbg !1417
  br i1 %cmp9, label %land.lhs.true, label %if.end25, !dbg !1418

land.lhs.true:                                    ; preds = %if.end3
  %9 = load i32, i32* @dict_can_resize, align 4, !dbg !1419
  %tobool = icmp ne i32 %9, 0, !dbg !1419
  br i1 %tobool, label %if.then10, label %if.end25, !dbg !1420

if.then10:                                        ; preds = %land.lhs.true
  %10 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1421
  %11 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1422
  %ht11 = getelementptr inbounds %struct.dict, %struct.dict* %11, i32 0, i32 2, !dbg !1423
  %arrayidx12 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht11, i64 0, i64 0, !dbg !1422
  %size13 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx12, i32 0, i32 1, !dbg !1424
  %12 = load i64, i64* %size13, align 8, !dbg !1424
  %13 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1425
  %ht14 = getelementptr inbounds %struct.dict, %struct.dict* %13, i32 0, i32 2, !dbg !1426
  %arrayidx15 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht14, i64 0, i64 0, !dbg !1425
  %used16 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx15, i32 0, i32 3, !dbg !1427
  %14 = load i64, i64* %used16, align 8, !dbg !1427
  %cmp17 = icmp ugt i64 %12, %14, !dbg !1428
  br i1 %cmp17, label %cond.true, label %cond.false, !dbg !1429

cond.true:                                        ; preds = %if.then10
  %15 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1430
  %ht18 = getelementptr inbounds %struct.dict, %struct.dict* %15, i32 0, i32 2, !dbg !1431
  %arrayidx19 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht18, i64 0, i64 0, !dbg !1430
  %size20 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx19, i32 0, i32 1, !dbg !1432
  %16 = load i64, i64* %size20, align 8, !dbg !1432
  br label %cond.end, !dbg !1429

cond.false:                                       ; preds = %if.then10
  %17 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1433
  %ht21 = getelementptr inbounds %struct.dict, %struct.dict* %17, i32 0, i32 2, !dbg !1434
  %arrayidx22 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht21, i64 0, i64 0, !dbg !1433
  %used23 = getelementptr inbounds %struct.dictht, %struct.dictht* %arrayidx22, i32 0, i32 3, !dbg !1435
  %18 = load i64, i64* %used23, align 8, !dbg !1435
  br label %cond.end, !dbg !1429

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %16, %cond.true ], [ %18, %cond.false ], !dbg !1429
  %mul = mul i64 %cond, 2, !dbg !1436
  %call24 = call i32 @dictExpand(%struct.dict* noundef %10, i64 noundef %mul), !dbg !1437
  store i32 %call24, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.end25:                                         ; preds = %land.lhs.true, %if.end3
  store i32 0, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

return:                                           ; preds = %if.end25, %cond.end, %if.then2, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !1440
  ret i32 %19, !dbg !1440
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictEmpty(%struct.dict* noundef %d) #0 !dbg !1441 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1442, metadata !DIExpression()), !dbg !1443
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1444
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1445
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 2, !dbg !1446
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !1445
  %call = call i32 @_dictClear(%struct.dict* noundef %0, %struct.dictht* noundef %arrayidx), !dbg !1447
  %2 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1448
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1449
  %ht1 = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !1450
  %arrayidx2 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht1, i64 0, i64 1, !dbg !1449
  %call3 = call i32 @_dictClear(%struct.dict* noundef %2, %struct.dictht* noundef %arrayidx2), !dbg !1451
  %4 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1452
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %4, i32 0, i32 3, !dbg !1453
  store i32 -1, i32* %rehashidx, align 8, !dbg !1454
  %5 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1455
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %5, i32 0, i32 4, !dbg !1456
  store i32 0, i32* %iterators, align 4, !dbg !1457
  ret void, !dbg !1458
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictPrintStatsHt(%struct.dictht* noundef %ht) #0 !dbg !1459 {
entry:
  %ht.addr = alloca %struct.dictht*, align 8
  %i = alloca i64, align 8
  %slots = alloca i64, align 8
  %chainlen = alloca i64, align 8
  %maxchainlen = alloca i64, align 8
  %totchainlen = alloca i64, align 8
  %clvector = alloca [50 x i64], align 16
  %he = alloca %struct.dictEntry*, align 8
  store %struct.dictht* %ht, %struct.dictht** %ht.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dictht** %ht.addr, metadata !1460, metadata !DIExpression()), !dbg !1461
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1462, metadata !DIExpression()), !dbg !1463
  call void @llvm.dbg.declare(metadata i64* %slots, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i64 0, i64* %slots, align 8, !dbg !1465
  call void @llvm.dbg.declare(metadata i64* %chainlen, metadata !1466, metadata !DIExpression()), !dbg !1467
  call void @llvm.dbg.declare(metadata i64* %maxchainlen, metadata !1468, metadata !DIExpression()), !dbg !1469
  store i64 0, i64* %maxchainlen, align 8, !dbg !1469
  call void @llvm.dbg.declare(metadata i64* %totchainlen, metadata !1470, metadata !DIExpression()), !dbg !1471
  store i64 0, i64* %totchainlen, align 8, !dbg !1471
  call void @llvm.dbg.declare(metadata [50 x i64]* %clvector, metadata !1472, metadata !DIExpression()), !dbg !1476
  %0 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1477
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %0, i32 0, i32 3, !dbg !1479
  %1 = load i64, i64* %used, align 8, !dbg !1479
  %cmp = icmp eq i64 %1, 0, !dbg !1480
  br i1 %cmp, label %if.then, label %if.end, !dbg !1481

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i64 0, i64 0)), !dbg !1482
  br label %for.end63, !dbg !1484

if.end:                                           ; preds = %entry
  store i64 0, i64* %i, align 8, !dbg !1485
  br label %for.cond, !dbg !1487

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !1488
  %cmp1 = icmp ult i64 %2, 50, !dbg !1490
  br i1 %cmp1, label %for.body, label %for.end, !dbg !1491

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !1492
  %arrayidx = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %3, !dbg !1493
  store i64 0, i64* %arrayidx, align 8, !dbg !1494
  br label %for.inc, !dbg !1493

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !1495
  %inc = add i64 %4, 1, !dbg !1495
  store i64 %inc, i64* %i, align 8, !dbg !1495
  br label %for.cond, !dbg !1496, !llvm.loop !1497

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %i, align 8, !dbg !1499
  br label %for.cond2, !dbg !1501

for.cond2:                                        ; preds = %for.inc21, %for.end
  %5 = load i64, i64* %i, align 8, !dbg !1502
  %6 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1504
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %6, i32 0, i32 1, !dbg !1505
  %7 = load i64, i64* %size, align 8, !dbg !1505
  %cmp3 = icmp ult i64 %5, %7, !dbg !1506
  br i1 %cmp3, label %for.body4, label %for.end23, !dbg !1507

for.body4:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata %struct.dictEntry** %he, metadata !1508, metadata !DIExpression()), !dbg !1510
  %8 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1511
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %8, i32 0, i32 0, !dbg !1513
  %9 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !1513
  %10 = load i64, i64* %i, align 8, !dbg !1514
  %arrayidx5 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %9, i64 %10, !dbg !1511
  %11 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx5, align 8, !dbg !1511
  %cmp6 = icmp eq %struct.dictEntry* %11, null, !dbg !1515
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !1516

if.then7:                                         ; preds = %for.body4
  %arrayidx8 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 0, !dbg !1517
  %12 = load i64, i64* %arrayidx8, align 16, !dbg !1519
  %inc9 = add i64 %12, 1, !dbg !1519
  store i64 %inc9, i64* %arrayidx8, align 16, !dbg !1519
  br label %for.inc21, !dbg !1520

if.end10:                                         ; preds = %for.body4
  %13 = load i64, i64* %slots, align 8, !dbg !1521
  %inc11 = add i64 %13, 1, !dbg !1521
  store i64 %inc11, i64* %slots, align 8, !dbg !1521
  store i64 0, i64* %chainlen, align 8, !dbg !1522
  %14 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1523
  %table12 = getelementptr inbounds %struct.dictht, %struct.dictht* %14, i32 0, i32 0, !dbg !1524
  %15 = load %struct.dictEntry**, %struct.dictEntry*** %table12, align 8, !dbg !1524
  %16 = load i64, i64* %i, align 8, !dbg !1525
  %arrayidx13 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %15, i64 %16, !dbg !1523
  %17 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx13, align 8, !dbg !1523
  store %struct.dictEntry* %17, %struct.dictEntry** %he, align 8, !dbg !1526
  br label %while.cond, !dbg !1527

while.cond:                                       ; preds = %while.body, %if.end10
  %18 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1528
  %tobool = icmp ne %struct.dictEntry* %18, null, !dbg !1527
  br i1 %tobool, label %while.body, label %while.end, !dbg !1527

while.body:                                       ; preds = %while.cond
  %19 = load i64, i64* %chainlen, align 8, !dbg !1529
  %inc14 = add i64 %19, 1, !dbg !1529
  store i64 %inc14, i64* %chainlen, align 8, !dbg !1529
  %20 = load %struct.dictEntry*, %struct.dictEntry** %he, align 8, !dbg !1531
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %20, i32 0, i32 2, !dbg !1532
  %21 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1532
  store %struct.dictEntry* %21, %struct.dictEntry** %he, align 8, !dbg !1533
  br label %while.cond, !dbg !1527, !llvm.loop !1534

while.end:                                        ; preds = %while.cond
  %22 = load i64, i64* %chainlen, align 8, !dbg !1536
  %cmp15 = icmp ult i64 %22, 50, !dbg !1537
  br i1 %cmp15, label %cond.true, label %cond.false, !dbg !1538

cond.true:                                        ; preds = %while.end
  %23 = load i64, i64* %chainlen, align 8, !dbg !1539
  br label %cond.end, !dbg !1538

cond.false:                                       ; preds = %while.end
  br label %cond.end, !dbg !1538

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %23, %cond.true ], [ 49, %cond.false ], !dbg !1538
  %arrayidx16 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %cond, !dbg !1540
  %24 = load i64, i64* %arrayidx16, align 8, !dbg !1541
  %inc17 = add i64 %24, 1, !dbg !1541
  store i64 %inc17, i64* %arrayidx16, align 8, !dbg !1541
  %25 = load i64, i64* %chainlen, align 8, !dbg !1542
  %26 = load i64, i64* %maxchainlen, align 8, !dbg !1544
  %cmp18 = icmp ugt i64 %25, %26, !dbg !1545
  br i1 %cmp18, label %if.then19, label %if.end20, !dbg !1546

if.then19:                                        ; preds = %cond.end
  %27 = load i64, i64* %chainlen, align 8, !dbg !1547
  store i64 %27, i64* %maxchainlen, align 8, !dbg !1548
  br label %if.end20, !dbg !1549

if.end20:                                         ; preds = %if.then19, %cond.end
  %28 = load i64, i64* %chainlen, align 8, !dbg !1550
  %29 = load i64, i64* %totchainlen, align 8, !dbg !1551
  %add = add i64 %29, %28, !dbg !1551
  store i64 %add, i64* %totchainlen, align 8, !dbg !1551
  br label %for.inc21, !dbg !1552

for.inc21:                                        ; preds = %if.end20, %if.then7
  %30 = load i64, i64* %i, align 8, !dbg !1553
  %inc22 = add i64 %30, 1, !dbg !1553
  store i64 %inc22, i64* %i, align 8, !dbg !1553
  br label %for.cond2, !dbg !1554, !llvm.loop !1555

for.end23:                                        ; preds = %for.cond2
  %call24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0)), !dbg !1557
  %31 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1558
  %size25 = getelementptr inbounds %struct.dictht, %struct.dictht* %31, i32 0, i32 1, !dbg !1559
  %32 = load i64, i64* %size25, align 8, !dbg !1559
  %call26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i64 0, i64 0), i64 noundef %32), !dbg !1560
  %33 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1561
  %used27 = getelementptr inbounds %struct.dictht, %struct.dictht* %33, i32 0, i32 3, !dbg !1562
  %34 = load i64, i64* %used27, align 8, !dbg !1562
  %call28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0), i64 noundef %34), !dbg !1563
  %35 = load i64, i64* %slots, align 8, !dbg !1564
  %call29 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 noundef %35), !dbg !1565
  %36 = load i64, i64* %maxchainlen, align 8, !dbg !1566
  %call30 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), i64 noundef %36), !dbg !1567
  %37 = load i64, i64* %totchainlen, align 8, !dbg !1568
  %conv = uitofp i64 %37 to float, !dbg !1569
  %38 = load i64, i64* %slots, align 8, !dbg !1570
  %conv31 = uitofp i64 %38 to float, !dbg !1570
  %div = fdiv float %conv, %conv31, !dbg !1571
  %conv32 = fpext float %div to double, !dbg !1569
  %call33 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), double noundef %conv32), !dbg !1572
  %39 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1573
  %used34 = getelementptr inbounds %struct.dictht, %struct.dictht* %39, i32 0, i32 3, !dbg !1574
  %40 = load i64, i64* %used34, align 8, !dbg !1574
  %conv35 = uitofp i64 %40 to float, !dbg !1575
  %41 = load i64, i64* %slots, align 8, !dbg !1576
  %conv36 = uitofp i64 %41 to float, !dbg !1576
  %div37 = fdiv float %conv35, %conv36, !dbg !1577
  %conv38 = fpext float %div37 to double, !dbg !1575
  %call39 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0), double noundef %conv38), !dbg !1578
  %call40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !1579
  store i64 0, i64* %i, align 8, !dbg !1580
  br label %for.cond41, !dbg !1582

for.cond41:                                       ; preds = %for.inc61, %for.end23
  %42 = load i64, i64* %i, align 8, !dbg !1583
  %cmp42 = icmp ult i64 %42, 49, !dbg !1585
  br i1 %cmp42, label %for.body44, label %for.end63, !dbg !1586

for.body44:                                       ; preds = %for.cond41
  %43 = load i64, i64* %i, align 8, !dbg !1587
  %arrayidx45 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %43, !dbg !1590
  %44 = load i64, i64* %arrayidx45, align 8, !dbg !1590
  %cmp46 = icmp eq i64 %44, 0, !dbg !1591
  br i1 %cmp46, label %if.then48, label %if.end49, !dbg !1592

if.then48:                                        ; preds = %for.body44
  br label %for.inc61, !dbg !1593

if.end49:                                         ; preds = %for.body44
  %45 = load i64, i64* %i, align 8, !dbg !1594
  %cmp50 = icmp eq i64 %45, 49, !dbg !1595
  %46 = zext i1 %cmp50 to i64, !dbg !1596
  %cond52 = select i1 %cmp50, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i64 0, i64 0), !dbg !1596
  %47 = load i64, i64* %i, align 8, !dbg !1597
  %48 = load i64, i64* %i, align 8, !dbg !1598
  %arrayidx53 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %48, !dbg !1599
  %49 = load i64, i64* %arrayidx53, align 8, !dbg !1599
  %50 = load i64, i64* %i, align 8, !dbg !1600
  %arrayidx54 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %50, !dbg !1601
  %51 = load i64, i64* %arrayidx54, align 8, !dbg !1601
  %conv55 = uitofp i64 %51 to float, !dbg !1602
  %52 = load %struct.dictht*, %struct.dictht** %ht.addr, align 8, !dbg !1603
  %size56 = getelementptr inbounds %struct.dictht, %struct.dictht* %52, i32 0, i32 1, !dbg !1604
  %53 = load i64, i64* %size56, align 8, !dbg !1604
  %conv57 = uitofp i64 %53 to float, !dbg !1603
  %div58 = fdiv float %conv55, %conv57, !dbg !1605
  %mul = fmul float %div58, 1.000000e+02, !dbg !1606
  %conv59 = fpext float %mul to double, !dbg !1607
  %call60 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0), i8* noundef %cond52, i64 noundef %47, i64 noundef %49, double noundef %conv59), !dbg !1608
  br label %for.inc61, !dbg !1609

for.inc61:                                        ; preds = %if.end49, %if.then48
  %54 = load i64, i64* %i, align 8, !dbg !1610
  %inc62 = add i64 %54, 1, !dbg !1610
  store i64 %inc62, i64* %i, align 8, !dbg !1610
  br label %for.cond41, !dbg !1611, !llvm.loop !1612

for.end63:                                        ; preds = %if.then, %for.cond41
  ret void, !dbg !1614
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictPrintStats(%struct.dict* noundef %d) #0 !dbg !1615 {
entry:
  %d.addr = alloca %struct.dict*, align 8
  store %struct.dict* %d, %struct.dict** %d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dict** %d.addr, metadata !1616, metadata !DIExpression()), !dbg !1617
  %0 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1618
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %0, i32 0, i32 2, !dbg !1619
  %arrayidx = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, !dbg !1618
  call void @_dictPrintStatsHt(%struct.dictht* noundef %arrayidx), !dbg !1620
  %1 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1621
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %1, i32 0, i32 3, !dbg !1621
  %2 = load i32, i32* %rehashidx, align 8, !dbg !1621
  %cmp = icmp ne i32 %2, -1, !dbg !1621
  br i1 %cmp, label %if.then, label %if.end, !dbg !1623

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.15, i64 0, i64 0)), !dbg !1624
  %3 = load %struct.dict*, %struct.dict** %d.addr, align 8, !dbg !1626
  %ht1 = getelementptr inbounds %struct.dict, %struct.dict* %3, i32 0, i32 2, !dbg !1627
  %arrayidx2 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht1, i64 0, i64 1, !dbg !1626
  call void @_dictPrintStatsHt(%struct.dictht* noundef %arrayidx2), !dbg !1628
  br label %if.end, !dbg !1629

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !1630
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictEnableResize() #0 !dbg !1631 {
entry:
  store i32 1, i32* @dict_can_resize, align 4, !dbg !1632
  ret void, !dbg !1633
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dictDisableResize() #0 !dbg !1634 {
entry:
  store i32 0, i32* @dict_can_resize, align 4, !dbg !1635
  ret void, !dbg !1636
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictStringCopyHTHashFunction(i8* noundef %key) #0 !dbg !1637 {
entry:
  %key.addr = alloca i8*, align 8
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1638, metadata !DIExpression()), !dbg !1639
  %0 = load i8*, i8** %key.addr, align 8, !dbg !1640
  %1 = load i8*, i8** %key.addr, align 8, !dbg !1641
  %call = call i64 @strlen(i8* noundef %1) #11, !dbg !1642
  %conv = trunc i64 %call to i32, !dbg !1642
  %call1 = call i32 @dictGenHashFunction(i8* noundef %0, i32 noundef %conv), !dbg !1643
  ret i32 %call1, !dbg !1644
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8* noundef) #7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_dictStringCopyHTKeyDup(i8* noundef %privdata, i8* noundef %key) #0 !dbg !1645 {
entry:
  %privdata.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %len = alloca i32, align 4
  %copy = alloca i8*, align 8
  store i8* %privdata, i8** %privdata.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privdata.addr, metadata !1646, metadata !DIExpression()), !dbg !1647
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1648, metadata !DIExpression()), !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %len, metadata !1650, metadata !DIExpression()), !dbg !1651
  %0 = load i8*, i8** %key.addr, align 8, !dbg !1652
  %call = call i64 @strlen(i8* noundef %0) #11, !dbg !1653
  %conv = trunc i64 %call to i32, !dbg !1653
  store i32 %conv, i32* %len, align 4, !dbg !1651
  call void @llvm.dbg.declare(metadata i8** %copy, metadata !1654, metadata !DIExpression()), !dbg !1655
  %1 = load i32, i32* %len, align 4, !dbg !1656
  %add = add nsw i32 %1, 1, !dbg !1657
  %conv1 = sext i32 %add to i64, !dbg !1656
  %call2 = call i8* @_dictAlloc(i64 noundef %conv1), !dbg !1658
  store i8* %call2, i8** %copy, align 8, !dbg !1655
  %2 = load i8*, i8** %privdata.addr, align 8, !dbg !1659
  %3 = load i8*, i8** %copy, align 8, !dbg !1660
  %4 = load i8*, i8** %key.addr, align 8, !dbg !1661
  %5 = load i32, i32* %len, align 4, !dbg !1662
  %conv3 = sext i32 %5 to i64, !dbg !1662
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 %conv3, i1 false), !dbg !1663
  %6 = load i8*, i8** %copy, align 8, !dbg !1664
  %7 = load i32, i32* %len, align 4, !dbg !1665
  %idxprom = sext i32 %7 to i64, !dbg !1664
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %idxprom, !dbg !1664
  store i8 0, i8* %arrayidx, align 1, !dbg !1666
  %8 = load i8*, i8** %copy, align 8, !dbg !1667
  ret i8* %8, !dbg !1668
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @_dictStringKeyValCopyHTValDup(i8* noundef %privdata, i8* noundef %val) #0 !dbg !1669 {
entry:
  %privdata.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %len = alloca i32, align 4
  %copy = alloca i8*, align 8
  store i8* %privdata, i8** %privdata.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privdata.addr, metadata !1670, metadata !DIExpression()), !dbg !1671
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !1672, metadata !DIExpression()), !dbg !1673
  call void @llvm.dbg.declare(metadata i32* %len, metadata !1674, metadata !DIExpression()), !dbg !1675
  %0 = load i8*, i8** %val.addr, align 8, !dbg !1676
  %call = call i64 @strlen(i8* noundef %0) #11, !dbg !1677
  %conv = trunc i64 %call to i32, !dbg !1677
  store i32 %conv, i32* %len, align 4, !dbg !1675
  call void @llvm.dbg.declare(metadata i8** %copy, metadata !1678, metadata !DIExpression()), !dbg !1679
  %1 = load i32, i32* %len, align 4, !dbg !1680
  %add = add nsw i32 %1, 1, !dbg !1681
  %conv1 = sext i32 %add to i64, !dbg !1680
  %call2 = call i8* @_dictAlloc(i64 noundef %conv1), !dbg !1682
  store i8* %call2, i8** %copy, align 8, !dbg !1679
  %2 = load i8*, i8** %privdata.addr, align 8, !dbg !1683
  %3 = load i8*, i8** %copy, align 8, !dbg !1684
  %4 = load i8*, i8** %val.addr, align 8, !dbg !1685
  %5 = load i32, i32* %len, align 4, !dbg !1686
  %conv3 = sext i32 %5 to i64, !dbg !1686
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 %conv3, i1 false), !dbg !1687
  %6 = load i8*, i8** %copy, align 8, !dbg !1688
  %7 = load i32, i32* %len, align 4, !dbg !1689
  %idxprom = sext i32 %7 to i64, !dbg !1688
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %idxprom, !dbg !1688
  store i8 0, i8* %arrayidx, align 1, !dbg !1690
  %8 = load i8*, i8** %copy, align 8, !dbg !1691
  ret i8* %8, !dbg !1692
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_dictStringCopyHTKeyCompare(i8* noundef %privdata, i8* noundef %key1, i8* noundef %key2) #0 !dbg !1693 {
entry:
  %privdata.addr = alloca i8*, align 8
  %key1.addr = alloca i8*, align 8
  %key2.addr = alloca i8*, align 8
  store i8* %privdata, i8** %privdata.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privdata.addr, metadata !1694, metadata !DIExpression()), !dbg !1695
  store i8* %key1, i8** %key1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key1.addr, metadata !1696, metadata !DIExpression()), !dbg !1697
  store i8* %key2, i8** %key2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key2.addr, metadata !1698, metadata !DIExpression()), !dbg !1699
  %0 = load i8*, i8** %privdata.addr, align 8, !dbg !1700
  %1 = load i8*, i8** %key1.addr, align 8, !dbg !1701
  %2 = load i8*, i8** %key2.addr, align 8, !dbg !1702
  %call = call i32 @strcmp(i8* noundef %1, i8* noundef %2) #11, !dbg !1703
  %cmp = icmp eq i32 %call, 0, !dbg !1704
  %conv = zext i1 %cmp to i32, !dbg !1704
  ret i32 %conv, !dbg !1705
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strcmp(i8* noundef, i8* noundef) #7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictStringCopyHTKeyDestructor(i8* noundef %privdata, i8* noundef %key) #0 !dbg !1706 {
entry:
  %privdata.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  store i8* %privdata, i8** %privdata.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privdata.addr, metadata !1707, metadata !DIExpression()), !dbg !1708
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !1709, metadata !DIExpression()), !dbg !1710
  %0 = load i8*, i8** %privdata.addr, align 8, !dbg !1711
  %1 = load i8*, i8** %key.addr, align 8, !dbg !1712
  call void @_dictFree(i8* noundef %1), !dbg !1713
  ret void, !dbg !1714
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_dictStringKeyValCopyHTValDestructor(i8* noundef %privdata, i8* noundef %val) #0 !dbg !1715 {
entry:
  %privdata.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  store i8* %privdata, i8** %privdata.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %privdata.addr, metadata !1716, metadata !DIExpression()), !dbg !1717
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !1718, metadata !DIExpression()), !dbg !1719
  %0 = load i8*, i8** %privdata.addr, align 8, !dbg !1720
  %1 = load i8*, i8** %val.addr, align 8, !dbg !1721
  call void @_dictFree(i8* noundef %1), !dbg !1722
  ret void, !dbg !1723
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #8

declare dso_local i32 @vfprintf(%struct._IO_FILE* noundef, i8* noundef, %struct.__va_list_tag* noundef) #2

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #8

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nosync nounwind willreturn }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }
attributes #11 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!83, !84, !85, !86, !87}
!llvm.ident = !{!88}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "used_memory", scope: !2, file: !3, line: 44, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "Redis.c", directory: "/home/user/Desktop/spoq/redis", checksumkind: CSK_MD5, checksum: "07bfedd24198ee6fe9608bc828be1080")
!4 = !{!5, !9, !11, !12, !13, !14}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !8)
!7 = !DIFile(filename: "osdi23-paper114-ae/verification/IR2Json/llvm/lib/clang/14.0.0/include/stddef.h", directory: "/home/user/Desktop/spoq", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!15 = !{!0, !16, !18, !51, !53, !79, !81}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "zmalloc_thread_safe", scope: !2, file: !3, line: 45, type: !13, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "used_memory_mutex", scope: !2, file: !3, line: 46, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !21, line: 72, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !21, line: 67, size: 320, elements: !23)
!23 = !{!24, !45, !49}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !22, file: !21, line: 69, baseType: !25, size: 320)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !26, line: 22, size: 320, elements: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "", checksumkind: CSK_MD5, checksum: "584baedd80e6041b81caae7f496091c0")
!27 = !{!28, !29, !31, !32, !33, !34, !36, !37}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !25, file: !26, line: 24, baseType: !13, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !25, file: !26, line: 25, baseType: !30, size: 32, offset: 32)
!30 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !25, file: !26, line: 26, baseType: !13, size: 32, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !25, file: !26, line: 28, baseType: !30, size: 32, offset: 96)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !25, file: !26, line: 32, baseType: !13, size: 32, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !25, file: !26, line: 34, baseType: !35, size: 16, offset: 160)
!35 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !25, file: !26, line: 35, baseType: !35, size: 16, offset: 176)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !25, file: !26, line: 36, baseType: !38, size: 128, offset: 192)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !39, line: 55, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "", checksumkind: CSK_MD5, checksum: "04c81e86d34dad9c99ad006d32e47a0d")
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !39, line: 51, size: 128, elements: !41)
!41 = !{!42, !44}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !40, file: !39, line: 53, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !40, file: !39, line: 54, baseType: !43, size: 64, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !22, file: !21, line: 70, baseType: !46, size: 320)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 40)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !22, file: !21, line: 71, baseType: !50, size: 64)
!50 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "dict_can_resize", scope: !2, file: !3, line: 145, type: !13, isLocal: false, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "dictTypeHeapStringCopyKey", scope: !2, file: !3, line: 792, type: !55, isLocal: false, isDefinition: true)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictType", file: !56, line: 58, baseType: !57)
!56 = !DIFile(filename: "./dict.h", directory: "/home/user/Desktop/spoq/redis", checksumkind: CSK_MD5, checksum: "b8b7e1319e2afa32704af21432f9ee20")
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictType", file: !56, line: 51, size: 384, elements: !58)
!58 = !{!59, !65, !69, !70, !74, !78}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "hashFunction", scope: !57, file: !56, line: 52, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DISubroutineType(types: !62)
!62 = !{!30, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "keyDup", scope: !57, file: !56, line: 53, baseType: !66, size: 64, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DISubroutineType(types: !68)
!68 = !{!11, !11, !63}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "valDup", scope: !57, file: !56, line: 54, baseType: !66, size: 64, offset: 128)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "keyCompare", scope: !57, file: !56, line: 55, baseType: !71, size: 64, offset: 192)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DISubroutineType(types: !73)
!73 = !{!13, !11, !63, !63}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "keyDestructor", scope: !57, file: !56, line: 56, baseType: !75, size: 64, offset: 256)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !11, !11}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "valDestructor", scope: !57, file: !56, line: 57, baseType: !75, size: 64, offset: 320)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(name: "dictTypeHeapStrings", scope: !2, file: !3, line: 803, type: !55, isLocal: false, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "dictTypeHeapStringCopyKeyValue", scope: !2, file: !3, line: 814, type: !55, isLocal: false, isDefinition: true)
!83 = !{i32 7, !"Dwarf Version", i32 5}
!84 = !{i32 2, !"Debug Info Version", i32 3}
!85 = !{i32 1, !"wchar_size", i32 4}
!86 = !{i32 7, !"uwtable", i32 1}
!87 = !{i32 7, !"frame-pointer", i32 2}
!88 = !{!"clang version 14.0.0"}
!89 = distinct !DISubprogram(name: "zmalloc_oom", scope: !3, file: !3, line: 48, type: !90, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!90 = !DISubroutineType(types: !91)
!91 = !{null, !6}
!92 = !{}
!93 = !DILocalVariable(name: "size", arg: 1, scope: !89, file: !3, line: 48, type: !6)
!94 = !DILocation(line: 48, column: 25, scope: !89)
!95 = !DILocation(line: 49, column: 13, scope: !89)
!96 = !DILocation(line: 50, column: 9, scope: !89)
!97 = !DILocation(line: 49, column: 5, scope: !89)
!98 = !DILocation(line: 51, column: 12, scope: !89)
!99 = !DILocation(line: 51, column: 5, scope: !89)
!100 = !DILocation(line: 52, column: 5, scope: !89)
!101 = distinct !DISubprogram(name: "zmalloc", scope: !3, file: !3, line: 55, type: !102, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!102 = !DISubroutineType(types: !103)
!103 = !{!11, !6}
!104 = !DILocalVariable(name: "size", arg: 1, scope: !101, file: !3, line: 55, type: !6)
!105 = !DILocation(line: 55, column: 22, scope: !101)
!106 = !DILocalVariable(name: "ptr", scope: !101, file: !3, line: 56, type: !11)
!107 = !DILocation(line: 56, column: 11, scope: !101)
!108 = !DILocation(line: 56, column: 24, scope: !101)
!109 = !DILocation(line: 56, column: 28, scope: !101)
!110 = !DILocation(line: 56, column: 17, scope: !101)
!111 = !DILocation(line: 58, column: 10, scope: !112)
!112 = distinct !DILexicalBlock(scope: !101, file: !3, line: 58, column: 9)
!113 = !DILocation(line: 58, column: 9, scope: !101)
!114 = !DILocation(line: 58, column: 27, scope: !112)
!115 = !DILocation(line: 58, column: 15, scope: !112)
!116 = !DILocation(line: 63, column: 23, scope: !101)
!117 = !DILocation(line: 63, column: 16, scope: !101)
!118 = !DILocation(line: 63, column: 7, scope: !101)
!119 = !DILocation(line: 63, column: 21, scope: !101)
!120 = !DILocation(line: 64, column: 5, scope: !101)
!121 = !DILocalVariable(name: "_n", scope: !122, file: !3, line: 64, type: !6)
!122 = distinct !DILexicalBlock(scope: !101, file: !3, line: 64, column: 5)
!123 = !DILocation(line: 64, column: 5, scope: !122)
!124 = !DILocation(line: 64, column: 5, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !3, line: 64, column: 5)
!126 = !DILocation(line: 64, column: 5, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !3, line: 64, column: 5)
!128 = !DILocation(line: 64, column: 5, scope: !129)
!129 = distinct !DILexicalBlock(scope: !127, file: !3, line: 64, column: 5)
!130 = !DILocation(line: 64, column: 5, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 64, column: 5)
!132 = !DILocation(line: 65, column: 19, scope: !101)
!133 = !DILocation(line: 65, column: 22, scope: !101)
!134 = !DILocation(line: 65, column: 5, scope: !101)
!135 = distinct !DISubprogram(name: "zfree", scope: !3, file: !3, line: 69, type: !136, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!136 = !DISubroutineType(types: !137)
!137 = !{null, !11}
!138 = !DILocalVariable(name: "ptr", arg: 1, scope: !135, file: !3, line: 69, type: !11)
!139 = !DILocation(line: 69, column: 18, scope: !135)
!140 = !DILocalVariable(name: "realptr", scope: !135, file: !3, line: 71, type: !11)
!141 = !DILocation(line: 71, column: 11, scope: !135)
!142 = !DILocalVariable(name: "oldsize", scope: !135, file: !3, line: 72, type: !6)
!143 = !DILocation(line: 72, column: 12, scope: !135)
!144 = !DILocation(line: 75, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !3, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 13, scope: !145)
!147 = !DILocation(line: 75, column: 9, scope: !135)
!148 = !DILocation(line: 75, column: 22, scope: !145)
!149 = !DILocation(line: 80, column: 22, scope: !135)
!150 = !DILocation(line: 80, column: 25, scope: !135)
!151 = !DILocation(line: 80, column: 13, scope: !135)
!152 = !DILocation(line: 81, column: 26, scope: !135)
!153 = !DILocation(line: 81, column: 17, scope: !135)
!154 = !DILocation(line: 81, column: 15, scope: !135)
!155 = !DILocation(line: 81, column: 13, scope: !135)
!156 = !DILocation(line: 82, column: 5, scope: !135)
!157 = !DILocalVariable(name: "_n", scope: !158, file: !3, line: 82, type: !6)
!158 = distinct !DILexicalBlock(scope: !135, file: !3, line: 82, column: 5)
!159 = !DILocation(line: 82, column: 5, scope: !158)
!160 = !DILocation(line: 82, column: 5, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 82, column: 5)
!162 = !DILocation(line: 82, column: 5, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !3, line: 82, column: 5)
!164 = !DILocation(line: 82, column: 5, scope: !165)
!165 = distinct !DILexicalBlock(scope: !163, file: !3, line: 82, column: 5)
!166 = !DILocation(line: 82, column: 5, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !3, line: 82, column: 5)
!168 = !DILocation(line: 83, column: 10, scope: !135)
!169 = !DILocation(line: 83, column: 5, scope: !135)
!170 = !DILocation(line: 85, column: 1, scope: !135)
!171 = distinct !DISubprogram(name: "test", scope: !3, file: !3, line: 136, type: !172, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!172 = !DISubroutineType(types: !173)
!173 = !{null}
!174 = !DILocation(line: 138, column: 5, scope: !171)
!175 = !DILocation(line: 139, column: 1, scope: !171)
!176 = distinct !DISubprogram(name: "_dictAlloc", scope: !3, file: !3, line: 162, type: !102, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!177 = !DILocalVariable(name: "size", arg: 1, scope: !176, file: !3, line: 162, type: !6)
!178 = !DILocation(line: 162, column: 25, scope: !176)
!179 = !DILocalVariable(name: "p", scope: !176, file: !3, line: 164, type: !11)
!180 = !DILocation(line: 164, column: 11, scope: !176)
!181 = !DILocation(line: 164, column: 23, scope: !176)
!182 = !DILocation(line: 164, column: 15, scope: !176)
!183 = !DILocation(line: 165, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !176, file: !3, line: 165, column: 9)
!185 = !DILocation(line: 165, column: 11, scope: !184)
!186 = !DILocation(line: 165, column: 9, scope: !176)
!187 = !DILocation(line: 166, column: 9, scope: !184)
!188 = !DILocation(line: 167, column: 12, scope: !176)
!189 = !DILocation(line: 167, column: 5, scope: !176)
!190 = distinct !DISubprogram(name: "_dictPanic", scope: !3, file: !3, line: 149, type: !191, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !92)
!191 = !DISubroutineType(types: !192)
!192 = !{null, !193, null}
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!195 = !DILocalVariable(name: "fmt", arg: 1, scope: !190, file: !3, line: 149, type: !193)
!196 = !DILocation(line: 149, column: 36, scope: !190)
!197 = !DILocalVariable(name: "ap", scope: !190, file: !3, line: 151, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !199, line: 14, baseType: !200)
!199 = !DIFile(filename: "osdi23-paper114-ae/verification/IR2Json/llvm/lib/clang/14.0.0/include/stdarg.h", directory: "/home/user/Desktop/spoq", checksumkind: CSK_MD5, checksum: "4de3cbd931b589d291e5c39387aecf82")
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !201, baseType: !202)
!201 = !DIFile(filename: "Redis.c", directory: "/home/user/Desktop/spoq/redis")
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 192, elements: !209)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !204)
!204 = !{!205, !206, !207, !208}
!205 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !203, file: !201, line: 151, baseType: !30, size: 32)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !203, file: !201, line: 151, baseType: !30, size: 32, offset: 32)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !203, file: !201, line: 151, baseType: !11, size: 64, offset: 64)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !203, file: !201, line: 151, baseType: !11, size: 64, offset: 128)
!209 = !{!210}
!210 = !DISubrange(count: 1)
!211 = !DILocation(line: 151, column: 13, scope: !190)
!212 = !DILocation(line: 153, column: 5, scope: !190)
!213 = !DILocation(line: 154, column: 13, scope: !190)
!214 = !DILocation(line: 154, column: 5, scope: !190)
!215 = !DILocation(line: 155, column: 14, scope: !190)
!216 = !DILocation(line: 155, column: 22, scope: !190)
!217 = !DILocation(line: 155, column: 27, scope: !190)
!218 = !DILocation(line: 155, column: 5, scope: !190)
!219 = !DILocation(line: 156, column: 13, scope: !190)
!220 = !DILocation(line: 156, column: 5, scope: !190)
!221 = !DILocation(line: 157, column: 5, scope: !190)
!222 = !DILocation(line: 158, column: 1, scope: !190)
!223 = distinct !DISubprogram(name: "_dictFree", scope: !3, file: !3, line: 170, type: !136, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!224 = !DILocalVariable(name: "ptr", arg: 1, scope: !223, file: !3, line: 170, type: !11)
!225 = !DILocation(line: 170, column: 22, scope: !223)
!226 = !DILocation(line: 171, column: 11, scope: !223)
!227 = !DILocation(line: 171, column: 5, scope: !223)
!228 = !DILocation(line: 172, column: 1, scope: !223)
!229 = distinct !DISubprogram(name: "dictIntHashFunction", scope: !3, file: !3, line: 186, type: !230, scopeLine: 187, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!230 = !DISubroutineType(types: !231)
!231 = !{!30, !30}
!232 = !DILocalVariable(name: "key", arg: 1, scope: !229, file: !3, line: 186, type: !30)
!233 = !DILocation(line: 186, column: 47, scope: !229)
!234 = !DILocation(line: 188, column: 12, scope: !229)
!235 = !DILocation(line: 188, column: 9, scope: !229)
!236 = !DILocation(line: 189, column: 11, scope: !229)
!237 = !DILocation(line: 189, column: 9, scope: !229)
!238 = !DILocation(line: 190, column: 14, scope: !229)
!239 = !DILocation(line: 190, column: 18, scope: !229)
!240 = !DILocation(line: 190, column: 9, scope: !229)
!241 = !DILocation(line: 191, column: 11, scope: !229)
!242 = !DILocation(line: 191, column: 9, scope: !229)
!243 = !DILocation(line: 192, column: 12, scope: !229)
!244 = !DILocation(line: 192, column: 9, scope: !229)
!245 = !DILocation(line: 193, column: 11, scope: !229)
!246 = !DILocation(line: 193, column: 9, scope: !229)
!247 = !DILocation(line: 194, column: 12, scope: !229)
!248 = !DILocation(line: 194, column: 5, scope: !229)
!249 = distinct !DISubprogram(name: "dictIdentityHashFunction", scope: !3, file: !3, line: 198, type: !230, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!250 = !DILocalVariable(name: "key", arg: 1, scope: !249, file: !3, line: 198, type: !30)
!251 = !DILocation(line: 198, column: 52, scope: !249)
!252 = !DILocation(line: 200, column: 12, scope: !249)
!253 = !DILocation(line: 200, column: 5, scope: !249)
!254 = distinct !DISubprogram(name: "dictGenHashFunction", scope: !3, file: !3, line: 205, type: !255, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!255 = !DISubroutineType(types: !256)
!256 = !{!30, !257, !13}
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !259)
!259 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!260 = !DILocalVariable(name: "buf", arg: 1, scope: !254, file: !3, line: 205, type: !257)
!261 = !DILocation(line: 205, column: 55, scope: !254)
!262 = !DILocalVariable(name: "len", arg: 2, scope: !254, file: !3, line: 205, type: !13)
!263 = !DILocation(line: 205, column: 64, scope: !254)
!264 = !DILocalVariable(name: "hash", scope: !254, file: !3, line: 206, type: !30)
!265 = !DILocation(line: 206, column: 18, scope: !254)
!266 = !DILocation(line: 208, column: 5, scope: !254)
!267 = !DILocation(line: 208, column: 15, scope: !254)
!268 = !DILocation(line: 209, column: 18, scope: !254)
!269 = !DILocation(line: 209, column: 23, scope: !254)
!270 = !DILocation(line: 209, column: 31, scope: !254)
!271 = !DILocation(line: 209, column: 29, scope: !254)
!272 = !DILocation(line: 209, column: 44, scope: !254)
!273 = !DILocation(line: 209, column: 40, scope: !254)
!274 = !DILocation(line: 209, column: 39, scope: !254)
!275 = !DILocation(line: 209, column: 37, scope: !254)
!276 = !DILocation(line: 209, column: 14, scope: !254)
!277 = distinct !{!277, !266, !278}
!278 = !DILocation(line: 209, column: 46, scope: !254)
!279 = !DILocation(line: 210, column: 12, scope: !254)
!280 = !DILocation(line: 210, column: 5, scope: !254)
!281 = distinct !DISubprogram(name: "_dictReset", scope: !3, file: !3, line: 217, type: !282, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!282 = !DISubroutineType(types: !283)
!283 = !{null, !284}
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 64)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictht", file: !56, line: 67, baseType: !286)
!286 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictht", file: !56, line: 62, size: 256, elements: !287)
!287 = !{!288, !298, !299, !300}
!288 = !DIDerivedType(tag: DW_TAG_member, name: "table", scope: !286, file: !56, line: 63, baseType: !289, size: 64)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictEntry", file: !56, line: 49, baseType: !292)
!292 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictEntry", file: !56, line: 45, size: 192, elements: !293)
!293 = !{!294, !295, !296}
!294 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !292, file: !56, line: 46, baseType: !11, size: 64)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !292, file: !56, line: 47, baseType: !11, size: 64, offset: 64)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !292, file: !56, line: 48, baseType: !297, size: 64, offset: 128)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !292, size: 64)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !286, file: !56, line: 64, baseType: !8, size: 64, offset: 64)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "sizemask", scope: !286, file: !56, line: 65, baseType: !8, size: 64, offset: 128)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "used", scope: !286, file: !56, line: 66, baseType: !8, size: 64, offset: 192)
!301 = !DILocalVariable(name: "ht", arg: 1, scope: !281, file: !3, line: 217, type: !284)
!302 = !DILocation(line: 217, column: 25, scope: !281)
!303 = !DILocation(line: 219, column: 5, scope: !281)
!304 = !DILocation(line: 219, column: 9, scope: !281)
!305 = !DILocation(line: 219, column: 15, scope: !281)
!306 = !DILocation(line: 220, column: 5, scope: !281)
!307 = !DILocation(line: 220, column: 9, scope: !281)
!308 = !DILocation(line: 220, column: 14, scope: !281)
!309 = !DILocation(line: 221, column: 5, scope: !281)
!310 = !DILocation(line: 221, column: 9, scope: !281)
!311 = !DILocation(line: 221, column: 18, scope: !281)
!312 = !DILocation(line: 222, column: 5, scope: !281)
!313 = !DILocation(line: 222, column: 9, scope: !281)
!314 = !DILocation(line: 222, column: 14, scope: !281)
!315 = !DILocation(line: 223, column: 1, scope: !281)
!316 = distinct !DISubprogram(name: "dictCreate", scope: !3, file: !3, line: 226, type: !317, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!317 = !DISubroutineType(types: !318)
!318 = !{!319, !324, !11}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "dict", file: !56, line: 75, baseType: !321)
!321 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dict", file: !56, line: 69, size: 704, elements: !322)
!322 = !{!323, !325, !326, !330, !331}
!323 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !321, file: !56, line: 70, baseType: !324, size: 64)
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "privdata", scope: !321, file: !56, line: 71, baseType: !11, size: 64, offset: 64)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "ht", scope: !321, file: !56, line: 72, baseType: !327, size: 512, offset: 128)
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !285, size: 512, elements: !328)
!328 = !{!329}
!329 = !DISubrange(count: 2)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "rehashidx", scope: !321, file: !56, line: 73, baseType: !13, size: 32, offset: 640)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "iterators", scope: !321, file: !56, line: 74, baseType: !13, size: 32, offset: 672)
!332 = !DILocalVariable(name: "type", arg: 1, scope: !316, file: !3, line: 226, type: !324)
!333 = !DILocation(line: 226, column: 28, scope: !316)
!334 = !DILocalVariable(name: "privDataPtr", arg: 2, scope: !316, file: !3, line: 227, type: !11)
!335 = !DILocation(line: 227, column: 15, scope: !316)
!336 = !DILocalVariable(name: "d", scope: !316, file: !3, line: 229, type: !319)
!337 = !DILocation(line: 229, column: 11, scope: !316)
!338 = !DILocation(line: 229, column: 15, scope: !316)
!339 = !DILocation(line: 231, column: 15, scope: !316)
!340 = !DILocation(line: 231, column: 17, scope: !316)
!341 = !DILocation(line: 231, column: 22, scope: !316)
!342 = !DILocation(line: 231, column: 5, scope: !316)
!343 = !DILocation(line: 232, column: 12, scope: !316)
!344 = !DILocation(line: 232, column: 5, scope: !316)
!345 = distinct !DISubprogram(name: "_dictInit", scope: !3, file: !3, line: 236, type: !346, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!346 = !DISubroutineType(types: !347)
!347 = !{!13, !319, !324, !11}
!348 = !DILocalVariable(name: "d", arg: 1, scope: !345, file: !3, line: 236, type: !319)
!349 = !DILocation(line: 236, column: 21, scope: !345)
!350 = !DILocalVariable(name: "type", arg: 2, scope: !345, file: !3, line: 236, type: !324)
!351 = !DILocation(line: 236, column: 34, scope: !345)
!352 = !DILocalVariable(name: "privDataPtr", arg: 3, scope: !345, file: !3, line: 237, type: !11)
!353 = !DILocation(line: 237, column: 15, scope: !345)
!354 = !DILocation(line: 239, column: 17, scope: !345)
!355 = !DILocation(line: 239, column: 20, scope: !345)
!356 = !DILocation(line: 239, column: 5, scope: !345)
!357 = !DILocation(line: 240, column: 17, scope: !345)
!358 = !DILocation(line: 240, column: 20, scope: !345)
!359 = !DILocation(line: 240, column: 5, scope: !345)
!360 = !DILocation(line: 241, column: 15, scope: !345)
!361 = !DILocation(line: 241, column: 5, scope: !345)
!362 = !DILocation(line: 241, column: 8, scope: !345)
!363 = !DILocation(line: 241, column: 13, scope: !345)
!364 = !DILocation(line: 242, column: 19, scope: !345)
!365 = !DILocation(line: 242, column: 5, scope: !345)
!366 = !DILocation(line: 242, column: 8, scope: !345)
!367 = !DILocation(line: 242, column: 17, scope: !345)
!368 = !DILocation(line: 243, column: 5, scope: !345)
!369 = !DILocation(line: 243, column: 8, scope: !345)
!370 = !DILocation(line: 243, column: 18, scope: !345)
!371 = !DILocation(line: 244, column: 5, scope: !345)
!372 = !DILocation(line: 244, column: 8, scope: !345)
!373 = !DILocation(line: 244, column: 18, scope: !345)
!374 = !DILocation(line: 245, column: 5, scope: !345)
!375 = distinct !DISubprogram(name: "dictResize", scope: !3, file: !3, line: 250, type: !376, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!376 = !DISubroutineType(types: !377)
!377 = !{!13, !319}
!378 = !DILocalVariable(name: "d", arg: 1, scope: !375, file: !3, line: 250, type: !319)
!379 = !DILocation(line: 250, column: 22, scope: !375)
!380 = !DILocalVariable(name: "minimal", scope: !375, file: !3, line: 252, type: !13)
!381 = !DILocation(line: 252, column: 9, scope: !375)
!382 = !DILocation(line: 254, column: 10, scope: !383)
!383 = distinct !DILexicalBlock(scope: !375, file: !3, line: 254, column: 9)
!384 = !DILocation(line: 254, column: 26, scope: !383)
!385 = !DILocation(line: 254, column: 29, scope: !383)
!386 = !DILocation(line: 254, column: 9, scope: !375)
!387 = !DILocation(line: 254, column: 49, scope: !383)
!388 = !DILocation(line: 255, column: 15, scope: !375)
!389 = !DILocation(line: 255, column: 18, scope: !375)
!390 = !DILocation(line: 255, column: 24, scope: !375)
!391 = !DILocation(line: 255, column: 13, scope: !375)
!392 = !DILocation(line: 256, column: 9, scope: !393)
!393 = distinct !DILexicalBlock(scope: !375, file: !3, line: 256, column: 9)
!394 = !DILocation(line: 256, column: 17, scope: !393)
!395 = !DILocation(line: 256, column: 9, scope: !375)
!396 = !DILocation(line: 257, column: 17, scope: !393)
!397 = !DILocation(line: 257, column: 9, scope: !393)
!398 = !DILocation(line: 258, column: 23, scope: !375)
!399 = !DILocation(line: 258, column: 26, scope: !375)
!400 = !DILocation(line: 258, column: 12, scope: !375)
!401 = !DILocation(line: 258, column: 5, scope: !375)
!402 = !DILocation(line: 259, column: 1, scope: !375)
!403 = distinct !DISubprogram(name: "dictExpand", scope: !3, file: !3, line: 262, type: !404, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!404 = !DISubroutineType(types: !405)
!405 = !{!13, !319, !8}
!406 = !DILocalVariable(name: "d", arg: 1, scope: !403, file: !3, line: 262, type: !319)
!407 = !DILocation(line: 262, column: 22, scope: !403)
!408 = !DILocalVariable(name: "size", arg: 2, scope: !403, file: !3, line: 262, type: !8)
!409 = !DILocation(line: 262, column: 39, scope: !403)
!410 = !DILocalVariable(name: "n", scope: !403, file: !3, line: 264, type: !285)
!411 = !DILocation(line: 264, column: 12, scope: !403)
!412 = !DILocalVariable(name: "realsize", scope: !403, file: !3, line: 265, type: !8)
!413 = !DILocation(line: 265, column: 19, scope: !403)
!414 = !DILocation(line: 265, column: 45, scope: !403)
!415 = !DILocation(line: 265, column: 30, scope: !403)
!416 = !DILocation(line: 269, column: 9, scope: !417)
!417 = distinct !DILexicalBlock(scope: !403, file: !3, line: 269, column: 9)
!418 = !DILocation(line: 269, column: 28, scope: !417)
!419 = !DILocation(line: 269, column: 31, scope: !417)
!420 = !DILocation(line: 269, column: 34, scope: !417)
!421 = !DILocation(line: 269, column: 40, scope: !417)
!422 = !DILocation(line: 269, column: 47, scope: !417)
!423 = !DILocation(line: 269, column: 45, scope: !417)
!424 = !DILocation(line: 269, column: 9, scope: !403)
!425 = !DILocation(line: 270, column: 9, scope: !417)
!426 = !DILocation(line: 272, column: 14, scope: !403)
!427 = !DILocation(line: 272, column: 7, scope: !403)
!428 = !DILocation(line: 272, column: 12, scope: !403)
!429 = !DILocation(line: 273, column: 18, scope: !403)
!430 = !DILocation(line: 273, column: 26, scope: !403)
!431 = !DILocation(line: 273, column: 7, scope: !403)
!432 = !DILocation(line: 273, column: 16, scope: !403)
!433 = !DILocation(line: 274, column: 26, scope: !403)
!434 = !DILocation(line: 274, column: 34, scope: !403)
!435 = !DILocation(line: 274, column: 15, scope: !403)
!436 = !DILocation(line: 274, column: 7, scope: !403)
!437 = !DILocation(line: 274, column: 13, scope: !403)
!438 = !DILocation(line: 275, column: 7, scope: !403)
!439 = !DILocation(line: 275, column: 12, scope: !403)
!440 = !DILocation(line: 278, column: 14, scope: !403)
!441 = !DILocation(line: 278, column: 5, scope: !403)
!442 = !DILocation(line: 278, column: 24, scope: !403)
!443 = !DILocation(line: 278, column: 32, scope: !403)
!444 = !DILocation(line: 282, column: 9, scope: !445)
!445 = distinct !DILexicalBlock(scope: !403, file: !3, line: 282, column: 9)
!446 = !DILocation(line: 282, column: 12, scope: !445)
!447 = !DILocation(line: 282, column: 18, scope: !445)
!448 = !DILocation(line: 282, column: 24, scope: !445)
!449 = !DILocation(line: 282, column: 9, scope: !403)
!450 = !DILocation(line: 283, column: 9, scope: !451)
!451 = distinct !DILexicalBlock(scope: !445, file: !3, line: 282, column: 33)
!452 = !DILocation(line: 283, column: 12, scope: !451)
!453 = !DILocation(line: 283, column: 20, scope: !451)
!454 = !DILocation(line: 284, column: 9, scope: !451)
!455 = !DILocation(line: 288, column: 5, scope: !403)
!456 = !DILocation(line: 288, column: 8, scope: !403)
!457 = !DILocation(line: 288, column: 16, scope: !403)
!458 = !DILocation(line: 289, column: 5, scope: !403)
!459 = !DILocation(line: 289, column: 8, scope: !403)
!460 = !DILocation(line: 289, column: 18, scope: !403)
!461 = !DILocation(line: 290, column: 5, scope: !403)
!462 = !DILocation(line: 291, column: 1, scope: !403)
!463 = distinct !DISubprogram(name: "_dictNextPower", scope: !3, file: !3, line: 631, type: !464, scopeLine: 632, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!464 = !DISubroutineType(types: !465)
!465 = !{!8, !8}
!466 = !DILocalVariable(name: "size", arg: 1, scope: !463, file: !3, line: 631, type: !8)
!467 = !DILocation(line: 631, column: 44, scope: !463)
!468 = !DILocalVariable(name: "i", scope: !463, file: !3, line: 633, type: !8)
!469 = !DILocation(line: 633, column: 19, scope: !463)
!470 = !DILocation(line: 635, column: 9, scope: !471)
!471 = distinct !DILexicalBlock(scope: !463, file: !3, line: 635, column: 9)
!472 = !DILocation(line: 635, column: 14, scope: !471)
!473 = !DILocation(line: 635, column: 9, scope: !463)
!474 = !DILocation(line: 635, column: 27, scope: !471)
!475 = !DILocation(line: 636, column: 5, scope: !463)
!476 = !DILocation(line: 637, column: 13, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !3, line: 637, column: 13)
!478 = distinct !DILexicalBlock(scope: !463, file: !3, line: 636, column: 14)
!479 = !DILocation(line: 637, column: 18, scope: !477)
!480 = !DILocation(line: 637, column: 15, scope: !477)
!481 = !DILocation(line: 637, column: 13, scope: !478)
!482 = !DILocation(line: 638, column: 20, scope: !477)
!483 = !DILocation(line: 638, column: 13, scope: !477)
!484 = !DILocation(line: 639, column: 11, scope: !478)
!485 = distinct !{!485, !475, !486}
!486 = !DILocation(line: 640, column: 5, scope: !463)
!487 = !DILocation(line: 641, column: 1, scope: !463)
!488 = distinct !DISubprogram(name: "dictRehash", scope: !3, file: !3, line: 297, type: !489, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!489 = !DISubroutineType(types: !490)
!490 = !{!13, !319, !13}
!491 = !DILocalVariable(name: "d", arg: 1, scope: !488, file: !3, line: 297, type: !319)
!492 = !DILocation(line: 297, column: 22, scope: !488)
!493 = !DILocalVariable(name: "n", arg: 2, scope: !488, file: !3, line: 297, type: !13)
!494 = !DILocation(line: 297, column: 29, scope: !488)
!495 = !DILocation(line: 298, column: 10, scope: !496)
!496 = distinct !DILexicalBlock(scope: !488, file: !3, line: 298, column: 9)
!497 = !DILocation(line: 298, column: 9, scope: !488)
!498 = !DILocation(line: 298, column: 30, scope: !496)
!499 = !DILocation(line: 300, column: 5, scope: !488)
!500 = !DILocation(line: 300, column: 12, scope: !488)
!501 = !DILocalVariable(name: "de", scope: !502, file: !3, line: 301, type: !290)
!502 = distinct !DILexicalBlock(scope: !488, file: !3, line: 300, column: 16)
!503 = !DILocation(line: 301, column: 20, scope: !502)
!504 = !DILocalVariable(name: "nextde", scope: !502, file: !3, line: 301, type: !290)
!505 = !DILocation(line: 301, column: 25, scope: !502)
!506 = !DILocation(line: 304, column: 13, scope: !507)
!507 = distinct !DILexicalBlock(scope: !502, file: !3, line: 304, column: 13)
!508 = !DILocation(line: 304, column: 16, scope: !507)
!509 = !DILocation(line: 304, column: 22, scope: !507)
!510 = !DILocation(line: 304, column: 27, scope: !507)
!511 = !DILocation(line: 304, column: 13, scope: !502)
!512 = !DILocation(line: 305, column: 23, scope: !513)
!513 = distinct !DILexicalBlock(scope: !507, file: !3, line: 304, column: 33)
!514 = !DILocation(line: 305, column: 26, scope: !513)
!515 = !DILocation(line: 305, column: 32, scope: !513)
!516 = !DILocation(line: 305, column: 13, scope: !513)
!517 = !DILocation(line: 306, column: 13, scope: !513)
!518 = !DILocation(line: 306, column: 16, scope: !513)
!519 = !DILocation(line: 306, column: 24, scope: !513)
!520 = !DILocation(line: 306, column: 27, scope: !513)
!521 = !DILocation(line: 307, column: 25, scope: !513)
!522 = !DILocation(line: 307, column: 28, scope: !513)
!523 = !DILocation(line: 307, column: 13, scope: !513)
!524 = !DILocation(line: 308, column: 13, scope: !513)
!525 = !DILocation(line: 308, column: 16, scope: !513)
!526 = !DILocation(line: 308, column: 26, scope: !513)
!527 = !DILocation(line: 309, column: 13, scope: !513)
!528 = !DILocation(line: 314, column: 9, scope: !502)
!529 = !DILocation(line: 314, column: 15, scope: !502)
!530 = !DILocation(line: 314, column: 18, scope: !502)
!531 = !DILocation(line: 314, column: 24, scope: !502)
!532 = !DILocation(line: 314, column: 30, scope: !502)
!533 = !DILocation(line: 314, column: 33, scope: !502)
!534 = !DILocation(line: 314, column: 44, scope: !502)
!535 = !DILocation(line: 314, column: 53, scope: !502)
!536 = !DILocation(line: 314, column: 56, scope: !502)
!537 = !DILocation(line: 314, column: 65, scope: !502)
!538 = distinct !{!538, !528, !537}
!539 = !DILocation(line: 315, column: 14, scope: !502)
!540 = !DILocation(line: 315, column: 17, scope: !502)
!541 = !DILocation(line: 315, column: 23, scope: !502)
!542 = !DILocation(line: 315, column: 29, scope: !502)
!543 = !DILocation(line: 315, column: 32, scope: !502)
!544 = !DILocation(line: 315, column: 12, scope: !502)
!545 = !DILocation(line: 317, column: 9, scope: !502)
!546 = !DILocation(line: 317, column: 15, scope: !502)
!547 = !DILocalVariable(name: "h", scope: !548, file: !3, line: 318, type: !30)
!548 = distinct !DILexicalBlock(scope: !502, file: !3, line: 317, column: 19)
!549 = !DILocation(line: 318, column: 26, scope: !548)
!550 = !DILocation(line: 320, column: 22, scope: !548)
!551 = !DILocation(line: 320, column: 26, scope: !548)
!552 = !DILocation(line: 320, column: 20, scope: !548)
!553 = !DILocation(line: 322, column: 17, scope: !548)
!554 = !DILocation(line: 322, column: 43, scope: !548)
!555 = !DILocation(line: 322, column: 46, scope: !548)
!556 = !DILocation(line: 322, column: 52, scope: !548)
!557 = !DILocation(line: 322, column: 41, scope: !548)
!558 = !DILocation(line: 322, column: 15, scope: !548)
!559 = !DILocation(line: 323, column: 24, scope: !548)
!560 = !DILocation(line: 323, column: 27, scope: !548)
!561 = !DILocation(line: 323, column: 33, scope: !548)
!562 = !DILocation(line: 323, column: 39, scope: !548)
!563 = !DILocation(line: 323, column: 13, scope: !548)
!564 = !DILocation(line: 323, column: 17, scope: !548)
!565 = !DILocation(line: 323, column: 22, scope: !548)
!566 = !DILocation(line: 324, column: 33, scope: !548)
!567 = !DILocation(line: 324, column: 13, scope: !548)
!568 = !DILocation(line: 324, column: 16, scope: !548)
!569 = !DILocation(line: 324, column: 22, scope: !548)
!570 = !DILocation(line: 324, column: 28, scope: !548)
!571 = !DILocation(line: 324, column: 31, scope: !548)
!572 = !DILocation(line: 325, column: 13, scope: !548)
!573 = !DILocation(line: 325, column: 16, scope: !548)
!574 = !DILocation(line: 325, column: 22, scope: !548)
!575 = !DILocation(line: 325, column: 26, scope: !548)
!576 = !DILocation(line: 326, column: 13, scope: !548)
!577 = !DILocation(line: 326, column: 16, scope: !548)
!578 = !DILocation(line: 326, column: 22, scope: !548)
!579 = !DILocation(line: 326, column: 26, scope: !548)
!580 = !DILocation(line: 327, column: 18, scope: !548)
!581 = !DILocation(line: 327, column: 16, scope: !548)
!582 = distinct !{!582, !545, !583}
!583 = !DILocation(line: 328, column: 9, scope: !502)
!584 = !DILocation(line: 329, column: 9, scope: !502)
!585 = !DILocation(line: 329, column: 12, scope: !502)
!586 = !DILocation(line: 329, column: 18, scope: !502)
!587 = !DILocation(line: 329, column: 24, scope: !502)
!588 = !DILocation(line: 329, column: 27, scope: !502)
!589 = !DILocation(line: 329, column: 38, scope: !502)
!590 = !DILocation(line: 330, column: 9, scope: !502)
!591 = !DILocation(line: 330, column: 12, scope: !502)
!592 = !DILocation(line: 330, column: 21, scope: !502)
!593 = distinct !{!593, !499, !594}
!594 = !DILocation(line: 331, column: 5, scope: !488)
!595 = !DILocation(line: 332, column: 5, scope: !488)
!596 = !DILocation(line: 333, column: 1, scope: !488)
!597 = distinct !DISubprogram(name: "timeInMilliseconds", scope: !3, file: !3, line: 335, type: !598, scopeLine: 335, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!598 = !DISubroutineType(types: !599)
!599 = !{!12}
!600 = !DILocalVariable(name: "tv", scope: !597, file: !3, line: 336, type: !601)
!601 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !602, line: 8, size: 128, elements: !603)
!602 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!603 = !{!604, !607}
!604 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !601, file: !602, line: 14, baseType: !605, size: 64)
!605 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !606, line: 160, baseType: !50)
!606 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!607 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !601, file: !602, line: 15, baseType: !608, size: 64, offset: 64)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !606, line: 162, baseType: !50)
!609 = !DILocation(line: 336, column: 20, scope: !597)
!610 = !DILocation(line: 338, column: 5, scope: !597)
!611 = !DILocation(line: 339, column: 28, scope: !597)
!612 = !DILocation(line: 339, column: 35, scope: !597)
!613 = !DILocation(line: 339, column: 46, scope: !597)
!614 = !DILocation(line: 339, column: 53, scope: !597)
!615 = !DILocation(line: 339, column: 41, scope: !597)
!616 = !DILocation(line: 339, column: 5, scope: !597)
!617 = distinct !DISubprogram(name: "dictRehashMilliseconds", scope: !3, file: !3, line: 343, type: !489, scopeLine: 343, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!618 = !DILocalVariable(name: "d", arg: 1, scope: !617, file: !3, line: 343, type: !319)
!619 = !DILocation(line: 343, column: 34, scope: !617)
!620 = !DILocalVariable(name: "ms", arg: 2, scope: !617, file: !3, line: 343, type: !13)
!621 = !DILocation(line: 343, column: 41, scope: !617)
!622 = !DILocalVariable(name: "start", scope: !617, file: !3, line: 344, type: !12)
!623 = !DILocation(line: 344, column: 15, scope: !617)
!624 = !DILocation(line: 344, column: 23, scope: !617)
!625 = !DILocalVariable(name: "rehashes", scope: !617, file: !3, line: 345, type: !13)
!626 = !DILocation(line: 345, column: 9, scope: !617)
!627 = !DILocation(line: 347, column: 5, scope: !617)
!628 = !DILocation(line: 347, column: 22, scope: !617)
!629 = !DILocation(line: 347, column: 11, scope: !617)
!630 = !DILocation(line: 348, column: 18, scope: !631)
!631 = distinct !DILexicalBlock(scope: !617, file: !3, line: 347, column: 30)
!632 = !DILocation(line: 349, column: 13, scope: !633)
!633 = distinct !DILexicalBlock(scope: !631, file: !3, line: 349, column: 13)
!634 = !DILocation(line: 349, column: 34, scope: !633)
!635 = !DILocation(line: 349, column: 33, scope: !633)
!636 = !DILocation(line: 349, column: 42, scope: !633)
!637 = !DILocation(line: 349, column: 40, scope: !633)
!638 = !DILocation(line: 349, column: 13, scope: !631)
!639 = !DILocation(line: 349, column: 46, scope: !633)
!640 = distinct !{!640, !627, !641}
!641 = !DILocation(line: 350, column: 5, scope: !617)
!642 = !DILocation(line: 351, column: 12, scope: !617)
!643 = !DILocation(line: 351, column: 5, scope: !617)
!644 = distinct !DISubprogram(name: "_dictRehashStep", scope: !3, file: !3, line: 362, type: !645, scopeLine: 362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!645 = !DISubroutineType(types: !646)
!646 = !{null, !319}
!647 = !DILocalVariable(name: "d", arg: 1, scope: !644, file: !3, line: 362, type: !319)
!648 = !DILocation(line: 362, column: 28, scope: !644)
!649 = !DILocation(line: 363, column: 9, scope: !650)
!650 = distinct !DILexicalBlock(scope: !644, file: !3, line: 363, column: 9)
!651 = !DILocation(line: 363, column: 12, scope: !650)
!652 = !DILocation(line: 363, column: 22, scope: !650)
!653 = !DILocation(line: 363, column: 9, scope: !644)
!654 = !DILocation(line: 363, column: 39, scope: !650)
!655 = !DILocation(line: 363, column: 28, scope: !650)
!656 = !DILocation(line: 364, column: 1, scope: !644)
!657 = distinct !DISubprogram(name: "dictAdd", scope: !3, file: !3, line: 367, type: !658, scopeLine: 368, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!658 = !DISubroutineType(types: !659)
!659 = !{!13, !319, !11, !11}
!660 = !DILocalVariable(name: "d", arg: 1, scope: !657, file: !3, line: 367, type: !319)
!661 = !DILocation(line: 367, column: 19, scope: !657)
!662 = !DILocalVariable(name: "key", arg: 2, scope: !657, file: !3, line: 367, type: !11)
!663 = !DILocation(line: 367, column: 28, scope: !657)
!664 = !DILocalVariable(name: "val", arg: 3, scope: !657, file: !3, line: 367, type: !11)
!665 = !DILocation(line: 367, column: 39, scope: !657)
!666 = !DILocalVariable(name: "index", scope: !657, file: !3, line: 369, type: !13)
!667 = !DILocation(line: 369, column: 9, scope: !657)
!668 = !DILocalVariable(name: "entry", scope: !657, file: !3, line: 370, type: !290)
!669 = !DILocation(line: 370, column: 16, scope: !657)
!670 = !DILocalVariable(name: "ht", scope: !657, file: !3, line: 371, type: !284)
!671 = !DILocation(line: 371, column: 13, scope: !657)
!672 = !DILocation(line: 373, column: 9, scope: !673)
!673 = distinct !DILexicalBlock(scope: !657, file: !3, line: 373, column: 9)
!674 = !DILocation(line: 373, column: 9, scope: !657)
!675 = !DILocation(line: 373, column: 45, scope: !673)
!676 = !DILocation(line: 373, column: 29, scope: !673)
!677 = !DILocation(line: 377, column: 32, scope: !678)
!678 = distinct !DILexicalBlock(scope: !657, file: !3, line: 377, column: 9)
!679 = !DILocation(line: 377, column: 35, scope: !678)
!680 = !DILocation(line: 377, column: 18, scope: !678)
!681 = !DILocation(line: 377, column: 16, scope: !678)
!682 = !DILocation(line: 377, column: 41, scope: !678)
!683 = !DILocation(line: 377, column: 9, scope: !657)
!684 = !DILocation(line: 378, column: 9, scope: !678)
!685 = !DILocation(line: 381, column: 10, scope: !657)
!686 = !DILocation(line: 381, column: 32, scope: !657)
!687 = !DILocation(line: 381, column: 35, scope: !657)
!688 = !DILocation(line: 381, column: 44, scope: !657)
!689 = !DILocation(line: 381, column: 47, scope: !657)
!690 = !DILocation(line: 381, column: 8, scope: !657)
!691 = !DILocation(line: 382, column: 13, scope: !657)
!692 = !DILocation(line: 382, column: 11, scope: !657)
!693 = !DILocation(line: 383, column: 19, scope: !657)
!694 = !DILocation(line: 383, column: 23, scope: !657)
!695 = !DILocation(line: 383, column: 29, scope: !657)
!696 = !DILocation(line: 383, column: 5, scope: !657)
!697 = !DILocation(line: 383, column: 12, scope: !657)
!698 = !DILocation(line: 383, column: 17, scope: !657)
!699 = !DILocation(line: 384, column: 24, scope: !657)
!700 = !DILocation(line: 384, column: 5, scope: !657)
!701 = !DILocation(line: 384, column: 9, scope: !657)
!702 = !DILocation(line: 384, column: 15, scope: !657)
!703 = !DILocation(line: 384, column: 22, scope: !657)
!704 = !DILocation(line: 385, column: 5, scope: !657)
!705 = !DILocation(line: 385, column: 9, scope: !657)
!706 = !DILocation(line: 385, column: 13, scope: !657)
!707 = !DILocation(line: 388, column: 5, scope: !657)
!708 = !DILocation(line: 388, column: 5, scope: !709)
!709 = distinct !DILexicalBlock(scope: !710, file: !3, line: 388, column: 5)
!710 = distinct !DILexicalBlock(scope: !657, file: !3, line: 388, column: 5)
!711 = !DILocation(line: 388, column: 5, scope: !710)
!712 = !DILocation(line: 389, column: 5, scope: !657)
!713 = !DILocation(line: 389, column: 5, scope: !714)
!714 = distinct !DILexicalBlock(scope: !715, file: !3, line: 389, column: 5)
!715 = distinct !DILexicalBlock(scope: !657, file: !3, line: 389, column: 5)
!716 = !DILocation(line: 389, column: 5, scope: !715)
!717 = !DILocation(line: 390, column: 5, scope: !657)
!718 = !DILocation(line: 391, column: 1, scope: !657)
!719 = distinct !DISubprogram(name: "_dictKeyIndex", scope: !3, file: !3, line: 649, type: !720, scopeLine: 650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!720 = !DISubroutineType(types: !721)
!721 = !{!13, !319, !63}
!722 = !DILocalVariable(name: "d", arg: 1, scope: !719, file: !3, line: 649, type: !319)
!723 = !DILocation(line: 649, column: 25, scope: !719)
!724 = !DILocalVariable(name: "key", arg: 2, scope: !719, file: !3, line: 649, type: !63)
!725 = !DILocation(line: 649, column: 40, scope: !719)
!726 = !DILocalVariable(name: "h", scope: !719, file: !3, line: 651, type: !30)
!727 = !DILocation(line: 651, column: 18, scope: !719)
!728 = !DILocalVariable(name: "idx", scope: !719, file: !3, line: 651, type: !30)
!729 = !DILocation(line: 651, column: 21, scope: !719)
!730 = !DILocalVariable(name: "table", scope: !719, file: !3, line: 651, type: !30)
!731 = !DILocation(line: 651, column: 26, scope: !719)
!732 = !DILocalVariable(name: "he", scope: !719, file: !3, line: 652, type: !290)
!733 = !DILocation(line: 652, column: 16, scope: !719)
!734 = !DILocation(line: 655, column: 29, scope: !735)
!735 = distinct !DILexicalBlock(scope: !719, file: !3, line: 655, column: 9)
!736 = !DILocation(line: 655, column: 9, scope: !735)
!737 = !DILocation(line: 655, column: 32, scope: !735)
!738 = !DILocation(line: 655, column: 9, scope: !719)
!739 = !DILocation(line: 656, column: 9, scope: !735)
!740 = !DILocation(line: 658, column: 9, scope: !719)
!741 = !DILocation(line: 658, column: 7, scope: !719)
!742 = !DILocation(line: 659, column: 16, scope: !743)
!743 = distinct !DILexicalBlock(scope: !719, file: !3, line: 659, column: 5)
!744 = !DILocation(line: 659, column: 10, scope: !743)
!745 = !DILocation(line: 659, column: 21, scope: !746)
!746 = distinct !DILexicalBlock(scope: !743, file: !3, line: 659, column: 5)
!747 = !DILocation(line: 659, column: 27, scope: !746)
!748 = !DILocation(line: 659, column: 5, scope: !743)
!749 = !DILocation(line: 660, column: 15, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !3, line: 659, column: 42)
!751 = !DILocation(line: 660, column: 19, scope: !750)
!752 = !DILocation(line: 660, column: 22, scope: !750)
!753 = !DILocation(line: 660, column: 25, scope: !750)
!754 = !DILocation(line: 660, column: 32, scope: !750)
!755 = !DILocation(line: 660, column: 17, scope: !750)
!756 = !DILocation(line: 660, column: 13, scope: !750)
!757 = !DILocation(line: 662, column: 14, scope: !750)
!758 = !DILocation(line: 662, column: 17, scope: !750)
!759 = !DILocation(line: 662, column: 20, scope: !750)
!760 = !DILocation(line: 662, column: 27, scope: !750)
!761 = !DILocation(line: 662, column: 33, scope: !750)
!762 = !DILocation(line: 662, column: 12, scope: !750)
!763 = !DILocation(line: 663, column: 9, scope: !750)
!764 = !DILocation(line: 663, column: 15, scope: !750)
!765 = !DILocation(line: 664, column: 17, scope: !766)
!766 = distinct !DILexicalBlock(scope: !767, file: !3, line: 664, column: 17)
!767 = distinct !DILexicalBlock(scope: !750, file: !3, line: 663, column: 19)
!768 = !DILocation(line: 664, column: 17, scope: !767)
!769 = !DILocation(line: 665, column: 17, scope: !766)
!770 = !DILocation(line: 666, column: 18, scope: !767)
!771 = !DILocation(line: 666, column: 22, scope: !767)
!772 = !DILocation(line: 666, column: 16, scope: !767)
!773 = distinct !{!773, !763, !774}
!774 = !DILocation(line: 667, column: 9, scope: !750)
!775 = !DILocation(line: 668, column: 14, scope: !776)
!776 = distinct !DILexicalBlock(scope: !750, file: !3, line: 668, column: 13)
!777 = !DILocation(line: 668, column: 13, scope: !750)
!778 = !DILocation(line: 668, column: 34, scope: !776)
!779 = !DILocation(line: 669, column: 5, scope: !750)
!780 = !DILocation(line: 659, column: 38, scope: !746)
!781 = !DILocation(line: 659, column: 5, scope: !746)
!782 = distinct !{!782, !748, !783}
!783 = !DILocation(line: 669, column: 5, scope: !743)
!784 = !DILocation(line: 670, column: 12, scope: !719)
!785 = !DILocation(line: 670, column: 5, scope: !719)
!786 = !DILocation(line: 671, column: 1, scope: !719)
!787 = distinct !DISubprogram(name: "dictReplace", scope: !3, file: !3, line: 397, type: !658, scopeLine: 398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!788 = !DILocalVariable(name: "d", arg: 1, scope: !787, file: !3, line: 397, type: !319)
!789 = !DILocation(line: 397, column: 23, scope: !787)
!790 = !DILocalVariable(name: "key", arg: 2, scope: !787, file: !3, line: 397, type: !11)
!791 = !DILocation(line: 397, column: 32, scope: !787)
!792 = !DILocalVariable(name: "val", arg: 3, scope: !787, file: !3, line: 397, type: !11)
!793 = !DILocation(line: 397, column: 43, scope: !787)
!794 = !DILocalVariable(name: "entry", scope: !787, file: !3, line: 399, type: !290)
!795 = !DILocation(line: 399, column: 16, scope: !787)
!796 = !DILocalVariable(name: "auxentry", scope: !787, file: !3, line: 399, type: !291)
!797 = !DILocation(line: 399, column: 23, scope: !787)
!798 = !DILocation(line: 403, column: 17, scope: !799)
!799 = distinct !DILexicalBlock(scope: !787, file: !3, line: 403, column: 9)
!800 = !DILocation(line: 403, column: 20, scope: !799)
!801 = !DILocation(line: 403, column: 25, scope: !799)
!802 = !DILocation(line: 403, column: 9, scope: !799)
!803 = !DILocation(line: 403, column: 30, scope: !799)
!804 = !DILocation(line: 403, column: 9, scope: !787)
!805 = !DILocation(line: 404, column: 9, scope: !799)
!806 = !DILocation(line: 406, column: 22, scope: !787)
!807 = !DILocation(line: 406, column: 25, scope: !787)
!808 = !DILocation(line: 406, column: 13, scope: !787)
!809 = !DILocation(line: 406, column: 11, scope: !787)
!810 = !DILocation(line: 413, column: 17, scope: !787)
!811 = !DILocation(line: 413, column: 16, scope: !787)
!812 = !DILocation(line: 414, column: 5, scope: !787)
!813 = !DILocation(line: 414, column: 5, scope: !814)
!814 = distinct !DILexicalBlock(scope: !815, file: !3, line: 414, column: 5)
!815 = distinct !DILexicalBlock(scope: !787, file: !3, line: 414, column: 5)
!816 = !DILocation(line: 414, column: 5, scope: !815)
!817 = !DILocation(line: 415, column: 5, scope: !818)
!818 = distinct !DILexicalBlock(scope: !787, file: !3, line: 415, column: 5)
!819 = !DILocation(line: 415, column: 5, scope: !787)
!820 = !DILocation(line: 416, column: 5, scope: !787)
!821 = !DILocation(line: 417, column: 1, scope: !787)
!822 = distinct !DISubprogram(name: "dictFind", scope: !3, file: !3, line: 499, type: !823, scopeLine: 500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!823 = !DISubroutineType(types: !824)
!824 = !{!290, !319, !63}
!825 = !DILocalVariable(name: "d", arg: 1, scope: !822, file: !3, line: 499, type: !319)
!826 = !DILocation(line: 499, column: 27, scope: !822)
!827 = !DILocalVariable(name: "key", arg: 2, scope: !822, file: !3, line: 499, type: !63)
!828 = !DILocation(line: 499, column: 42, scope: !822)
!829 = !DILocalVariable(name: "he", scope: !822, file: !3, line: 501, type: !290)
!830 = !DILocation(line: 501, column: 16, scope: !822)
!831 = !DILocalVariable(name: "h", scope: !822, file: !3, line: 502, type: !30)
!832 = !DILocation(line: 502, column: 18, scope: !822)
!833 = !DILocalVariable(name: "idx", scope: !822, file: !3, line: 502, type: !30)
!834 = !DILocation(line: 502, column: 21, scope: !822)
!835 = !DILocalVariable(name: "table", scope: !822, file: !3, line: 502, type: !30)
!836 = !DILocation(line: 502, column: 26, scope: !822)
!837 = !DILocation(line: 504, column: 9, scope: !838)
!838 = distinct !DILexicalBlock(scope: !822, file: !3, line: 504, column: 9)
!839 = !DILocation(line: 504, column: 12, scope: !838)
!840 = !DILocation(line: 504, column: 18, scope: !838)
!841 = !DILocation(line: 504, column: 23, scope: !838)
!842 = !DILocation(line: 504, column: 9, scope: !822)
!843 = !DILocation(line: 504, column: 29, scope: !838)
!844 = !DILocation(line: 505, column: 9, scope: !845)
!845 = distinct !DILexicalBlock(scope: !822, file: !3, line: 505, column: 9)
!846 = !DILocation(line: 505, column: 9, scope: !822)
!847 = !DILocation(line: 505, column: 45, scope: !845)
!848 = !DILocation(line: 505, column: 29, scope: !845)
!849 = !DILocation(line: 506, column: 9, scope: !822)
!850 = !DILocation(line: 506, column: 7, scope: !822)
!851 = !DILocation(line: 507, column: 16, scope: !852)
!852 = distinct !DILexicalBlock(scope: !822, file: !3, line: 507, column: 5)
!853 = !DILocation(line: 507, column: 10, scope: !852)
!854 = !DILocation(line: 507, column: 21, scope: !855)
!855 = distinct !DILexicalBlock(scope: !852, file: !3, line: 507, column: 5)
!856 = !DILocation(line: 507, column: 27, scope: !855)
!857 = !DILocation(line: 507, column: 5, scope: !852)
!858 = !DILocation(line: 508, column: 15, scope: !859)
!859 = distinct !DILexicalBlock(scope: !855, file: !3, line: 507, column: 42)
!860 = !DILocation(line: 508, column: 19, scope: !859)
!861 = !DILocation(line: 508, column: 22, scope: !859)
!862 = !DILocation(line: 508, column: 25, scope: !859)
!863 = !DILocation(line: 508, column: 32, scope: !859)
!864 = !DILocation(line: 508, column: 17, scope: !859)
!865 = !DILocation(line: 508, column: 13, scope: !859)
!866 = !DILocation(line: 509, column: 14, scope: !859)
!867 = !DILocation(line: 509, column: 17, scope: !859)
!868 = !DILocation(line: 509, column: 20, scope: !859)
!869 = !DILocation(line: 509, column: 27, scope: !859)
!870 = !DILocation(line: 509, column: 33, scope: !859)
!871 = !DILocation(line: 509, column: 12, scope: !859)
!872 = !DILocation(line: 510, column: 9, scope: !859)
!873 = !DILocation(line: 510, column: 15, scope: !859)
!874 = !DILocation(line: 511, column: 17, scope: !875)
!875 = distinct !DILexicalBlock(scope: !876, file: !3, line: 511, column: 17)
!876 = distinct !DILexicalBlock(scope: !859, file: !3, line: 510, column: 19)
!877 = !DILocation(line: 511, column: 17, scope: !876)
!878 = !DILocation(line: 512, column: 24, scope: !875)
!879 = !DILocation(line: 512, column: 17, scope: !875)
!880 = !DILocation(line: 513, column: 18, scope: !876)
!881 = !DILocation(line: 513, column: 22, scope: !876)
!882 = !DILocation(line: 513, column: 16, scope: !876)
!883 = distinct !{!883, !872, !884}
!884 = !DILocation(line: 514, column: 9, scope: !859)
!885 = !DILocation(line: 515, column: 14, scope: !886)
!886 = distinct !DILexicalBlock(scope: !859, file: !3, line: 515, column: 13)
!887 = !DILocation(line: 515, column: 13, scope: !859)
!888 = !DILocation(line: 515, column: 34, scope: !886)
!889 = !DILocation(line: 516, column: 5, scope: !859)
!890 = !DILocation(line: 507, column: 38, scope: !855)
!891 = !DILocation(line: 507, column: 5, scope: !855)
!892 = distinct !{!892, !857, !893}
!893 = !DILocation(line: 516, column: 5, scope: !852)
!894 = !DILocation(line: 517, column: 5, scope: !822)
!895 = !DILocation(line: 518, column: 1, scope: !822)
!896 = distinct !DISubprogram(name: "dictGenericDelete", scope: !3, file: !3, line: 420, type: !897, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!897 = !DISubroutineType(types: !898)
!898 = !{!13, !319, !63, !13}
!899 = !DILocalVariable(name: "d", arg: 1, scope: !896, file: !3, line: 420, type: !319)
!900 = !DILocation(line: 420, column: 29, scope: !896)
!901 = !DILocalVariable(name: "key", arg: 2, scope: !896, file: !3, line: 420, type: !63)
!902 = !DILocation(line: 420, column: 44, scope: !896)
!903 = !DILocalVariable(name: "nofree", arg: 3, scope: !896, file: !3, line: 420, type: !13)
!904 = !DILocation(line: 420, column: 53, scope: !896)
!905 = !DILocalVariable(name: "h", scope: !896, file: !3, line: 422, type: !30)
!906 = !DILocation(line: 422, column: 18, scope: !896)
!907 = !DILocalVariable(name: "idx", scope: !896, file: !3, line: 422, type: !30)
!908 = !DILocation(line: 422, column: 21, scope: !896)
!909 = !DILocalVariable(name: "he", scope: !896, file: !3, line: 423, type: !290)
!910 = !DILocation(line: 423, column: 16, scope: !896)
!911 = !DILocalVariable(name: "prevHe", scope: !896, file: !3, line: 423, type: !290)
!912 = !DILocation(line: 423, column: 21, scope: !896)
!913 = !DILocalVariable(name: "table", scope: !896, file: !3, line: 424, type: !13)
!914 = !DILocation(line: 424, column: 9, scope: !896)
!915 = !DILocation(line: 426, column: 9, scope: !916)
!916 = distinct !DILexicalBlock(scope: !896, file: !3, line: 426, column: 9)
!917 = !DILocation(line: 426, column: 12, scope: !916)
!918 = !DILocation(line: 426, column: 18, scope: !916)
!919 = !DILocation(line: 426, column: 23, scope: !916)
!920 = !DILocation(line: 426, column: 9, scope: !896)
!921 = !DILocation(line: 426, column: 29, scope: !916)
!922 = !DILocation(line: 427, column: 9, scope: !923)
!923 = distinct !DILexicalBlock(scope: !896, file: !3, line: 427, column: 9)
!924 = !DILocation(line: 427, column: 9, scope: !896)
!925 = !DILocation(line: 427, column: 45, scope: !923)
!926 = !DILocation(line: 427, column: 29, scope: !923)
!927 = !DILocation(line: 428, column: 9, scope: !896)
!928 = !DILocation(line: 428, column: 7, scope: !896)
!929 = !DILocation(line: 430, column: 16, scope: !930)
!930 = distinct !DILexicalBlock(scope: !896, file: !3, line: 430, column: 5)
!931 = !DILocation(line: 430, column: 10, scope: !930)
!932 = !DILocation(line: 430, column: 21, scope: !933)
!933 = distinct !DILexicalBlock(scope: !930, file: !3, line: 430, column: 5)
!934 = !DILocation(line: 430, column: 27, scope: !933)
!935 = !DILocation(line: 430, column: 5, scope: !930)
!936 = !DILocation(line: 431, column: 15, scope: !937)
!937 = distinct !DILexicalBlock(scope: !933, file: !3, line: 430, column: 42)
!938 = !DILocation(line: 431, column: 19, scope: !937)
!939 = !DILocation(line: 431, column: 22, scope: !937)
!940 = !DILocation(line: 431, column: 25, scope: !937)
!941 = !DILocation(line: 431, column: 32, scope: !937)
!942 = !DILocation(line: 431, column: 17, scope: !937)
!943 = !DILocation(line: 431, column: 13, scope: !937)
!944 = !DILocation(line: 432, column: 14, scope: !937)
!945 = !DILocation(line: 432, column: 17, scope: !937)
!946 = !DILocation(line: 432, column: 20, scope: !937)
!947 = !DILocation(line: 432, column: 27, scope: !937)
!948 = !DILocation(line: 432, column: 33, scope: !937)
!949 = !DILocation(line: 432, column: 12, scope: !937)
!950 = !DILocation(line: 433, column: 16, scope: !937)
!951 = !DILocation(line: 434, column: 9, scope: !937)
!952 = !DILocation(line: 434, column: 15, scope: !937)
!953 = !DILocation(line: 435, column: 17, scope: !954)
!954 = distinct !DILexicalBlock(scope: !955, file: !3, line: 435, column: 17)
!955 = distinct !DILexicalBlock(scope: !937, file: !3, line: 434, column: 19)
!956 = !DILocation(line: 435, column: 17, scope: !955)
!957 = !DILocation(line: 437, column: 21, scope: !958)
!958 = distinct !DILexicalBlock(scope: !959, file: !3, line: 437, column: 21)
!959 = distinct !DILexicalBlock(scope: !954, file: !3, line: 435, column: 55)
!960 = !DILocation(line: 437, column: 21, scope: !959)
!961 = !DILocation(line: 438, column: 36, scope: !958)
!962 = !DILocation(line: 438, column: 40, scope: !958)
!963 = !DILocation(line: 438, column: 21, scope: !958)
!964 = !DILocation(line: 438, column: 29, scope: !958)
!965 = !DILocation(line: 438, column: 34, scope: !958)
!966 = !DILocation(line: 440, column: 47, scope: !958)
!967 = !DILocation(line: 440, column: 51, scope: !958)
!968 = !DILocation(line: 440, column: 21, scope: !958)
!969 = !DILocation(line: 440, column: 24, scope: !958)
!970 = !DILocation(line: 440, column: 27, scope: !958)
!971 = !DILocation(line: 440, column: 34, scope: !958)
!972 = !DILocation(line: 440, column: 40, scope: !958)
!973 = !DILocation(line: 440, column: 45, scope: !958)
!974 = !DILocation(line: 441, column: 22, scope: !975)
!975 = distinct !DILexicalBlock(scope: !959, file: !3, line: 441, column: 21)
!976 = !DILocation(line: 441, column: 21, scope: !959)
!977 = !DILocation(line: 442, column: 21, scope: !978)
!978 = distinct !DILexicalBlock(scope: !979, file: !3, line: 442, column: 21)
!979 = distinct !DILexicalBlock(scope: !975, file: !3, line: 441, column: 30)
!980 = !DILocation(line: 442, column: 21, scope: !979)
!981 = !DILocation(line: 443, column: 21, scope: !982)
!982 = distinct !DILexicalBlock(scope: !979, file: !3, line: 443, column: 21)
!983 = !DILocation(line: 443, column: 21, scope: !979)
!984 = !DILocation(line: 444, column: 17, scope: !979)
!985 = !DILocation(line: 445, column: 27, scope: !959)
!986 = !DILocation(line: 445, column: 17, scope: !959)
!987 = !DILocation(line: 446, column: 17, scope: !959)
!988 = !DILocation(line: 446, column: 20, scope: !959)
!989 = !DILocation(line: 446, column: 23, scope: !959)
!990 = !DILocation(line: 446, column: 30, scope: !959)
!991 = !DILocation(line: 446, column: 34, scope: !959)
!992 = !DILocation(line: 447, column: 17, scope: !959)
!993 = !DILocation(line: 449, column: 22, scope: !955)
!994 = !DILocation(line: 449, column: 20, scope: !955)
!995 = !DILocation(line: 450, column: 18, scope: !955)
!996 = !DILocation(line: 450, column: 22, scope: !955)
!997 = !DILocation(line: 450, column: 16, scope: !955)
!998 = distinct !{!998, !951, !999}
!999 = !DILocation(line: 451, column: 9, scope: !937)
!1000 = !DILocation(line: 452, column: 14, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !937, file: !3, line: 452, column: 13)
!1002 = !DILocation(line: 452, column: 13, scope: !937)
!1003 = !DILocation(line: 452, column: 34, scope: !1001)
!1004 = !DILocation(line: 453, column: 5, scope: !937)
!1005 = !DILocation(line: 430, column: 38, scope: !933)
!1006 = !DILocation(line: 430, column: 5, scope: !933)
!1007 = distinct !{!1007, !935, !1008}
!1008 = !DILocation(line: 453, column: 5, scope: !930)
!1009 = !DILocation(line: 454, column: 5, scope: !896)
!1010 = !DILocation(line: 455, column: 1, scope: !896)
!1011 = distinct !DISubprogram(name: "dictDelete", scope: !3, file: !3, line: 457, type: !720, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1012 = !DILocalVariable(name: "ht", arg: 1, scope: !1011, file: !3, line: 457, type: !319)
!1013 = !DILocation(line: 457, column: 22, scope: !1011)
!1014 = !DILocalVariable(name: "key", arg: 2, scope: !1011, file: !3, line: 457, type: !63)
!1015 = !DILocation(line: 457, column: 38, scope: !1011)
!1016 = !DILocation(line: 458, column: 30, scope: !1011)
!1017 = !DILocation(line: 458, column: 33, scope: !1011)
!1018 = !DILocation(line: 458, column: 12, scope: !1011)
!1019 = !DILocation(line: 458, column: 5, scope: !1011)
!1020 = distinct !DISubprogram(name: "dictDeleteNoFree", scope: !3, file: !3, line: 461, type: !720, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1021 = !DILocalVariable(name: "ht", arg: 1, scope: !1020, file: !3, line: 461, type: !319)
!1022 = !DILocation(line: 461, column: 28, scope: !1020)
!1023 = !DILocalVariable(name: "key", arg: 2, scope: !1020, file: !3, line: 461, type: !63)
!1024 = !DILocation(line: 461, column: 44, scope: !1020)
!1025 = !DILocation(line: 462, column: 30, scope: !1020)
!1026 = !DILocation(line: 462, column: 33, scope: !1020)
!1027 = !DILocation(line: 462, column: 12, scope: !1020)
!1028 = !DILocation(line: 462, column: 5, scope: !1020)
!1029 = distinct !DISubprogram(name: "_dictClear", scope: !3, file: !3, line: 466, type: !1030, scopeLine: 467, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!13, !319, !284}
!1032 = !DILocalVariable(name: "d", arg: 1, scope: !1029, file: !3, line: 466, type: !319)
!1033 = !DILocation(line: 466, column: 22, scope: !1029)
!1034 = !DILocalVariable(name: "ht", arg: 2, scope: !1029, file: !3, line: 466, type: !284)
!1035 = !DILocation(line: 466, column: 33, scope: !1029)
!1036 = !DILocalVariable(name: "i", scope: !1029, file: !3, line: 468, type: !8)
!1037 = !DILocation(line: 468, column: 19, scope: !1029)
!1038 = !DILocation(line: 471, column: 12, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1029, file: !3, line: 471, column: 5)
!1040 = !DILocation(line: 471, column: 10, scope: !1039)
!1041 = !DILocation(line: 471, column: 17, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1039, file: !3, line: 471, column: 5)
!1043 = !DILocation(line: 471, column: 21, scope: !1042)
!1044 = !DILocation(line: 471, column: 25, scope: !1042)
!1045 = !DILocation(line: 471, column: 19, scope: !1042)
!1046 = !DILocation(line: 471, column: 30, scope: !1042)
!1047 = !DILocation(line: 471, column: 33, scope: !1042)
!1048 = !DILocation(line: 471, column: 37, scope: !1042)
!1049 = !DILocation(line: 471, column: 42, scope: !1042)
!1050 = !DILocation(line: 0, scope: !1042)
!1051 = !DILocation(line: 471, column: 5, scope: !1039)
!1052 = !DILocalVariable(name: "he", scope: !1053, file: !3, line: 472, type: !290)
!1053 = distinct !DILexicalBlock(scope: !1042, file: !3, line: 471, column: 52)
!1054 = !DILocation(line: 472, column: 20, scope: !1053)
!1055 = !DILocalVariable(name: "nextHe", scope: !1053, file: !3, line: 472, type: !290)
!1056 = !DILocation(line: 472, column: 25, scope: !1053)
!1057 = !DILocation(line: 474, column: 19, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 474, column: 13)
!1059 = !DILocation(line: 474, column: 23, scope: !1058)
!1060 = !DILocation(line: 474, column: 29, scope: !1058)
!1061 = !DILocation(line: 474, column: 17, scope: !1058)
!1062 = !DILocation(line: 474, column: 33, scope: !1058)
!1063 = !DILocation(line: 474, column: 13, scope: !1053)
!1064 = !DILocation(line: 474, column: 42, scope: !1058)
!1065 = !DILocation(line: 475, column: 9, scope: !1053)
!1066 = !DILocation(line: 475, column: 15, scope: !1053)
!1067 = !DILocation(line: 476, column: 22, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 475, column: 19)
!1069 = !DILocation(line: 476, column: 26, scope: !1068)
!1070 = !DILocation(line: 476, column: 20, scope: !1068)
!1071 = !DILocation(line: 477, column: 13, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 477, column: 13)
!1073 = !DILocation(line: 477, column: 13, scope: !1068)
!1074 = !DILocation(line: 478, column: 13, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 478, column: 13)
!1076 = !DILocation(line: 478, column: 13, scope: !1068)
!1077 = !DILocation(line: 479, column: 23, scope: !1068)
!1078 = !DILocation(line: 479, column: 13, scope: !1068)
!1079 = !DILocation(line: 480, column: 13, scope: !1068)
!1080 = !DILocation(line: 480, column: 17, scope: !1068)
!1081 = !DILocation(line: 480, column: 21, scope: !1068)
!1082 = !DILocation(line: 481, column: 18, scope: !1068)
!1083 = !DILocation(line: 481, column: 16, scope: !1068)
!1084 = distinct !{!1084, !1065, !1085}
!1085 = !DILocation(line: 482, column: 9, scope: !1053)
!1086 = !DILocation(line: 483, column: 5, scope: !1053)
!1087 = !DILocation(line: 471, column: 48, scope: !1042)
!1088 = !DILocation(line: 471, column: 5, scope: !1042)
!1089 = distinct !{!1089, !1051, !1090}
!1090 = !DILocation(line: 483, column: 5, scope: !1039)
!1091 = !DILocation(line: 485, column: 15, scope: !1029)
!1092 = !DILocation(line: 485, column: 19, scope: !1029)
!1093 = !DILocation(line: 485, column: 5, scope: !1029)
!1094 = !DILocation(line: 487, column: 16, scope: !1029)
!1095 = !DILocation(line: 487, column: 5, scope: !1029)
!1096 = !DILocation(line: 488, column: 5, scope: !1029)
!1097 = distinct !DISubprogram(name: "dictRelease", scope: !3, file: !3, line: 492, type: !645, scopeLine: 493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1098 = !DILocalVariable(name: "d", arg: 1, scope: !1097, file: !3, line: 492, type: !319)
!1099 = !DILocation(line: 492, column: 24, scope: !1097)
!1100 = !DILocation(line: 494, column: 16, scope: !1097)
!1101 = !DILocation(line: 494, column: 19, scope: !1097)
!1102 = !DILocation(line: 494, column: 22, scope: !1097)
!1103 = !DILocation(line: 494, column: 5, scope: !1097)
!1104 = !DILocation(line: 495, column: 16, scope: !1097)
!1105 = !DILocation(line: 495, column: 19, scope: !1097)
!1106 = !DILocation(line: 495, column: 22, scope: !1097)
!1107 = !DILocation(line: 495, column: 5, scope: !1097)
!1108 = !DILocation(line: 496, column: 15, scope: !1097)
!1109 = !DILocation(line: 496, column: 5, scope: !1097)
!1110 = !DILocation(line: 497, column: 1, scope: !1097)
!1111 = distinct !DISubprogram(name: "dictFetchValue", scope: !3, file: !3, line: 520, type: !1112, scopeLine: 520, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!11, !319, !63}
!1114 = !DILocalVariable(name: "d", arg: 1, scope: !1111, file: !3, line: 520, type: !319)
!1115 = !DILocation(line: 520, column: 28, scope: !1111)
!1116 = !DILocalVariable(name: "key", arg: 2, scope: !1111, file: !3, line: 520, type: !63)
!1117 = !DILocation(line: 520, column: 43, scope: !1111)
!1118 = !DILocalVariable(name: "he", scope: !1111, file: !3, line: 521, type: !290)
!1119 = !DILocation(line: 521, column: 16, scope: !1111)
!1120 = !DILocation(line: 523, column: 19, scope: !1111)
!1121 = !DILocation(line: 523, column: 21, scope: !1111)
!1122 = !DILocation(line: 523, column: 10, scope: !1111)
!1123 = !DILocation(line: 523, column: 8, scope: !1111)
!1124 = !DILocation(line: 524, column: 12, scope: !1111)
!1125 = !DILocation(line: 524, column: 17, scope: !1111)
!1126 = !DILocation(line: 524, column: 5, scope: !1111)
!1127 = distinct !DISubprogram(name: "dictGetIterator", scope: !3, file: !3, line: 527, type: !1128, scopeLine: 528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!1130, !319}
!1130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1131, size: 64)
!1131 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictIterator", file: !56, line: 82, baseType: !1132)
!1132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictIterator", file: !56, line: 77, size: 256, elements: !1133)
!1133 = !{!1134, !1135, !1136, !1137, !1138}
!1134 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !1132, file: !56, line: 78, baseType: !319, size: 64)
!1135 = !DIDerivedType(tag: DW_TAG_member, name: "table", scope: !1132, file: !56, line: 79, baseType: !13, size: 32, offset: 64)
!1136 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !1132, file: !56, line: 80, baseType: !13, size: 32, offset: 96)
!1137 = !DIDerivedType(tag: DW_TAG_member, name: "entry", scope: !1132, file: !56, line: 81, baseType: !290, size: 64, offset: 128)
!1138 = !DIDerivedType(tag: DW_TAG_member, name: "nextEntry", scope: !1132, file: !56, line: 81, baseType: !290, size: 64, offset: 192)
!1139 = !DILocalVariable(name: "d", arg: 1, scope: !1127, file: !3, line: 527, type: !319)
!1140 = !DILocation(line: 527, column: 37, scope: !1127)
!1141 = !DILocalVariable(name: "iter", scope: !1127, file: !3, line: 529, type: !1130)
!1142 = !DILocation(line: 529, column: 19, scope: !1127)
!1143 = !DILocation(line: 529, column: 26, scope: !1127)
!1144 = !DILocation(line: 531, column: 15, scope: !1127)
!1145 = !DILocation(line: 531, column: 5, scope: !1127)
!1146 = !DILocation(line: 531, column: 11, scope: !1127)
!1147 = !DILocation(line: 531, column: 13, scope: !1127)
!1148 = !DILocation(line: 532, column: 5, scope: !1127)
!1149 = !DILocation(line: 532, column: 11, scope: !1127)
!1150 = !DILocation(line: 532, column: 17, scope: !1127)
!1151 = !DILocation(line: 533, column: 5, scope: !1127)
!1152 = !DILocation(line: 533, column: 11, scope: !1127)
!1153 = !DILocation(line: 533, column: 17, scope: !1127)
!1154 = !DILocation(line: 534, column: 5, scope: !1127)
!1155 = !DILocation(line: 534, column: 11, scope: !1127)
!1156 = !DILocation(line: 534, column: 17, scope: !1127)
!1157 = !DILocation(line: 535, column: 5, scope: !1127)
!1158 = !DILocation(line: 535, column: 11, scope: !1127)
!1159 = !DILocation(line: 535, column: 21, scope: !1127)
!1160 = !DILocation(line: 536, column: 12, scope: !1127)
!1161 = !DILocation(line: 536, column: 5, scope: !1127)
!1162 = distinct !DISubprogram(name: "dictNext", scope: !3, file: !3, line: 539, type: !1163, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!290, !1130}
!1165 = !DILocalVariable(name: "iter", arg: 1, scope: !1162, file: !3, line: 539, type: !1130)
!1166 = !DILocation(line: 539, column: 35, scope: !1162)
!1167 = !DILocation(line: 541, column: 5, scope: !1162)
!1168 = !DILocation(line: 542, column: 13, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1170, file: !3, line: 542, column: 13)
!1170 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 541, column: 15)
!1171 = !DILocation(line: 542, column: 19, scope: !1169)
!1172 = !DILocation(line: 542, column: 25, scope: !1169)
!1173 = !DILocation(line: 542, column: 13, scope: !1170)
!1174 = !DILocalVariable(name: "ht", scope: !1175, file: !3, line: 543, type: !284)
!1175 = distinct !DILexicalBlock(scope: !1169, file: !3, line: 542, column: 34)
!1176 = !DILocation(line: 543, column: 21, scope: !1175)
!1177 = !DILocation(line: 543, column: 27, scope: !1175)
!1178 = !DILocation(line: 543, column: 33, scope: !1175)
!1179 = !DILocation(line: 543, column: 36, scope: !1175)
!1180 = !DILocation(line: 543, column: 39, scope: !1175)
!1181 = !DILocation(line: 543, column: 45, scope: !1175)
!1182 = !DILocation(line: 544, column: 17, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1175, file: !3, line: 544, column: 17)
!1184 = !DILocation(line: 544, column: 23, scope: !1183)
!1185 = !DILocation(line: 544, column: 29, scope: !1183)
!1186 = !DILocation(line: 544, column: 35, scope: !1183)
!1187 = !DILocation(line: 544, column: 38, scope: !1183)
!1188 = !DILocation(line: 544, column: 44, scope: !1183)
!1189 = !DILocation(line: 544, column: 50, scope: !1183)
!1190 = !DILocation(line: 544, column: 17, scope: !1175)
!1191 = !DILocation(line: 544, column: 56, scope: !1183)
!1192 = !DILocation(line: 544, column: 62, scope: !1183)
!1193 = !DILocation(line: 544, column: 65, scope: !1183)
!1194 = !DILocation(line: 544, column: 74, scope: !1183)
!1195 = !DILocation(line: 545, column: 13, scope: !1175)
!1196 = !DILocation(line: 545, column: 19, scope: !1175)
!1197 = !DILocation(line: 545, column: 24, scope: !1175)
!1198 = !DILocation(line: 546, column: 17, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1175, file: !3, line: 546, column: 17)
!1200 = !DILocation(line: 546, column: 23, scope: !1199)
!1201 = !DILocation(line: 546, column: 41, scope: !1199)
!1202 = !DILocation(line: 546, column: 45, scope: !1199)
!1203 = !DILocation(line: 546, column: 32, scope: !1199)
!1204 = !DILocation(line: 546, column: 29, scope: !1199)
!1205 = !DILocation(line: 546, column: 17, scope: !1175)
!1206 = !DILocation(line: 547, column: 21, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1208, file: !3, line: 547, column: 21)
!1208 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 546, column: 51)
!1209 = !DILocation(line: 547, column: 46, scope: !1207)
!1210 = !DILocation(line: 547, column: 49, scope: !1207)
!1211 = !DILocation(line: 547, column: 55, scope: !1207)
!1212 = !DILocation(line: 547, column: 61, scope: !1207)
!1213 = !DILocation(line: 547, column: 21, scope: !1208)
!1214 = !DILocation(line: 548, column: 21, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1207, file: !3, line: 547, column: 67)
!1216 = !DILocation(line: 548, column: 27, scope: !1215)
!1217 = !DILocation(line: 548, column: 32, scope: !1215)
!1218 = !DILocation(line: 549, column: 21, scope: !1215)
!1219 = !DILocation(line: 549, column: 27, scope: !1215)
!1220 = !DILocation(line: 549, column: 33, scope: !1215)
!1221 = !DILocation(line: 550, column: 27, scope: !1215)
!1222 = !DILocation(line: 550, column: 33, scope: !1215)
!1223 = !DILocation(line: 550, column: 36, scope: !1215)
!1224 = !DILocation(line: 550, column: 24, scope: !1215)
!1225 = !DILocation(line: 551, column: 17, scope: !1215)
!1226 = !DILocation(line: 552, column: 21, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1207, file: !3, line: 551, column: 24)
!1228 = !DILocation(line: 554, column: 13, scope: !1208)
!1229 = !DILocation(line: 555, column: 27, scope: !1175)
!1230 = !DILocation(line: 555, column: 31, scope: !1175)
!1231 = !DILocation(line: 555, column: 37, scope: !1175)
!1232 = !DILocation(line: 555, column: 43, scope: !1175)
!1233 = !DILocation(line: 555, column: 13, scope: !1175)
!1234 = !DILocation(line: 555, column: 19, scope: !1175)
!1235 = !DILocation(line: 555, column: 25, scope: !1175)
!1236 = !DILocation(line: 556, column: 9, scope: !1175)
!1237 = !DILocation(line: 557, column: 27, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1169, file: !3, line: 556, column: 16)
!1239 = !DILocation(line: 557, column: 33, scope: !1238)
!1240 = !DILocation(line: 557, column: 13, scope: !1238)
!1241 = !DILocation(line: 557, column: 19, scope: !1238)
!1242 = !DILocation(line: 557, column: 25, scope: !1238)
!1243 = !DILocation(line: 559, column: 13, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1170, file: !3, line: 559, column: 13)
!1245 = !DILocation(line: 559, column: 19, scope: !1244)
!1246 = !DILocation(line: 559, column: 13, scope: !1170)
!1247 = !DILocation(line: 562, column: 31, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1244, file: !3, line: 559, column: 26)
!1249 = !DILocation(line: 562, column: 37, scope: !1248)
!1250 = !DILocation(line: 562, column: 44, scope: !1248)
!1251 = !DILocation(line: 562, column: 13, scope: !1248)
!1252 = !DILocation(line: 562, column: 19, scope: !1248)
!1253 = !DILocation(line: 562, column: 29, scope: !1248)
!1254 = !DILocation(line: 563, column: 20, scope: !1248)
!1255 = !DILocation(line: 563, column: 26, scope: !1248)
!1256 = !DILocation(line: 563, column: 13, scope: !1248)
!1257 = distinct !{!1257, !1167, !1258}
!1258 = !DILocation(line: 565, column: 5, scope: !1162)
!1259 = !DILocation(line: 566, column: 5, scope: !1162)
!1260 = !DILocation(line: 567, column: 1, scope: !1162)
!1261 = distinct !DISubprogram(name: "dictReleaseIterator", scope: !3, file: !3, line: 569, type: !1262, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{null, !1130}
!1264 = !DILocalVariable(name: "iter", arg: 1, scope: !1261, file: !3, line: 569, type: !1130)
!1265 = !DILocation(line: 569, column: 40, scope: !1261)
!1266 = !DILocation(line: 571, column: 11, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1261, file: !3, line: 571, column: 9)
!1268 = !DILocation(line: 571, column: 17, scope: !1267)
!1269 = !DILocation(line: 571, column: 23, scope: !1267)
!1270 = !DILocation(line: 571, column: 29, scope: !1267)
!1271 = !DILocation(line: 571, column: 32, scope: !1267)
!1272 = !DILocation(line: 571, column: 38, scope: !1267)
!1273 = !DILocation(line: 571, column: 44, scope: !1267)
!1274 = !DILocation(line: 571, column: 9, scope: !1261)
!1275 = !DILocation(line: 571, column: 51, scope: !1267)
!1276 = !DILocation(line: 571, column: 57, scope: !1267)
!1277 = !DILocation(line: 571, column: 60, scope: !1267)
!1278 = !DILocation(line: 571, column: 69, scope: !1267)
!1279 = !DILocation(line: 572, column: 15, scope: !1261)
!1280 = !DILocation(line: 572, column: 5, scope: !1261)
!1281 = !DILocation(line: 573, column: 1, scope: !1261)
!1282 = distinct !DISubprogram(name: "dictGetRandomKey", scope: !3, file: !3, line: 577, type: !1283, scopeLine: 578, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!290, !319}
!1285 = !DILocalVariable(name: "d", arg: 1, scope: !1282, file: !3, line: 577, type: !319)
!1286 = !DILocation(line: 577, column: 35, scope: !1282)
!1287 = !DILocalVariable(name: "he", scope: !1282, file: !3, line: 579, type: !290)
!1288 = !DILocation(line: 579, column: 16, scope: !1282)
!1289 = !DILocalVariable(name: "orighe", scope: !1282, file: !3, line: 579, type: !290)
!1290 = !DILocation(line: 579, column: 21, scope: !1282)
!1291 = !DILocalVariable(name: "h", scope: !1282, file: !3, line: 580, type: !30)
!1292 = !DILocation(line: 580, column: 18, scope: !1282)
!1293 = !DILocalVariable(name: "listlen", scope: !1282, file: !3, line: 581, type: !13)
!1294 = !DILocation(line: 581, column: 9, scope: !1282)
!1295 = !DILocalVariable(name: "listele", scope: !1282, file: !3, line: 581, type: !13)
!1296 = !DILocation(line: 581, column: 18, scope: !1282)
!1297 = !DILocation(line: 583, column: 9, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 583, column: 9)
!1299 = !DILocation(line: 583, column: 21, scope: !1298)
!1300 = !DILocation(line: 583, column: 9, scope: !1282)
!1301 = !DILocation(line: 583, column: 27, scope: !1298)
!1302 = !DILocation(line: 584, column: 9, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 584, column: 9)
!1304 = !DILocation(line: 584, column: 9, scope: !1282)
!1305 = !DILocation(line: 584, column: 45, scope: !1303)
!1306 = !DILocation(line: 584, column: 29, scope: !1303)
!1307 = !DILocation(line: 585, column: 9, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 585, column: 9)
!1309 = !DILocation(line: 585, column: 9, scope: !1282)
!1310 = !DILocation(line: 586, column: 9, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1308, file: !3, line: 585, column: 29)
!1312 = !DILocation(line: 587, column: 17, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1311, file: !3, line: 586, column: 12)
!1314 = !DILocation(line: 587, column: 29, scope: !1313)
!1315 = !DILocation(line: 587, column: 32, scope: !1313)
!1316 = !DILocation(line: 587, column: 38, scope: !1313)
!1317 = !DILocation(line: 587, column: 43, scope: !1313)
!1318 = !DILocation(line: 587, column: 46, scope: !1313)
!1319 = !DILocation(line: 587, column: 52, scope: !1313)
!1320 = !DILocation(line: 587, column: 42, scope: !1313)
!1321 = !DILocation(line: 587, column: 26, scope: !1313)
!1322 = !DILocation(line: 587, column: 15, scope: !1313)
!1323 = !DILocation(line: 588, column: 19, scope: !1313)
!1324 = !DILocation(line: 588, column: 24, scope: !1313)
!1325 = !DILocation(line: 588, column: 27, scope: !1313)
!1326 = !DILocation(line: 588, column: 33, scope: !1313)
!1327 = !DILocation(line: 588, column: 21, scope: !1313)
!1328 = !DILocation(line: 588, column: 18, scope: !1313)
!1329 = !DILocation(line: 588, column: 41, scope: !1313)
!1330 = !DILocation(line: 588, column: 44, scope: !1313)
!1331 = !DILocation(line: 588, column: 50, scope: !1313)
!1332 = !DILocation(line: 588, column: 56, scope: !1313)
!1333 = !DILocation(line: 588, column: 60, scope: !1313)
!1334 = !DILocation(line: 588, column: 63, scope: !1313)
!1335 = !DILocation(line: 588, column: 69, scope: !1313)
!1336 = !DILocation(line: 588, column: 58, scope: !1313)
!1337 = !DILocation(line: 589, column: 39, scope: !1313)
!1338 = !DILocation(line: 589, column: 42, scope: !1313)
!1339 = !DILocation(line: 589, column: 48, scope: !1313)
!1340 = !DILocation(line: 589, column: 54, scope: !1313)
!1341 = !DILocation(line: 588, column: 16, scope: !1313)
!1342 = !DILocation(line: 590, column: 9, scope: !1313)
!1343 = !DILocation(line: 590, column: 17, scope: !1311)
!1344 = !DILocation(line: 590, column: 20, scope: !1311)
!1345 = distinct !{!1345, !1310, !1346}
!1346 = !DILocation(line: 590, column: 27, scope: !1311)
!1347 = !DILocation(line: 591, column: 5, scope: !1311)
!1348 = !DILocation(line: 592, column: 9, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1308, file: !3, line: 591, column: 12)
!1350 = !DILocation(line: 593, column: 17, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 592, column: 12)
!1352 = !DILocation(line: 593, column: 28, scope: !1351)
!1353 = !DILocation(line: 593, column: 31, scope: !1351)
!1354 = !DILocation(line: 593, column: 37, scope: !1351)
!1355 = !DILocation(line: 593, column: 26, scope: !1351)
!1356 = !DILocation(line: 593, column: 15, scope: !1351)
!1357 = !DILocation(line: 594, column: 18, scope: !1351)
!1358 = !DILocation(line: 594, column: 21, scope: !1351)
!1359 = !DILocation(line: 594, column: 27, scope: !1351)
!1360 = !DILocation(line: 594, column: 33, scope: !1351)
!1361 = !DILocation(line: 594, column: 16, scope: !1351)
!1362 = !DILocation(line: 595, column: 9, scope: !1351)
!1363 = !DILocation(line: 595, column: 17, scope: !1349)
!1364 = !DILocation(line: 595, column: 20, scope: !1349)
!1365 = distinct !{!1365, !1348, !1366}
!1366 = !DILocation(line: 595, column: 27, scope: !1349)
!1367 = !DILocation(line: 602, column: 13, scope: !1282)
!1368 = !DILocation(line: 603, column: 14, scope: !1282)
!1369 = !DILocation(line: 603, column: 12, scope: !1282)
!1370 = !DILocation(line: 604, column: 5, scope: !1282)
!1371 = !DILocation(line: 604, column: 11, scope: !1282)
!1372 = !DILocation(line: 605, column: 14, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 604, column: 15)
!1374 = !DILocation(line: 605, column: 18, scope: !1373)
!1375 = !DILocation(line: 605, column: 12, scope: !1373)
!1376 = !DILocation(line: 606, column: 16, scope: !1373)
!1377 = distinct !{!1377, !1370, !1378}
!1378 = !DILocation(line: 607, column: 5, scope: !1282)
!1379 = !DILocation(line: 608, column: 15, scope: !1282)
!1380 = !DILocation(line: 608, column: 26, scope: !1282)
!1381 = !DILocation(line: 608, column: 24, scope: !1282)
!1382 = !DILocation(line: 608, column: 13, scope: !1282)
!1383 = !DILocation(line: 609, column: 10, scope: !1282)
!1384 = !DILocation(line: 609, column: 8, scope: !1282)
!1385 = !DILocation(line: 610, column: 5, scope: !1282)
!1386 = !DILocation(line: 610, column: 18, scope: !1282)
!1387 = !DILocation(line: 610, column: 27, scope: !1282)
!1388 = !DILocation(line: 610, column: 31, scope: !1282)
!1389 = !DILocation(line: 610, column: 25, scope: !1282)
!1390 = distinct !{!1390, !1385, !1388}
!1391 = !DILocation(line: 611, column: 12, scope: !1282)
!1392 = !DILocation(line: 611, column: 5, scope: !1282)
!1393 = !DILocation(line: 612, column: 1, scope: !1282)
!1394 = distinct !DISubprogram(name: "_dictExpandIfNeeded", scope: !3, file: !3, line: 617, type: !376, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1395 = !DILocalVariable(name: "d", arg: 1, scope: !1394, file: !3, line: 617, type: !319)
!1396 = !DILocation(line: 617, column: 31, scope: !1394)
!1397 = !DILocation(line: 621, column: 9, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1394, file: !3, line: 621, column: 9)
!1399 = !DILocation(line: 621, column: 9, scope: !1394)
!1400 = !DILocation(line: 621, column: 29, scope: !1398)
!1401 = !DILocation(line: 622, column: 9, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1394, file: !3, line: 622, column: 9)
!1403 = !DILocation(line: 622, column: 12, scope: !1402)
!1404 = !DILocation(line: 622, column: 18, scope: !1402)
!1405 = !DILocation(line: 622, column: 23, scope: !1402)
!1406 = !DILocation(line: 622, column: 9, scope: !1394)
!1407 = !DILocation(line: 623, column: 27, scope: !1402)
!1408 = !DILocation(line: 623, column: 16, scope: !1402)
!1409 = !DILocation(line: 623, column: 9, scope: !1402)
!1410 = !DILocation(line: 624, column: 9, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1394, file: !3, line: 624, column: 9)
!1412 = !DILocation(line: 624, column: 12, scope: !1411)
!1413 = !DILocation(line: 624, column: 18, scope: !1411)
!1414 = !DILocation(line: 624, column: 26, scope: !1411)
!1415 = !DILocation(line: 624, column: 29, scope: !1411)
!1416 = !DILocation(line: 624, column: 35, scope: !1411)
!1417 = !DILocation(line: 624, column: 23, scope: !1411)
!1418 = !DILocation(line: 624, column: 40, scope: !1411)
!1419 = !DILocation(line: 624, column: 43, scope: !1411)
!1420 = !DILocation(line: 624, column: 9, scope: !1394)
!1421 = !DILocation(line: 625, column: 27, scope: !1411)
!1422 = !DILocation(line: 625, column: 32, scope: !1411)
!1423 = !DILocation(line: 625, column: 35, scope: !1411)
!1424 = !DILocation(line: 625, column: 41, scope: !1411)
!1425 = !DILocation(line: 625, column: 48, scope: !1411)
!1426 = !DILocation(line: 625, column: 51, scope: !1411)
!1427 = !DILocation(line: 625, column: 57, scope: !1411)
!1428 = !DILocation(line: 625, column: 46, scope: !1411)
!1429 = !DILocation(line: 625, column: 31, scope: !1411)
!1430 = !DILocation(line: 626, column: 37, scope: !1411)
!1431 = !DILocation(line: 626, column: 40, scope: !1411)
!1432 = !DILocation(line: 626, column: 46, scope: !1411)
!1433 = !DILocation(line: 626, column: 53, scope: !1411)
!1434 = !DILocation(line: 626, column: 56, scope: !1411)
!1435 = !DILocation(line: 626, column: 62, scope: !1411)
!1436 = !DILocation(line: 626, column: 67, scope: !1411)
!1437 = !DILocation(line: 625, column: 16, scope: !1411)
!1438 = !DILocation(line: 625, column: 9, scope: !1411)
!1439 = !DILocation(line: 627, column: 5, scope: !1394)
!1440 = !DILocation(line: 628, column: 1, scope: !1394)
!1441 = distinct !DISubprogram(name: "dictEmpty", scope: !3, file: !3, line: 673, type: !645, scopeLine: 673, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1442 = !DILocalVariable(name: "d", arg: 1, scope: !1441, file: !3, line: 673, type: !319)
!1443 = !DILocation(line: 673, column: 22, scope: !1441)
!1444 = !DILocation(line: 674, column: 16, scope: !1441)
!1445 = !DILocation(line: 674, column: 19, scope: !1441)
!1446 = !DILocation(line: 674, column: 22, scope: !1441)
!1447 = !DILocation(line: 674, column: 5, scope: !1441)
!1448 = !DILocation(line: 675, column: 16, scope: !1441)
!1449 = !DILocation(line: 675, column: 19, scope: !1441)
!1450 = !DILocation(line: 675, column: 22, scope: !1441)
!1451 = !DILocation(line: 675, column: 5, scope: !1441)
!1452 = !DILocation(line: 676, column: 5, scope: !1441)
!1453 = !DILocation(line: 676, column: 8, scope: !1441)
!1454 = !DILocation(line: 676, column: 18, scope: !1441)
!1455 = !DILocation(line: 677, column: 5, scope: !1441)
!1456 = !DILocation(line: 677, column: 8, scope: !1441)
!1457 = !DILocation(line: 677, column: 18, scope: !1441)
!1458 = !DILocation(line: 678, column: 1, scope: !1441)
!1459 = distinct !DISubprogram(name: "_dictPrintStatsHt", scope: !3, file: !3, line: 681, type: !282, scopeLine: 681, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1460 = !DILocalVariable(name: "ht", arg: 1, scope: !1459, file: !3, line: 681, type: !284)
!1461 = !DILocation(line: 681, column: 32, scope: !1459)
!1462 = !DILocalVariable(name: "i", scope: !1459, file: !3, line: 682, type: !8)
!1463 = !DILocation(line: 682, column: 19, scope: !1459)
!1464 = !DILocalVariable(name: "slots", scope: !1459, file: !3, line: 682, type: !8)
!1465 = !DILocation(line: 682, column: 22, scope: !1459)
!1466 = !DILocalVariable(name: "chainlen", scope: !1459, file: !3, line: 682, type: !8)
!1467 = !DILocation(line: 682, column: 33, scope: !1459)
!1468 = !DILocalVariable(name: "maxchainlen", scope: !1459, file: !3, line: 682, type: !8)
!1469 = !DILocation(line: 682, column: 43, scope: !1459)
!1470 = !DILocalVariable(name: "totchainlen", scope: !1459, file: !3, line: 683, type: !8)
!1471 = !DILocation(line: 683, column: 19, scope: !1459)
!1472 = !DILocalVariable(name: "clvector", scope: !1459, file: !3, line: 684, type: !1473)
!1473 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !1474)
!1474 = !{!1475}
!1475 = !DISubrange(count: 50)
!1476 = !DILocation(line: 684, column: 19, scope: !1459)
!1477 = !DILocation(line: 686, column: 9, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1459, file: !3, line: 686, column: 9)
!1479 = !DILocation(line: 686, column: 13, scope: !1478)
!1480 = !DILocation(line: 686, column: 18, scope: !1478)
!1481 = !DILocation(line: 686, column: 9, scope: !1459)
!1482 = !DILocation(line: 687, column: 9, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1478, file: !3, line: 686, column: 24)
!1484 = !DILocation(line: 688, column: 9, scope: !1483)
!1485 = !DILocation(line: 691, column: 12, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1459, file: !3, line: 691, column: 5)
!1487 = !DILocation(line: 691, column: 10, scope: !1486)
!1488 = !DILocation(line: 691, column: 17, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1486, file: !3, line: 691, column: 5)
!1490 = !DILocation(line: 691, column: 19, scope: !1489)
!1491 = !DILocation(line: 691, column: 5, scope: !1486)
!1492 = !DILocation(line: 691, column: 55, scope: !1489)
!1493 = !DILocation(line: 691, column: 46, scope: !1489)
!1494 = !DILocation(line: 691, column: 58, scope: !1489)
!1495 = !DILocation(line: 691, column: 42, scope: !1489)
!1496 = !DILocation(line: 691, column: 5, scope: !1489)
!1497 = distinct !{!1497, !1491, !1498}
!1498 = !DILocation(line: 691, column: 60, scope: !1486)
!1499 = !DILocation(line: 692, column: 12, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1459, file: !3, line: 692, column: 5)
!1501 = !DILocation(line: 692, column: 10, scope: !1500)
!1502 = !DILocation(line: 692, column: 17, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1500, file: !3, line: 692, column: 5)
!1504 = !DILocation(line: 692, column: 21, scope: !1503)
!1505 = !DILocation(line: 692, column: 25, scope: !1503)
!1506 = !DILocation(line: 692, column: 19, scope: !1503)
!1507 = !DILocation(line: 692, column: 5, scope: !1500)
!1508 = !DILocalVariable(name: "he", scope: !1509, file: !3, line: 693, type: !290)
!1509 = distinct !DILexicalBlock(scope: !1503, file: !3, line: 692, column: 36)
!1510 = !DILocation(line: 693, column: 20, scope: !1509)
!1511 = !DILocation(line: 695, column: 13, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1509, file: !3, line: 695, column: 13)
!1513 = !DILocation(line: 695, column: 17, scope: !1512)
!1514 = !DILocation(line: 695, column: 23, scope: !1512)
!1515 = !DILocation(line: 695, column: 26, scope: !1512)
!1516 = !DILocation(line: 695, column: 13, scope: !1509)
!1517 = !DILocation(line: 696, column: 13, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1512, file: !3, line: 695, column: 35)
!1519 = !DILocation(line: 696, column: 24, scope: !1518)
!1520 = !DILocation(line: 697, column: 13, scope: !1518)
!1521 = !DILocation(line: 699, column: 14, scope: !1509)
!1522 = !DILocation(line: 701, column: 18, scope: !1509)
!1523 = !DILocation(line: 702, column: 14, scope: !1509)
!1524 = !DILocation(line: 702, column: 18, scope: !1509)
!1525 = !DILocation(line: 702, column: 24, scope: !1509)
!1526 = !DILocation(line: 702, column: 12, scope: !1509)
!1527 = !DILocation(line: 703, column: 9, scope: !1509)
!1528 = !DILocation(line: 703, column: 15, scope: !1509)
!1529 = !DILocation(line: 704, column: 21, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1509, file: !3, line: 703, column: 19)
!1531 = !DILocation(line: 705, column: 18, scope: !1530)
!1532 = !DILocation(line: 705, column: 22, scope: !1530)
!1533 = !DILocation(line: 705, column: 16, scope: !1530)
!1534 = distinct !{!1534, !1527, !1535}
!1535 = !DILocation(line: 706, column: 9, scope: !1509)
!1536 = !DILocation(line: 707, column: 19, scope: !1509)
!1537 = !DILocation(line: 707, column: 28, scope: !1509)
!1538 = !DILocation(line: 707, column: 18, scope: !1509)
!1539 = !DILocation(line: 707, column: 52, scope: !1509)
!1540 = !DILocation(line: 707, column: 9, scope: !1509)
!1541 = !DILocation(line: 707, column: 86, scope: !1509)
!1542 = !DILocation(line: 708, column: 13, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1509, file: !3, line: 708, column: 13)
!1544 = !DILocation(line: 708, column: 24, scope: !1543)
!1545 = !DILocation(line: 708, column: 22, scope: !1543)
!1546 = !DILocation(line: 708, column: 13, scope: !1509)
!1547 = !DILocation(line: 708, column: 51, scope: !1543)
!1548 = !DILocation(line: 708, column: 49, scope: !1543)
!1549 = !DILocation(line: 708, column: 37, scope: !1543)
!1550 = !DILocation(line: 709, column: 24, scope: !1509)
!1551 = !DILocation(line: 709, column: 21, scope: !1509)
!1552 = !DILocation(line: 710, column: 5, scope: !1509)
!1553 = !DILocation(line: 692, column: 32, scope: !1503)
!1554 = !DILocation(line: 692, column: 5, scope: !1503)
!1555 = distinct !{!1555, !1507, !1556}
!1556 = !DILocation(line: 710, column: 5, scope: !1500)
!1557 = !DILocation(line: 711, column: 5, scope: !1459)
!1558 = !DILocation(line: 712, column: 34, scope: !1459)
!1559 = !DILocation(line: 712, column: 38, scope: !1459)
!1560 = !DILocation(line: 712, column: 5, scope: !1459)
!1561 = !DILocation(line: 713, column: 42, scope: !1459)
!1562 = !DILocation(line: 713, column: 46, scope: !1459)
!1563 = !DILocation(line: 713, column: 5, scope: !1459)
!1564 = !DILocation(line: 714, column: 39, scope: !1459)
!1565 = !DILocation(line: 714, column: 5, scope: !1459)
!1566 = !DILocation(line: 715, column: 40, scope: !1459)
!1567 = !DILocation(line: 715, column: 5, scope: !1459)
!1568 = !DILocation(line: 716, column: 59, scope: !1459)
!1569 = !DILocation(line: 716, column: 52, scope: !1459)
!1570 = !DILocation(line: 716, column: 71, scope: !1459)
!1571 = !DILocation(line: 716, column: 70, scope: !1459)
!1572 = !DILocation(line: 716, column: 5, scope: !1459)
!1573 = !DILocation(line: 717, column: 60, scope: !1459)
!1574 = !DILocation(line: 717, column: 64, scope: !1459)
!1575 = !DILocation(line: 717, column: 53, scope: !1459)
!1576 = !DILocation(line: 717, column: 69, scope: !1459)
!1577 = !DILocation(line: 717, column: 68, scope: !1459)
!1578 = !DILocation(line: 717, column: 5, scope: !1459)
!1579 = !DILocation(line: 718, column: 5, scope: !1459)
!1580 = !DILocation(line: 719, column: 12, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1459, file: !3, line: 719, column: 5)
!1582 = !DILocation(line: 719, column: 10, scope: !1581)
!1583 = !DILocation(line: 719, column: 17, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1581, file: !3, line: 719, column: 5)
!1585 = !DILocation(line: 719, column: 19, scope: !1584)
!1586 = !DILocation(line: 719, column: 5, scope: !1581)
!1587 = !DILocation(line: 720, column: 22, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1589, file: !3, line: 720, column: 13)
!1589 = distinct !DILexicalBlock(scope: !1584, file: !3, line: 719, column: 48)
!1590 = !DILocation(line: 720, column: 13, scope: !1588)
!1591 = !DILocation(line: 720, column: 25, scope: !1588)
!1592 = !DILocation(line: 720, column: 13, scope: !1589)
!1593 = !DILocation(line: 720, column: 31, scope: !1588)
!1594 = !DILocation(line: 721, column: 45, scope: !1589)
!1595 = !DILocation(line: 721, column: 47, scope: !1589)
!1596 = !DILocation(line: 721, column: 44, scope: !1589)
!1597 = !DILocation(line: 721, column: 82, scope: !1589)
!1598 = !DILocation(line: 721, column: 94, scope: !1589)
!1599 = !DILocation(line: 721, column: 85, scope: !1589)
!1600 = !DILocation(line: 721, column: 115, scope: !1589)
!1601 = !DILocation(line: 721, column: 106, scope: !1589)
!1602 = !DILocation(line: 721, column: 99, scope: !1589)
!1603 = !DILocation(line: 721, column: 118, scope: !1589)
!1604 = !DILocation(line: 721, column: 122, scope: !1589)
!1605 = !DILocation(line: 721, column: 117, scope: !1589)
!1606 = !DILocation(line: 721, column: 127, scope: !1589)
!1607 = !DILocation(line: 721, column: 98, scope: !1589)
!1608 = !DILocation(line: 721, column: 9, scope: !1589)
!1609 = !DILocation(line: 722, column: 5, scope: !1589)
!1610 = !DILocation(line: 719, column: 44, scope: !1584)
!1611 = !DILocation(line: 719, column: 5, scope: !1584)
!1612 = distinct !{!1612, !1586, !1613}
!1613 = !DILocation(line: 722, column: 5, scope: !1581)
!1614 = !DILocation(line: 723, column: 1, scope: !1459)
!1615 = distinct !DISubprogram(name: "dictPrintStats", scope: !3, file: !3, line: 725, type: !645, scopeLine: 725, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1616 = !DILocalVariable(name: "d", arg: 1, scope: !1615, file: !3, line: 725, type: !319)
!1617 = !DILocation(line: 725, column: 27, scope: !1615)
!1618 = !DILocation(line: 726, column: 24, scope: !1615)
!1619 = !DILocation(line: 726, column: 27, scope: !1615)
!1620 = !DILocation(line: 726, column: 5, scope: !1615)
!1621 = !DILocation(line: 727, column: 9, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1615, file: !3, line: 727, column: 9)
!1623 = !DILocation(line: 727, column: 9, scope: !1615)
!1624 = !DILocation(line: 728, column: 9, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1622, file: !3, line: 727, column: 29)
!1626 = !DILocation(line: 729, column: 28, scope: !1625)
!1627 = !DILocation(line: 729, column: 31, scope: !1625)
!1628 = !DILocation(line: 729, column: 9, scope: !1625)
!1629 = !DILocation(line: 730, column: 5, scope: !1625)
!1630 = !DILocation(line: 731, column: 1, scope: !1615)
!1631 = distinct !DISubprogram(name: "dictEnableResize", scope: !3, file: !3, line: 733, type: !172, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1632 = !DILocation(line: 734, column: 21, scope: !1631)
!1633 = !DILocation(line: 735, column: 1, scope: !1631)
!1634 = distinct !DISubprogram(name: "dictDisableResize", scope: !3, file: !3, line: 737, type: !172, scopeLine: 737, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1635 = !DILocation(line: 738, column: 21, scope: !1634)
!1636 = !DILocation(line: 739, column: 1, scope: !1634)
!1637 = distinct !DISubprogram(name: "_dictStringCopyHTHashFunction", scope: !3, file: !3, line: 743, type: !61, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1638 = !DILocalVariable(name: "key", arg: 1, scope: !1637, file: !3, line: 743, type: !63)
!1639 = !DILocation(line: 743, column: 56, scope: !1637)
!1640 = !DILocation(line: 745, column: 32, scope: !1637)
!1641 = !DILocation(line: 745, column: 44, scope: !1637)
!1642 = !DILocation(line: 745, column: 37, scope: !1637)
!1643 = !DILocation(line: 745, column: 12, scope: !1637)
!1644 = !DILocation(line: 745, column: 5, scope: !1637)
!1645 = distinct !DISubprogram(name: "_dictStringCopyHTKeyDup", scope: !3, file: !3, line: 748, type: !67, scopeLine: 749, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1646 = !DILocalVariable(name: "privdata", arg: 1, scope: !1645, file: !3, line: 748, type: !11)
!1647 = !DILocation(line: 748, column: 37, scope: !1645)
!1648 = !DILocalVariable(name: "key", arg: 2, scope: !1645, file: !3, line: 748, type: !63)
!1649 = !DILocation(line: 748, column: 59, scope: !1645)
!1650 = !DILocalVariable(name: "len", scope: !1645, file: !3, line: 750, type: !13)
!1651 = !DILocation(line: 750, column: 9, scope: !1645)
!1652 = !DILocation(line: 750, column: 22, scope: !1645)
!1653 = !DILocation(line: 750, column: 15, scope: !1645)
!1654 = !DILocalVariable(name: "copy", scope: !1645, file: !3, line: 751, type: !9)
!1655 = !DILocation(line: 751, column: 11, scope: !1645)
!1656 = !DILocation(line: 751, column: 29, scope: !1645)
!1657 = !DILocation(line: 751, column: 32, scope: !1645)
!1658 = !DILocation(line: 751, column: 18, scope: !1645)
!1659 = !DILocation(line: 752, column: 5, scope: !1645)
!1660 = !DILocation(line: 754, column: 12, scope: !1645)
!1661 = !DILocation(line: 754, column: 18, scope: !1645)
!1662 = !DILocation(line: 754, column: 23, scope: !1645)
!1663 = !DILocation(line: 754, column: 5, scope: !1645)
!1664 = !DILocation(line: 755, column: 5, scope: !1645)
!1665 = !DILocation(line: 755, column: 10, scope: !1645)
!1666 = !DILocation(line: 755, column: 15, scope: !1645)
!1667 = !DILocation(line: 756, column: 12, scope: !1645)
!1668 = !DILocation(line: 756, column: 5, scope: !1645)
!1669 = distinct !DISubprogram(name: "_dictStringKeyValCopyHTValDup", scope: !3, file: !3, line: 759, type: !67, scopeLine: 760, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1670 = !DILocalVariable(name: "privdata", arg: 1, scope: !1669, file: !3, line: 759, type: !11)
!1671 = !DILocation(line: 759, column: 43, scope: !1669)
!1672 = !DILocalVariable(name: "val", arg: 2, scope: !1669, file: !3, line: 759, type: !63)
!1673 = !DILocation(line: 759, column: 65, scope: !1669)
!1674 = !DILocalVariable(name: "len", scope: !1669, file: !3, line: 761, type: !13)
!1675 = !DILocation(line: 761, column: 9, scope: !1669)
!1676 = !DILocation(line: 761, column: 22, scope: !1669)
!1677 = !DILocation(line: 761, column: 15, scope: !1669)
!1678 = !DILocalVariable(name: "copy", scope: !1669, file: !3, line: 762, type: !9)
!1679 = !DILocation(line: 762, column: 11, scope: !1669)
!1680 = !DILocation(line: 762, column: 29, scope: !1669)
!1681 = !DILocation(line: 762, column: 32, scope: !1669)
!1682 = !DILocation(line: 762, column: 18, scope: !1669)
!1683 = !DILocation(line: 763, column: 5, scope: !1669)
!1684 = !DILocation(line: 765, column: 12, scope: !1669)
!1685 = !DILocation(line: 765, column: 18, scope: !1669)
!1686 = !DILocation(line: 765, column: 23, scope: !1669)
!1687 = !DILocation(line: 765, column: 5, scope: !1669)
!1688 = !DILocation(line: 766, column: 5, scope: !1669)
!1689 = !DILocation(line: 766, column: 10, scope: !1669)
!1690 = !DILocation(line: 766, column: 15, scope: !1669)
!1691 = !DILocation(line: 767, column: 12, scope: !1669)
!1692 = !DILocation(line: 767, column: 5, scope: !1669)
!1693 = distinct !DISubprogram(name: "_dictStringCopyHTKeyCompare", scope: !3, file: !3, line: 770, type: !72, scopeLine: 772, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1694 = !DILocalVariable(name: "privdata", arg: 1, scope: !1693, file: !3, line: 770, type: !11)
!1695 = !DILocation(line: 770, column: 39, scope: !1693)
!1696 = !DILocalVariable(name: "key1", arg: 2, scope: !1693, file: !3, line: 770, type: !63)
!1697 = !DILocation(line: 770, column: 61, scope: !1693)
!1698 = !DILocalVariable(name: "key2", arg: 3, scope: !1693, file: !3, line: 771, type: !63)
!1699 = !DILocation(line: 771, column: 21, scope: !1693)
!1700 = !DILocation(line: 773, column: 5, scope: !1693)
!1701 = !DILocation(line: 775, column: 19, scope: !1693)
!1702 = !DILocation(line: 775, column: 25, scope: !1693)
!1703 = !DILocation(line: 775, column: 12, scope: !1693)
!1704 = !DILocation(line: 775, column: 31, scope: !1693)
!1705 = !DILocation(line: 775, column: 5, scope: !1693)
!1706 = distinct !DISubprogram(name: "_dictStringCopyHTKeyDestructor", scope: !3, file: !3, line: 778, type: !76, scopeLine: 779, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1707 = !DILocalVariable(name: "privdata", arg: 1, scope: !1706, file: !3, line: 778, type: !11)
!1708 = !DILocation(line: 778, column: 43, scope: !1706)
!1709 = !DILocalVariable(name: "key", arg: 2, scope: !1706, file: !3, line: 778, type: !11)
!1710 = !DILocation(line: 778, column: 59, scope: !1706)
!1711 = !DILocation(line: 780, column: 5, scope: !1706)
!1712 = !DILocation(line: 782, column: 22, scope: !1706)
!1713 = !DILocation(line: 782, column: 5, scope: !1706)
!1714 = !DILocation(line: 783, column: 1, scope: !1706)
!1715 = distinct !DISubprogram(name: "_dictStringKeyValCopyHTValDestructor", scope: !3, file: !3, line: 785, type: !76, scopeLine: 786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !92)
!1716 = !DILocalVariable(name: "privdata", arg: 1, scope: !1715, file: !3, line: 785, type: !11)
!1717 = !DILocation(line: 785, column: 49, scope: !1715)
!1718 = !DILocalVariable(name: "val", arg: 2, scope: !1715, file: !3, line: 785, type: !11)
!1719 = !DILocation(line: 785, column: 65, scope: !1715)
!1720 = !DILocation(line: 787, column: 5, scope: !1715)
!1721 = !DILocation(line: 789, column: 22, scope: !1715)
!1722 = !DILocation(line: 789, column: 5, scope: !1715)
!1723 = !DILocation(line: 790, column: 1, scope: !1715)
