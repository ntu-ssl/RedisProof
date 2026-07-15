; ModuleID = 'Redis.c'
source_filename = "Redis.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.dictType = type { i32 (i8*)*, i8* (i8*, i8*)*, i8* (i8*, i8*)*, i32 (i8*, i8*, i8*)*, void (i8*, i8*)*, void (i8*, i8*)* }
%struct.dictht = type { %struct.dictEntry**, i64, i64, i64 }
%struct.dictEntry = type { i8*, i8*, %struct.dictEntry* }
%struct.dict = type { %struct.dictType*, i8*, [2 x %struct.dictht], i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.dictIterator = type { %struct.dict*, i32, i32, %struct.dictEntry*, %struct.dictEntry* }

@used_memory = dso_local local_unnamed_addr global i64 0, align 8, !dbg !0
@zmalloc_thread_safe = dso_local local_unnamed_addr global i32 0, align 4, !dbg !16
@used_memory_mutex = dso_local global %union.pthread_mutex_t zeroinitializer, align 8, !dbg !18
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [53 x i8] c"zmalloc: Out of memory trying to allocate %zu bytes\0A\00", align 1
@dict_can_resize = dso_local local_unnamed_addr global i32 1, align 4, !dbg !51
@.str.4 = private unnamed_addr constant [18 x i8] c" table size: %ld\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c" number of elements: %ld\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c" different slots: %ld\0A\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c" max chain length: %ld\0A\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c" avg chain length (counted): %.02f\0A\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c" avg chain length (computed): %.02f\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"   %s%ld: %ld (%.02f%%)\0A\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@dictTypeHeapStringCopyKey = dso_local local_unnamed_addr global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* @_dictStringCopyHTKeyDup, i8* (i8*, i8*)* null, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* null }, align 8, !dbg !53
@dictTypeHeapStrings = dso_local local_unnamed_addr global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* null, i8* (i8*, i8*)* null, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* null }, align 8, !dbg !79
@dictTypeHeapStringCopyKeyValue = dso_local local_unnamed_addr global %struct.dictType { i32 (i8*)* @_dictStringCopyHTHashFunction, i8* (i8*, i8*)* @_dictStringCopyHTKeyDup, i8* (i8*, i8*)* @_dictStringKeyValCopyHTValDup, i32 (i8*, i8*, i8*)* @_dictStringCopyHTKeyCompare, void (i8*, i8*)* @_dictStringCopyHTKeyDestructor, void (i8*, i8*)* @_dictStringKeyValCopyHTValDestructor }, align 8, !dbg !81
@str = private unnamed_addr constant [18 x i8] c"Hash table stats:\00", align 1
@str.17 = private unnamed_addr constant [28 x i8] c" Chain length distribution:\00", align 1
@str.18 = private unnamed_addr constant [42 x i8] c"No stats available for empty dictionaries\00", align 1
@str.19 = private unnamed_addr constant [25 x i8] c"-- Rehashing into ht[1]:\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local void @zmalloc_oom(i64 noundef %size) local_unnamed_addr #0 !dbg !90 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !96, !tbaa !97
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %0, i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @.str, i64 0, i64 0), i64 noundef %size) #23, !dbg !101
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !102, !tbaa !97
  %call1 = call i32 @fflush(%struct._IO_FILE* noundef %1), !dbg !103
  call void @abort() #24, !dbg !104
  unreachable, !dbg !104
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !105 noundef i32 @fflush(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull i8* @zmalloc(i64 noundef %size) local_unnamed_addr #4 !dbg !165 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !169, metadata !DIExpression()), !dbg !173
  %add = add i64 %size, 8, !dbg !174
  %call = call noalias i8* @malloc(i64 noundef %add) #25, !dbg !175
  call void @llvm.dbg.value(metadata i8* %call, metadata !170, metadata !DIExpression()), !dbg !173
  %tobool.not = icmp eq i8* %call, null, !dbg !176
  br i1 %tobool.not, label %if.then, label %if.end, !dbg !178

if.then:                                          ; preds = %entry
  call void @zmalloc_oom(i64 noundef %size), !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %entry
  %0 = bitcast i8* %call to i64*, !dbg !180
  store i64 %size, i64* %0, align 8, !dbg !181, !tbaa !182
  call void @llvm.dbg.value(metadata i64 %add, metadata !171, metadata !DIExpression()), !dbg !184
  %and = and i64 %size, 7, !dbg !185
  %tobool2.not = icmp eq i64 %and, 0, !dbg !185
  %1 = add i64 %size, 16, !dbg !187
  %add5 = and i64 %1, -8, !dbg !187
  %_n.0 = select i1 %tobool2.not, i64 %add, i64 %add5, !dbg !187
  call void @llvm.dbg.value(metadata i64 %_n.0, metadata !171, metadata !DIExpression()), !dbg !184
  %2 = load i32, i32* @zmalloc_thread_safe, align 4, !dbg !188, !tbaa !190
  %tobool7.not = icmp eq i32 %2, 0, !dbg !188
  br i1 %tobool7.not, label %if.else, label %if.then8, !dbg !187

if.then8:                                         ; preds = %if.end
  %call9 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef nonnull @used_memory_mutex) #25, !dbg !192
  %3 = load i64, i64* @used_memory, align 8, !dbg !192, !tbaa !182
  %add10 = add i64 %3, %_n.0, !dbg !192
  store i64 %add10, i64* @used_memory, align 8, !dbg !192, !tbaa !182
  %call11 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef nonnull @used_memory_mutex) #25, !dbg !192
  br label %if.end13, !dbg !192

if.else:                                          ; preds = %if.end
  %4 = load i64, i64* @used_memory, align 8, !dbg !194, !tbaa !182
  %add12 = add i64 %4, %_n.0, !dbg !194
  store i64 %add12, i64* @used_memory, align 8, !dbg !194, !tbaa !182
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then8
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 8, !dbg !196
  ret i8* %add.ptr, !dbg !197
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !198 i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef) local_unnamed_addr #7

; Function Attrs: nounwind
declare !dbg !203 i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef) local_unnamed_addr #7

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @zfree(i8* noundef %ptr) local_unnamed_addr #4 !dbg !204 {
entry:
  call void @llvm.dbg.value(metadata i8* %ptr, metadata !208, metadata !DIExpression()), !dbg !213
  %cmp = icmp eq i8* %ptr, null, !dbg !214
  br i1 %cmp, label %cleanup, label %if.end, !dbg !216

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds i8, i8* %ptr, i64 -8, !dbg !217
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !209, metadata !DIExpression()), !dbg !213
  %0 = bitcast i8* %add.ptr to i64*, !dbg !218
  %1 = load i64, i64* %0, align 8, !dbg !219, !tbaa !182
  call void @llvm.dbg.value(metadata i64 %1, metadata !210, metadata !DIExpression()), !dbg !213
  %add = add i64 %1, 8, !dbg !220
  call void @llvm.dbg.value(metadata i64 %add, metadata !211, metadata !DIExpression()), !dbg !221
  %and = and i64 %1, 7, !dbg !222
  %tobool.not = icmp eq i64 %and, 0, !dbg !222
  %2 = add i64 %1, 16, !dbg !220
  %add3 = and i64 %2, -8, !dbg !220
  %_n.0 = select i1 %tobool.not, i64 %add, i64 %add3, !dbg !220
  call void @llvm.dbg.value(metadata i64 %_n.0, metadata !211, metadata !DIExpression()), !dbg !221
  %3 = load i32, i32* @zmalloc_thread_safe, align 4, !dbg !224, !tbaa !190
  %tobool5.not = icmp eq i32 %3, 0, !dbg !224
  br i1 %tobool5.not, label %if.else, label %if.then6, !dbg !220

if.then6:                                         ; preds = %if.end
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* noundef nonnull @used_memory_mutex) #25, !dbg !226
  %4 = load i64, i64* @used_memory, align 8, !dbg !226, !tbaa !182
  %sub7 = sub i64 %4, %_n.0, !dbg !226
  store i64 %sub7, i64* @used_memory, align 8, !dbg !226, !tbaa !182
  %call8 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* noundef nonnull @used_memory_mutex) #25, !dbg !226
  br label %if.end10, !dbg !226

if.else:                                          ; preds = %if.end
  %5 = load i64, i64* @used_memory, align 8, !dbg !228, !tbaa !182
  %sub9 = sub i64 %5, %_n.0, !dbg !228
  store i64 %sub9, i64* @used_memory, align 8, !dbg !228, !tbaa !182
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then6
  call void @free(i8* noundef %add.ptr) #25, !dbg !230
  br label %cleanup, !dbg !231

cleanup:                                          ; preds = %entry, %if.end10
  ret void, !dbg !231
}

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare void @free(i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: noinline nounwind uwtable
define dso_local void @test() local_unnamed_addr #4 !dbg !232 {
entry:
  %call = call i8* @zmalloc(i64 noundef 1), !dbg !237
  call void @llvm.dbg.value(metadata i8* %call, metadata !236, metadata !DIExpression()), !dbg !238
  store i8 99, i8* %call, align 1, !dbg !239, !tbaa !240
  call void @zfree(i8* noundef nonnull %call), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull i8* @_dictAlloc(i64 noundef %size) local_unnamed_addr #4 !dbg !243 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !245, metadata !DIExpression()), !dbg !247
  %call = call i8* @zmalloc(i64 noundef %size), !dbg !248
  call void @llvm.dbg.value(metadata i8* %call, metadata !246, metadata !DIExpression()), !dbg !247
  ret i8* %call, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_dictFree(i8* noundef %ptr) local_unnamed_addr #4 !dbg !250 {
entry:
  call void @llvm.dbg.value(metadata i8* %ptr, metadata !252, metadata !DIExpression()), !dbg !253
  call void @zfree(i8* noundef %ptr), !dbg !254
  ret void, !dbg !255
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define dso_local i32 @dictIntHashFunction(i32 noundef %key) local_unnamed_addr #9 !dbg !256 {
entry:
  call void @llvm.dbg.value(metadata i32 %key, metadata !260, metadata !DIExpression()), !dbg !261
  %shl.neg = mul i32 %key, -32768, !dbg !262
  %sub = add i32 %key, -1, !dbg !262
  %add = add i32 %sub, %shl.neg, !dbg !263
  call void @llvm.dbg.value(metadata i32 %add, metadata !260, metadata !DIExpression()), !dbg !261
  %shr = lshr i32 %add, 10, !dbg !264
  %sub5 = xor i32 %shr, %add, !dbg !264
  call void @llvm.dbg.value(metadata i32 %sub5, metadata !260, metadata !DIExpression()), !dbg !261
  %add7 = mul i32 %sub5, 9, !dbg !265
  call void @llvm.dbg.value(metadata i32 %add7, metadata !260, metadata !DIExpression()), !dbg !261
  %shr8 = lshr i32 %add7, 6, !dbg !266
  %sub12 = xor i32 %shr8, %add7, !dbg !266
  call void @llvm.dbg.value(metadata i32 %sub12, metadata !260, metadata !DIExpression()), !dbg !261
  %shl13.neg = mul i32 %sub12, -2048, !dbg !267
  %sub17 = add i32 %sub12, -1, !dbg !267
  %add18 = add i32 %sub17, %shl13.neg, !dbg !268
  call void @llvm.dbg.value(metadata i32 %add18, metadata !260, metadata !DIExpression()), !dbg !261
  %shr19 = lshr i32 %add18, 16, !dbg !269
  %sub23 = xor i32 %shr19, %add18, !dbg !269
  call void @llvm.dbg.value(metadata i32 %sub23, metadata !260, metadata !DIExpression()), !dbg !261
  ret i32 %sub23, !dbg !270
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define dso_local i32 @dictIdentityHashFunction(i32 noundef returned %key) local_unnamed_addr #9 !dbg !271 {
entry:
  call void @llvm.dbg.value(metadata i32 %key, metadata !273, metadata !DIExpression()), !dbg !274
  ret i32 %key, !dbg !275
}

; Function Attrs: nofree noinline norecurse nosync nounwind readonly uwtable
define dso_local i32 @dictGenHashFunction(i8* nocapture noundef readonly %buf, i32 noundef %len) local_unnamed_addr #10 !dbg !276 {
entry:
  call void @llvm.dbg.value(metadata i8* %buf, metadata !283, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i32 %len, metadata !284, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i32 5381, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i32 %len, metadata !284, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !286
  %tobool.not5 = icmp eq i32 %len, 0, !dbg !287
  br i1 %tobool.not5, label %while.end, label %while.body, !dbg !287

while.body:                                       ; preds = %entry, %while.body
  %hash.08 = phi i32 [ %add1, %while.body ], [ 5381, %entry ]
  %len.addr.07 = phi i32 [ %dec, %while.body ], [ %len, %entry ]
  %buf.addr.06 = phi i8* [ %incdec.ptr, %while.body ], [ %buf, %entry ]
  call void @llvm.dbg.value(metadata i32 %hash.08, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i32 %len.addr.07, metadata !284, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i8* %buf.addr.06, metadata !283, metadata !DIExpression()), !dbg !286
  %dec = add nsw i32 %len.addr.07, -1, !dbg !288
  call void @llvm.dbg.value(metadata i32 %dec, metadata !284, metadata !DIExpression()), !dbg !286
  %add = mul i32 %hash.08, 33, !dbg !289
  %incdec.ptr = getelementptr inbounds i8, i8* %buf.addr.06, i64 1, !dbg !290
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !283, metadata !DIExpression()), !dbg !286
  %0 = load i8, i8* %buf.addr.06, align 1, !dbg !291, !tbaa !240
  %conv = zext i8 %0 to i32, !dbg !292
  %add1 = add i32 %add, %conv, !dbg !293
  call void @llvm.dbg.value(metadata i32 %add1, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.value(metadata i32 %dec, metadata !284, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !286
  %tobool.not = icmp eq i32 %dec, 0, !dbg !287
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !287, !llvm.loop !294

while.end:                                        ; preds = %while.body, %entry
  %hash.0.lcssa = phi i32 [ 5381, %entry ], [ %add1, %while.body ], !dbg !286
  ret i32 %hash.0.lcssa, !dbg !297
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @_dictReset(%struct.dictht* nocapture noundef writeonly %ht) local_unnamed_addr #11 !dbg !298 {
entry:
  call void @llvm.dbg.value(metadata %struct.dictht* %ht, metadata !319, metadata !DIExpression()), !dbg !320
  %0 = bitcast %struct.dictht* %ht to i8*, !dbg !321
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %0, i8 0, i64 32, i1 false), !dbg !322
  ret void, !dbg !321
}

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull %struct.dict* @dictCreate(%struct.dictType* noundef %type, i8* noundef %privDataPtr) local_unnamed_addr #4 !dbg !323 {
entry:
  call void @llvm.dbg.value(metadata %struct.dictType* %type, metadata !340, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata i8* %privDataPtr, metadata !341, metadata !DIExpression()), !dbg !343
  %call = call i8* @_dictAlloc(i64 noundef 88), !dbg !344
  %0 = bitcast i8* %call to %struct.dict*, !dbg !344
  call void @llvm.dbg.value(metadata %struct.dict* %0, metadata !342, metadata !DIExpression()), !dbg !343
  %call1 = call i32 @_dictInit(%struct.dict* noundef nonnull %0, %struct.dictType* noundef %type, i8* noundef %privDataPtr), !dbg !345
  ret %struct.dict* %0, !dbg !346
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn writeonly
define dso_local i32 @_dictInit(%struct.dict* nocapture noundef writeonly %d, %struct.dictType* noundef %type, i8* noundef %privDataPtr) local_unnamed_addr #11 !dbg !347 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !351, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.value(metadata %struct.dictType* %type, metadata !352, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.value(metadata i8* %privDataPtr, metadata !353, metadata !DIExpression()), !dbg !354
  %arrayidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, !dbg !355
  call void @_dictReset(%struct.dictht* noundef nonnull %arrayidx), !dbg !356
  %arrayidx2 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, !dbg !357
  call void @_dictReset(%struct.dictht* noundef nonnull %arrayidx2), !dbg !358
  %type3 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !359
  store %struct.dictType* %type, %struct.dictType** %type3, align 8, !dbg !360, !tbaa !361
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !363
  store i8* %privDataPtr, i8** %privdata, align 8, !dbg !364, !tbaa !365
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !366
  store i32 -1, i32* %rehashidx, align 8, !dbg !367, !tbaa !368
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 4, !dbg !369
  store i32 0, i32* %iterators, align 4, !dbg !370, !tbaa !371
  ret i32 0, !dbg !372
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictResize(%struct.dict* nocapture noundef %d) local_unnamed_addr #4 !dbg !373 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !377, metadata !DIExpression()), !dbg !379
  %0 = load i32, i32* @dict_can_resize, align 4, !dbg !380, !tbaa !190
  %tobool.not = icmp eq i32 %0, 0, !dbg !380
  br i1 %tobool.not, label %cleanup, label %lor.lhs.false, !dbg !382

lor.lhs.false:                                    ; preds = %entry
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !383
  %1 = load i32, i32* %rehashidx, align 8, !dbg !383, !tbaa !368
  %cmp.not = icmp eq i32 %1, -1, !dbg !383
  br i1 %cmp.not, label %if.end, label %cleanup, !dbg !384

if.end:                                           ; preds = %lor.lhs.false
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 3, !dbg !385
  %2 = load i64, i64* %used, align 8, !dbg !385, !tbaa !386
  %conv = trunc i64 %2 to i32, !dbg !388
  call void @llvm.dbg.value(metadata i32 %conv, metadata !378, metadata !DIExpression()), !dbg !379
  %3 = icmp sgt i32 %conv, 4, !dbg !389
  %.op = and i64 %2, 4294967295, !dbg !390
  %conv5 = select i1 %3, i64 %.op, i64 4, !dbg !390
  call void @llvm.dbg.value(metadata i64 undef, metadata !378, metadata !DIExpression()), !dbg !379
  %call = call i32 @dictExpand(%struct.dict* noundef %d, i64 noundef %conv5), !dbg !391
  br label %cleanup, !dbg !392

cleanup:                                          ; preds = %entry, %lor.lhs.false, %if.end
  %retval.0 = phi i32 [ %call, %if.end ], [ 1, %lor.lhs.false ], [ 1, %entry ], !dbg !379
  ret i32 %retval.0, !dbg !393
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictExpand(%struct.dict* nocapture noundef %d, i64 noundef %size) local_unnamed_addr #4 !dbg !394 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !398, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.value(metadata i64 %size, metadata !399, metadata !DIExpression()), !dbg !402
  %call = call i64 @_dictNextPower(i64 noundef %size), !dbg !403
  call void @llvm.dbg.value(metadata i64 %call, metadata !401, metadata !DIExpression()), !dbg !402
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !404
  %0 = load i32, i32* %rehashidx, align 8, !dbg !404, !tbaa !368
  %cmp.not = icmp eq i32 %0, -1, !dbg !404
  br i1 %cmp.not, label %lor.lhs.false, label %cleanup, !dbg !406

lor.lhs.false:                                    ; preds = %entry
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 3, !dbg !407
  %1 = load i64, i64* %used, align 8, !dbg !407, !tbaa !386
  %cmp1 = icmp ugt i64 %1, %size, !dbg !408
  br i1 %cmp1, label %cleanup, label %if.end, !dbg !409

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.value(metadata i64 %call, metadata !400, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !402
  %sub = add i64 %call, -1, !dbg !410
  call void @llvm.dbg.value(metadata i64 %sub, metadata !400, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !402
  %mul = shl i64 %call, 3, !dbg !411
  %call3 = call i8* @_dictAlloc(i64 noundef %mul), !dbg !412
  call void @llvm.dbg.value(metadata i8* %call3, metadata !400, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !402
  call void @llvm.dbg.value(metadata i64 0, metadata !400, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !402
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %call3, i8 0, i64 %mul, i1 false), !dbg !413
  %table9 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 0, !dbg !414
  %2 = load %struct.dictEntry**, %struct.dictEntry*** %table9, align 8, !dbg !414, !tbaa !416
  %cmp10 = icmp eq %struct.dictEntry** %2, null, !dbg !417
  br i1 %cmp10, label %if.then11, label %if.end14, !dbg !418

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata i8* %call3, metadata !400, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !402
  %3 = bitcast %struct.dictEntry*** %table9 to i8**, !dbg !419
  store i8* %call3, i8** %3, align 8, !dbg !419, !tbaa.struct !421
  %n.sroa.6.0..sroa_idx26 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 1, !dbg !419
  store i64 %call, i64* %n.sroa.6.0..sroa_idx26, align 8, !dbg !419, !tbaa.struct !422
  %n.sroa.7.0..sroa_idx30 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 2, !dbg !419
  store i64 %sub, i64* %n.sroa.7.0..sroa_idx30, align 8, !dbg !419, !tbaa.struct !423
  store i64 0, i64* %used, align 8, !dbg !419, !tbaa.struct !424
  br label %cleanup, !dbg !425

if.end14:                                         ; preds = %if.end
  %n.sroa.0.0..sroa_idx23 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 0, !dbg !426
  %4 = bitcast %struct.dictEntry*** %n.sroa.0.0..sroa_idx23 to i8**, !dbg !426
  store i8* %call3, i8** %4, align 8, !dbg !426, !tbaa.struct !421
  %n.sroa.6.0..sroa_idx27 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 1, !dbg !426
  store i64 %call, i64* %n.sroa.6.0..sroa_idx27, align 8, !dbg !426, !tbaa.struct !422
  %n.sroa.7.0..sroa_idx31 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 2, !dbg !426
  store i64 %sub, i64* %n.sroa.7.0..sroa_idx31, align 8, !dbg !426, !tbaa.struct !423
  %n.sroa.8.0..sroa_idx35 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 3, !dbg !426
  store i64 0, i64* %n.sroa.8.0..sroa_idx35, align 8, !dbg !426, !tbaa.struct !424
  store i32 0, i32* %rehashidx, align 8, !dbg !427, !tbaa !368
  br label %cleanup, !dbg !428

cleanup:                                          ; preds = %entry, %lor.lhs.false, %if.end14, %if.then11
  %retval.0 = phi i32 [ 0, %if.then11 ], [ 0, %if.end14 ], [ 1, %lor.lhs.false ], [ 1, %entry ], !dbg !402
  ret i32 %retval.0, !dbg !429
}

; Function Attrs: nofree noinline norecurse nosync nounwind readnone uwtable
define dso_local i64 @_dictNextPower(i64 noundef %size) local_unnamed_addr #12 !dbg !430 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !434, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.value(metadata i64 4, metadata !435, metadata !DIExpression()), !dbg !436
  %cmp = icmp ugt i64 %size, 9223372036854775806, !dbg !437
  br i1 %cmp, label %cleanup, label %while.cond, !dbg !439

while.cond:                                       ; preds = %entry, %while.cond
  %i.0 = phi i64 [ %mul, %while.cond ], [ 4, %entry ], !dbg !436
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !435, metadata !DIExpression()), !dbg !436
  %cmp1.not = icmp ult i64 %i.0, %size, !dbg !440
  %mul = shl i64 %i.0, 1, !dbg !443
  call void @llvm.dbg.value(metadata i64 %mul, metadata !435, metadata !DIExpression()), !dbg !436
  br i1 %cmp1.not, label %while.cond, label %cleanup, !dbg !444, !llvm.loop !445

cleanup:                                          ; preds = %while.cond, %entry
  %retval.0 = phi i64 [ 9223372036854775807, %entry ], [ %i.0, %while.cond ], !dbg !436
  ret i64 %retval.0, !dbg !448
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #13

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #14

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictRehash(%struct.dict* nocapture noundef %d, i32 noundef %n) local_unnamed_addr #4 !dbg !449 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !453, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 %n, metadata !454, metadata !DIExpression()), !dbg !460
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !461
  %0 = load i32, i32* %rehashidx, align 8, !dbg !461, !tbaa !368
  %cmp.not = icmp eq i32 %0, -1, !dbg !461
  br i1 %cmp.not, label %return, label %while.cond.preheader, !dbg !463

while.cond.preheader:                             ; preds = %entry
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 3
  %table16 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, i32 0
  %table16.le = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, i32 0
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0
  %sizemask = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 2
  %table36 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 0
  %used51 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 3
  %1 = bitcast [2 x %struct.dictht]* %ht to i8**
  %arrayidx8 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1
  %2 = bitcast [2 x %struct.dictht]* %ht to i8*
  %3 = bitcast %struct.dictht* %arrayidx8 to i8*
  br label %while.cond, !dbg !464

while.cond:                                       ; preds = %while.cond.preheader, %cleanup
  %n.addr.0 = phi i32 [ %dec, %cleanup ], [ %n, %while.cond.preheader ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !454, metadata !DIExpression()), !dbg !460
  %dec = add nsw i32 %n.addr.0, -1, !dbg !465
  call void @llvm.dbg.value(metadata i32 %dec, metadata !454, metadata !DIExpression()), !dbg !460
  %tobool.not = icmp eq i32 %n.addr.0, 0, !dbg !464
  br i1 %tobool.not, label %return, label %while.body, !dbg !464

while.body:                                       ; preds = %while.cond
  %4 = load i64, i64* %used, align 8, !dbg !466, !tbaa !386
  %cmp1 = icmp eq i64 %4, 0, !dbg !468
  br i1 %cmp1, label %if.then2, label %while.cond13.preheader, !dbg !469

while.cond13.preheader:                           ; preds = %while.body
  %5 = load %struct.dictEntry**, %struct.dictEntry*** %table16, align 8, !tbaa !416
  %rehashidx.promoted = load i32, i32* %rehashidx, align 8, !tbaa !368
  %idxprom93 = sext i32 %rehashidx.promoted to i64, !dbg !470
  %arrayidx1894 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %5, i64 %idxprom93, !dbg !470
  %6 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx1894, align 8, !dbg !470, !tbaa !97
  %cmp1995 = icmp eq %struct.dictEntry* %6, null, !dbg !471
  br i1 %cmp1995, label %while.body20.preheader, label %while.cond28.preheader, !dbg !472

while.body20.preheader:                           ; preds = %while.cond13.preheader
  %7 = sext i32 %rehashidx.promoted to i64, !dbg !472
  br label %while.body20, !dbg !472

if.then2:                                         ; preds = %while.body
  %8 = load i8*, i8** %1, align 8, !dbg !473, !tbaa !416
  call void @_dictFree(i8* noundef %8), !dbg !475
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %2, i8* noundef nonnull align 8 dereferenceable(32) %3, i64 32, i1 false), !dbg !476, !tbaa.struct !421
  call void @_dictReset(%struct.dictht* noundef nonnull %arrayidx8), !dbg !477
  br label %cleanup, !dbg !478

while.cond13.while.cond28.preheader_crit_edge:    ; preds = %while.body20
  %9 = trunc i64 %indvars.iv.next to i32, !dbg !479
  store i32 %9, i32* %rehashidx, align 8, !dbg !479, !tbaa !368
  br label %while.cond28.preheader, !dbg !472

while.cond28.preheader:                           ; preds = %while.cond13.while.cond28.preheader_crit_edge, %while.cond13.preheader
  %.lcssa = phi %struct.dictEntry* [ %10, %while.cond13.while.cond28.preheader_crit_edge ], [ %6, %while.cond13.preheader ], !dbg !470
  call void @llvm.dbg.value(metadata %struct.dictEntry* %.lcssa, metadata !455, metadata !DIExpression()), !dbg !480
  %tobool29.not98 = icmp eq %struct.dictEntry* %.lcssa, null, !dbg !481
  br i1 %tobool29.not98, label %while.end53, label %while.body30, !dbg !481

while.body20:                                     ; preds = %while.body20.preheader, %while.body20
  %indvars.iv = phi i64 [ %7, %while.body20.preheader ], [ %indvars.iv.next, %while.body20 ]
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !479
  %arrayidx18 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %5, i64 %indvars.iv.next, !dbg !470
  %10 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx18, align 8, !dbg !470, !tbaa !97
  %cmp19 = icmp eq %struct.dictEntry* %10, null, !dbg !471
  br i1 %cmp19, label %while.body20, label %while.cond13.while.cond28.preheader_crit_edge, !dbg !472, !llvm.loop !482

while.body30:                                     ; preds = %while.cond28.preheader, %while.body30
  %de.099 = phi %struct.dictEntry* [ %11, %while.body30 ], [ %.lcssa, %while.cond28.preheader ]
  call void @llvm.dbg.value(metadata %struct.dictEntry* %de.099, metadata !455, metadata !DIExpression()), !dbg !480
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %de.099, i64 0, i32 2, !dbg !483
  %11 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !483, !tbaa !484
  call void @llvm.dbg.value(metadata %struct.dictEntry* %11, metadata !457, metadata !DIExpression()), !dbg !480
  %12 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !486, !tbaa !361
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %12, i64 0, i32 0, !dbg !486
  %13 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !486, !tbaa !487
  %key = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %de.099, i64 0, i32 0, !dbg !486
  %14 = load i8*, i8** %key, align 8, !dbg !486, !tbaa !489
  %call = call i32 %13(i8* noundef %14) #25, !dbg !486
  %15 = load i64, i64* %sizemask, align 8, !dbg !490, !tbaa !491
  %16 = trunc i64 %15 to i32, !dbg !486
  %conv33 = and i32 %call, %16, !dbg !486
  call void @llvm.dbg.value(metadata i32 %conv33, metadata !458, metadata !DIExpression()), !dbg !492
  %17 = load %struct.dictEntry**, %struct.dictEntry*** %table36, align 8, !dbg !493, !tbaa !416
  %idxprom37 = zext i32 %conv33 to i64, !dbg !494
  %arrayidx38 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %17, i64 %idxprom37, !dbg !494
  %18 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx38, align 8, !dbg !494, !tbaa !97
  store %struct.dictEntry* %18, %struct.dictEntry** %next, align 8, !dbg !495, !tbaa !484
  store %struct.dictEntry* %de.099, %struct.dictEntry** %arrayidx38, align 8, !dbg !496, !tbaa !97
  %19 = load i64, i64* %used, align 8, !dbg !497, !tbaa !386
  %dec48 = add i64 %19, -1, !dbg !497
  store i64 %dec48, i64* %used, align 8, !dbg !497, !tbaa !386
  %20 = load i64, i64* %used51, align 8, !dbg !498, !tbaa !386
  %inc52 = add i64 %20, 1, !dbg !498
  store i64 %inc52, i64* %used51, align 8, !dbg !498, !tbaa !386
  call void @llvm.dbg.value(metadata %struct.dictEntry* %11, metadata !455, metadata !DIExpression()), !dbg !480
  %tobool29.not = icmp eq %struct.dictEntry* %11, null, !dbg !481
  br i1 %tobool29.not, label %while.end53, label %while.body30, !dbg !481, !llvm.loop !499

while.end53:                                      ; preds = %while.body30, %while.cond28.preheader
  %21 = load %struct.dictEntry**, %struct.dictEntry*** %table16.le, align 8, !dbg !501, !tbaa !416
  %22 = load i32, i32* %rehashidx, align 8, !dbg !502, !tbaa !368
  %idxprom58 = sext i32 %22 to i64, !dbg !503
  %arrayidx59 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %21, i64 %idxprom58, !dbg !503
  store %struct.dictEntry* null, %struct.dictEntry** %arrayidx59, align 8, !dbg !504, !tbaa !97
  %inc61 = add nsw i32 %22, 1, !dbg !505
  br label %cleanup, !dbg !506

cleanup:                                          ; preds = %while.end53, %if.then2
  %storemerge = phi i32 [ %inc61, %while.end53 ], [ -1, %if.then2 ], !dbg !480
  store i32 %storemerge, i32* %rehashidx, align 8, !dbg !480, !tbaa !368
  br i1 %cmp1, label %return, label %while.cond

return:                                           ; preds = %while.cond, %cleanup, %entry
  %retval.2 = phi i32 [ 0, %entry ], [ 0, %cleanup ], [ 1, %while.cond ], !dbg !460
  ret i32 %retval.2, !dbg !507
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i64 @timeInMilliseconds() local_unnamed_addr #15 !dbg !508 {
entry:
  %tv = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %tv to i8*, !dbg !520
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #25, !dbg !520
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !512, metadata !DIExpression()), !dbg !521
  %call = call i32 @gettimeofday(%struct.timeval* noundef nonnull %tv, i8* noundef null) #25, !dbg !522
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0, !dbg !523
  %1 = load i64, i64* %tv_sec, align 8, !dbg !523, !tbaa !524
  %mul = mul nsw i64 %1, 1000, !dbg !526
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1, !dbg !527
  %2 = load i64, i64* %tv_usec, align 8, !dbg !527, !tbaa !528
  %div = sdiv i64 %2, 1000, !dbg !529
  %add = add nsw i64 %div, %mul, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #25, !dbg !531
  ret i64 %add, !dbg !532
}

; Function Attrs: nofree nounwind
declare !dbg !533 noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictRehashMilliseconds(%struct.dict* nocapture noundef %d, i32 noundef %ms) local_unnamed_addr #4 !dbg !540 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !542, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 %ms, metadata !543, metadata !DIExpression()), !dbg !546
  %call = call i64 @timeInMilliseconds(), !dbg !547
  call void @llvm.dbg.value(metadata i64 %call, metadata !544, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 0, metadata !545, metadata !DIExpression()), !dbg !546
  %conv = sext i32 %ms to i64
  br label %while.cond, !dbg !548

while.cond:                                       ; preds = %while.body, %entry
  %rehashes.0 = phi i32 [ 0, %entry ], [ %add, %while.body ], !dbg !546
  call void @llvm.dbg.value(metadata i32 %rehashes.0, metadata !545, metadata !DIExpression()), !dbg !546
  %call1 = call i32 @dictRehash(%struct.dict* noundef %d, i32 noundef 100), !dbg !549
  %tobool.not = icmp eq i32 %call1, 0, !dbg !548
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !548

while.body:                                       ; preds = %while.cond
  %add = add nuw nsw i32 %rehashes.0, 100, !dbg !550
  call void @llvm.dbg.value(metadata i32 %add, metadata !545, metadata !DIExpression()), !dbg !546
  %call2 = call i64 @timeInMilliseconds(), !dbg !552
  %sub = sub nsw i64 %call2, %call, !dbg !554
  %cmp = icmp sgt i64 %sub, %conv, !dbg !555
  br i1 %cmp, label %while.end, label %while.cond, !dbg !556, !llvm.loop !557

while.end:                                        ; preds = %while.body, %while.cond
  %rehashes.1 = phi i32 [ %add, %while.body ], [ %rehashes.0, %while.cond ], !dbg !546
  call void @llvm.dbg.value(metadata i32 %rehashes.1, metadata !545, metadata !DIExpression()), !dbg !546
  ret i32 %rehashes.1, !dbg !559
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_dictRehashStep(%struct.dict* nocapture noundef %d) local_unnamed_addr #4 !dbg !560 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !564, metadata !DIExpression()), !dbg !565
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 4, !dbg !566
  %0 = load i32, i32* %iterators, align 4, !dbg !566, !tbaa !371
  %cmp = icmp eq i32 %0, 0, !dbg !568
  br i1 %cmp, label %if.then, label %if.end, !dbg !569

if.then:                                          ; preds = %entry
  %call = call i32 @dictRehash(%struct.dict* noundef %d, i32 noundef 1), !dbg !570
  br label %if.end, !dbg !570

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !571
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictAdd(%struct.dict* nocapture noundef %d, i8* noundef %key, i8* noundef %val) local_unnamed_addr #4 !dbg !572 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !576, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata i8* %key, metadata !577, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata i8* %val, metadata !578, metadata !DIExpression()), !dbg !582
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !583
  %0 = load i32, i32* %rehashidx, align 8, !dbg !583, !tbaa !368
  %cmp.not = icmp eq i32 %0, -1, !dbg !583
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !585

if.then:                                          ; preds = %entry
  call void @_dictRehashStep(%struct.dict* noundef %d), !dbg !586
  br label %if.end, !dbg !586

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @_dictKeyIndex(%struct.dict* noundef %d, i8* noundef %key), !dbg !587
  call void @llvm.dbg.value(metadata i32 %call, metadata !579, metadata !DIExpression()), !dbg !582
  %cmp2 = icmp eq i32 %call, -1, !dbg !589
  br i1 %cmp2, label %cleanup, label %if.end4, !dbg !590

if.end4:                                          ; preds = %if.end
  %1 = load i32, i32* %rehashidx, align 8, !dbg !591, !tbaa !368
  %cmp6.not = icmp eq i32 %1, -1, !dbg !591
  %arrayidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, !dbg !591
  %arrayidx9 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, !dbg !591
  %cond = select i1 %cmp6.not, %struct.dictht* %arrayidx9, %struct.dictht* %arrayidx, !dbg !591
  call void @llvm.dbg.value(metadata %struct.dictht* %cond, metadata !581, metadata !DIExpression()), !dbg !582
  %call10 = call i8* @_dictAlloc(i64 noundef 24), !dbg !592
  call void @llvm.dbg.value(metadata i8* %call10, metadata !580, metadata !DIExpression()), !dbg !582
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %cond, i64 0, i32 0, !dbg !593
  %2 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !593, !tbaa !416
  %idxprom = sext i32 %call to i64, !dbg !594
  %arrayidx11 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %2, i64 %idxprom, !dbg !594
  %3 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx11, align 8, !dbg !594, !tbaa !97
  %next = getelementptr inbounds i8, i8* %call10, i64 16, !dbg !595
  %4 = bitcast i8* %next to %struct.dictEntry**, !dbg !595
  store %struct.dictEntry* %3, %struct.dictEntry** %4, align 8, !dbg !596, !tbaa !484
  %5 = bitcast %struct.dictEntry** %arrayidx11 to i8**, !dbg !597
  store i8* %call10, i8** %5, align 8, !dbg !597, !tbaa !97
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %cond, i64 0, i32 3, !dbg !598
  %6 = load i64, i64* %used, align 8, !dbg !599, !tbaa !386
  %inc = add i64 %6, 1, !dbg !599
  store i64 %inc, i64* %used, align 8, !dbg !599, !tbaa !386
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !600
  %7 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !600, !tbaa !361
  %keyDup = getelementptr inbounds %struct.dictType, %struct.dictType* %7, i64 0, i32 1, !dbg !600
  %8 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %keyDup, align 8, !dbg !600, !tbaa !603
  %tobool.not = icmp eq i8* (i8*, i8*)* %8, null, !dbg !600
  br i1 %tobool.not, label %do.body22, label %if.then15, !dbg !604

if.then15:                                        ; preds = %if.end4
  call void @llvm.dbg.value(metadata i8* %call10, metadata !580, metadata !DIExpression()), !dbg !582
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !600
  %9 = load i8*, i8** %privdata, align 8, !dbg !600, !tbaa !365
  %call18 = call i8* %8(i8* noundef %9, i8* noundef %key) #25, !dbg !600
  br label %do.body22, !dbg !600

do.body22:                                        ; preds = %if.end4, %if.then15
  %call18.sink = phi i8* [ %call18, %if.then15 ], [ %key, %if.end4 ]
  %key19 = bitcast i8* %call10 to i8**, !dbg !600
  store i8* %call18.sink, i8** %key19, align 8, !dbg !600, !tbaa !489
  %10 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !605, !tbaa !361
  %valDup = getelementptr inbounds %struct.dictType, %struct.dictType* %10, i64 0, i32 2, !dbg !605
  %11 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup, align 8, !dbg !605, !tbaa !608
  %tobool24.not = icmp eq i8* (i8*, i8*)* %11, null, !dbg !605
  br i1 %tobool24.not, label %cleanup.sink.split, label %if.then25, !dbg !609

if.then25:                                        ; preds = %do.body22
  %privdata28 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !605
  %12 = load i8*, i8** %privdata28, align 8, !dbg !605, !tbaa !365
  %call29 = call i8* %11(i8* noundef %12, i8* noundef %val) #25, !dbg !605
  br label %cleanup.sink.split, !dbg !605

cleanup.sink.split:                               ; preds = %do.body22, %if.then25
  %call29.sink = phi i8* [ %call29, %if.then25 ], [ %val, %do.body22 ]
  %val30 = getelementptr inbounds i8, i8* %call10, i64 8, !dbg !605
  %13 = bitcast i8* %val30 to i8**, !dbg !605
  store i8* %call29.sink, i8** %13, align 8, !dbg !605, !tbaa !610
  br label %cleanup, !dbg !611

cleanup:                                          ; preds = %cleanup.sink.split, %if.end
  %retval.0 = phi i32 [ 1, %if.end ], [ 0, %cleanup.sink.split ], !dbg !582
  ret i32 %retval.0, !dbg !611
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_dictKeyIndex(%struct.dict* nocapture noundef %d, i8* noundef %key) local_unnamed_addr #4 !dbg !612 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !616, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata i8* %key, metadata !617, metadata !DIExpression()), !dbg !622
  %call = call i32 @_dictExpandIfNeeded(%struct.dict* noundef %d), !dbg !623
  %cmp = icmp eq i32 %call, 1, !dbg !625
  br i1 %cmp, label %cleanup, label %if.end, !dbg !626

if.end:                                           ; preds = %entry
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !627
  %0 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !627, !tbaa !361
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %0, i64 0, i32 0, !dbg !627
  %1 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !627, !tbaa !487
  %call1 = call i32 %1(i8* noundef %key) #25, !dbg !627
  call void @llvm.dbg.value(metadata i32 %call1, metadata !618, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata i32 0, metadata !620, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata i32 undef, metadata !619, metadata !DIExpression()), !dbg !622
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3
  br label %for.body, !dbg !628

for.body:                                         ; preds = %while.end, %if.end
  %indvars.iv = phi i64 [ 0, %if.end ], [ %indvars.iv.next, %while.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !620, metadata !DIExpression()), !dbg !622
  %sizemask = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 2, !dbg !630
  %2 = load i64, i64* %sizemask, align 8, !dbg !630, !tbaa !491
  %3 = trunc i64 %2 to i32, !dbg !633
  %conv3 = and i32 %call1, %3, !dbg !633
  call void @llvm.dbg.value(metadata i32 %conv3, metadata !619, metadata !DIExpression()), !dbg !622
  %table7 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 0, !dbg !634
  %4 = load %struct.dictEntry**, %struct.dictEntry*** %table7, align 8, !dbg !634, !tbaa !416
  %idxprom8 = zext i32 %conv3 to i64, !dbg !635
  %arrayidx9 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %4, i64 %idxprom8, !dbg !635
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !621, metadata !DIExpression()), !dbg !622
  %he.050 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx9, align 8, !dbg !636, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.050, metadata !621, metadata !DIExpression()), !dbg !622
  %tobool.not51 = icmp eq %struct.dictEntry* %he.050, null, !dbg !637
  br i1 %tobool.not51, label %while.end, label %while.body, !dbg !637

while.body:                                       ; preds = %for.body, %if.end21
  %he.052 = phi %struct.dictEntry* [ %he.0, %if.end21 ], [ %he.050, %for.body ]
  %5 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !638, !tbaa !361
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %5, i64 0, i32 3, !dbg !638
  %6 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !638, !tbaa !641
  %tobool11.not = icmp eq i32 (i8*, i8*, i8*)* %6, null, !dbg !638
  br i1 %tobool11.not, label %cond.false, label %cond.true, !dbg !642

cond.true:                                        ; preds = %while.body
  %7 = load i8*, i8** %privdata, align 8, !dbg !638, !tbaa !365
  %key14 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.052, i64 0, i32 0, !dbg !638
  %8 = load i8*, i8** %key14, align 8, !dbg !638, !tbaa !489
  %call15 = call i32 %6(i8* noundef %7, i8* noundef %key, i8* noundef %8) #25, !dbg !638
  %tobool16.not = icmp eq i32 %call15, 0, !dbg !638
  br i1 %tobool16.not, label %if.end21, label %cleanup, !dbg !638

cond.false:                                       ; preds = %while.body
  %key17 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.052, i64 0, i32 0, !dbg !638
  %9 = load i8*, i8** %key17, align 8, !dbg !638, !tbaa !489
  %cmp18 = icmp eq i8* %9, %key, !dbg !638
  br i1 %cmp18, label %cleanup, label %if.end21, !dbg !642

if.end21:                                         ; preds = %cond.false, %cond.true
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.052, i64 0, i32 2, !dbg !643
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !621, metadata !DIExpression()), !dbg !622
  %he.0 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !636, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !621, metadata !DIExpression()), !dbg !622
  %tobool.not = icmp eq %struct.dictEntry* %he.0, null, !dbg !637
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !637, !llvm.loop !644

while.end:                                        ; preds = %if.end21, %for.body
  %10 = load i32, i32* %rehashidx, align 8, !dbg !646, !tbaa !368
  %cmp22.not = icmp eq i32 %10, -1, !dbg !646
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !648
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !620, metadata !DIExpression()), !dbg !622
  %exitcond.not = icmp eq i64 %indvars.iv.next, 2
  %or.cond = select i1 %cmp22.not, i1 true, i1 %exitcond.not, !dbg !649
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !620, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata i32 %conv3, metadata !619, metadata !DIExpression()), !dbg !622
  br i1 %or.cond, label %cleanup, label %for.body, !dbg !649, !llvm.loop !650

cleanup:                                          ; preds = %while.end, %cond.true, %cond.false, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ -1, %cond.false ], [ -1, %cond.true ], [ %conv3, %while.end ], !dbg !622
  ret i32 %retval.0, !dbg !652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictReplace(%struct.dict* nocapture noundef %d, i8* noundef %key, i8* noundef %val) local_unnamed_addr #4 !dbg !653 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !655, metadata !DIExpression()), !dbg !660
  call void @llvm.dbg.value(metadata i8* %key, metadata !656, metadata !DIExpression()), !dbg !660
  call void @llvm.dbg.value(metadata i8* %val, metadata !657, metadata !DIExpression()), !dbg !660
  %call = call i32 @dictAdd(%struct.dict* noundef %d, i8* noundef %key, i8* noundef %val), !dbg !661
  %cmp = icmp eq i32 %call, 0, !dbg !663
  br i1 %cmp, label %cleanup, label %if.end, !dbg !664

if.end:                                           ; preds = %entry
  %call2 = call %struct.dictEntry* @dictFind(%struct.dict* noundef %d, i8* noundef %key), !dbg !665
  call void @llvm.dbg.value(metadata %struct.dictEntry* %call2, metadata !658, metadata !DIExpression()), !dbg !660
  call void @llvm.dbg.value(metadata i8* undef, metadata !659, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !660
  %auxentry.sroa.3.0..sroa_idx20 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %call2, i64 0, i32 1, !dbg !666
  %auxentry.sroa.3.0.copyload = load i8*, i8** %auxentry.sroa.3.0..sroa_idx20, align 8, !dbg !666, !tbaa.struct !667
  call void @llvm.dbg.value(metadata i8* %auxentry.sroa.3.0.copyload, metadata !659, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !660
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !659, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !660
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !668
  %0 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !668, !tbaa !361
  %valDup = getelementptr inbounds %struct.dictType, %struct.dictType* %0, i64 0, i32 2, !dbg !668
  %1 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** %valDup, align 8, !dbg !668, !tbaa !608
  %tobool.not = icmp eq i8* (i8*, i8*)* %1, null, !dbg !668
  br i1 %tobool.not, label %do.end, label %if.then3, !dbg !671

if.then3:                                         ; preds = %if.end
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !668
  %2 = load i8*, i8** %privdata, align 8, !dbg !668, !tbaa !365
  %call6 = call i8* %1(i8* noundef %2, i8* noundef %val) #25, !dbg !668
  br label %do.end, !dbg !668

do.end:                                           ; preds = %if.end, %if.then3
  %storemerge = phi i8* [ %call6, %if.then3 ], [ %val, %if.end ], !dbg !668
  store i8* %storemerge, i8** %auxentry.sroa.3.0..sroa_idx20, align 8, !dbg !668, !tbaa !610
  %3 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !672, !tbaa !361
  %valDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %3, i64 0, i32 5, !dbg !672
  %4 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor, align 8, !dbg !672, !tbaa !674
  %tobool11.not = icmp eq void (i8*, i8*)* %4, null, !dbg !672
  br i1 %tobool11.not, label %cleanup, label %if.then12, !dbg !675

if.then12:                                        ; preds = %do.end
  %privdata15 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !672
  %5 = load i8*, i8** %privdata15, align 8, !dbg !672, !tbaa !365
  call void %4(i8* noundef %5, i8* noundef %auxentry.sroa.3.0.copyload) #25, !dbg !672
  br label %cleanup, !dbg !672

cleanup:                                          ; preds = %do.end, %if.then12, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then12 ], [ 0, %do.end ], !dbg !660
  ret i32 %retval.0, !dbg !676
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.dictEntry* @dictFind(%struct.dict* nocapture noundef %d, i8* noundef %key) local_unnamed_addr #4 !dbg !677 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !681, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata i8* %key, metadata !682, metadata !DIExpression()), !dbg !687
  %size = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 1, !dbg !688
  %0 = load i64, i64* %size, align 8, !dbg !688, !tbaa !690
  %cmp = icmp eq i64 %0, 0, !dbg !691
  br i1 %cmp, label %cleanup, label %if.end, !dbg !692

if.end:                                           ; preds = %entry
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !693
  %1 = load i32, i32* %rehashidx, align 8, !dbg !693, !tbaa !368
  %cmp1.not = icmp eq i32 %1, -1, !dbg !693
  br i1 %cmp1.not, label %if.end3, label %if.then2, !dbg !695

if.then2:                                         ; preds = %if.end
  call void @_dictRehashStep(%struct.dict* noundef %d), !dbg !696
  br label %if.end3, !dbg !696

if.end3:                                          ; preds = %if.then2, %if.end
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !697
  %2 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !697, !tbaa !361
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %2, i64 0, i32 0, !dbg !697
  %3 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !697, !tbaa !487
  %call = call i32 %3(i8* noundef %key) #25, !dbg !697
  call void @llvm.dbg.value(metadata i32 %call, metadata !684, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata i32 0, metadata !686, metadata !DIExpression()), !dbg !687
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1
  br label %for.body, !dbg !698

for.body:                                         ; preds = %while.end, %if.end3
  %indvars.iv = phi i64 [ 0, %if.end3 ], [ %indvars.iv.next, %while.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !686, metadata !DIExpression()), !dbg !687
  %sizemask = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 2, !dbg !700
  %4 = load i64, i64* %sizemask, align 8, !dbg !700, !tbaa !491
  %5 = trunc i64 %4 to i32, !dbg !703
  %conv7 = and i32 %call, %5, !dbg !703
  call void @llvm.dbg.value(metadata i32 %conv7, metadata !685, metadata !DIExpression()), !dbg !687
  %table11 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 0, !dbg !704
  %6 = load %struct.dictEntry**, %struct.dictEntry*** %table11, align 8, !dbg !704, !tbaa !416
  %idxprom12 = zext i32 %conv7 to i64, !dbg !705
  %arrayidx13 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %6, i64 %idxprom12, !dbg !705
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !683, metadata !DIExpression()), !dbg !687
  %he.058 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx13, align 8, !dbg !706, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.058, metadata !683, metadata !DIExpression()), !dbg !687
  %tobool.not59 = icmp eq %struct.dictEntry* %he.058, null, !dbg !707
  br i1 %tobool.not59, label %while.end, label %while.body, !dbg !707

while.body:                                       ; preds = %for.body, %if.end25
  %he.060 = phi %struct.dictEntry* [ %he.0, %if.end25 ], [ %he.058, %for.body ]
  %7 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !708, !tbaa !361
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %7, i64 0, i32 3, !dbg !708
  %8 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !708, !tbaa !641
  %tobool15.not = icmp eq i32 (i8*, i8*, i8*)* %8, null, !dbg !708
  br i1 %tobool15.not, label %cond.false, label %cond.true, !dbg !711

cond.true:                                        ; preds = %while.body
  %9 = load i8*, i8** %privdata, align 8, !dbg !708, !tbaa !365
  %key18 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.060, i64 0, i32 0, !dbg !708
  %10 = load i8*, i8** %key18, align 8, !dbg !708, !tbaa !489
  %call19 = call i32 %8(i8* noundef %9, i8* noundef %key, i8* noundef %10) #25, !dbg !708
  %tobool20.not = icmp eq i32 %call19, 0, !dbg !708
  br i1 %tobool20.not, label %if.end25, label %cleanup, !dbg !708

cond.false:                                       ; preds = %while.body
  %key21 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.060, i64 0, i32 0, !dbg !708
  %11 = load i8*, i8** %key21, align 8, !dbg !708, !tbaa !489
  %cmp22 = icmp eq i8* %11, %key, !dbg !708
  br i1 %cmp22, label %cleanup, label %if.end25, !dbg !711

if.end25:                                         ; preds = %cond.false, %cond.true
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.060, i64 0, i32 2, !dbg !712
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !683, metadata !DIExpression()), !dbg !687
  %he.0 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !706, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !683, metadata !DIExpression()), !dbg !687
  %tobool.not = icmp eq %struct.dictEntry* %he.0, null, !dbg !707
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !707, !llvm.loop !713

while.end:                                        ; preds = %if.end25, %for.body
  %12 = load i32, i32* %rehashidx, align 8, !dbg !715, !tbaa !368
  %cmp27.not = icmp eq i32 %12, -1, !dbg !715
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !717
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !686, metadata !DIExpression()), !dbg !687
  %exitcond.not = icmp eq i64 %indvars.iv.next, 2
  %or.cond = select i1 %cmp27.not, i1 true, i1 %exitcond.not, !dbg !718
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !686, metadata !DIExpression()), !dbg !687
  br i1 %or.cond, label %cleanup, label %for.body, !dbg !718, !llvm.loop !719

cleanup:                                          ; preds = %while.end, %cond.true, %cond.false, %entry
  %retval.0 = phi %struct.dictEntry* [ null, %entry ], [ %he.060, %cond.false ], [ %he.060, %cond.true ], [ null, %while.end ], !dbg !687
  ret %struct.dictEntry* %retval.0, !dbg !721
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictGenericDelete(%struct.dict* nocapture noundef %d, i8* noundef %key, i32 noundef %nofree) local_unnamed_addr #4 !dbg !722 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !726, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata i8* %key, metadata !727, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata i32 %nofree, metadata !728, metadata !DIExpression()), !dbg !734
  %size = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 1, !dbg !735
  %0 = load i64, i64* %size, align 8, !dbg !735, !tbaa !690
  %cmp = icmp eq i64 %0, 0, !dbg !737
  br i1 %cmp, label %cleanup, label %if.end, !dbg !738

if.end:                                           ; preds = %entry
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !739
  %1 = load i32, i32* %rehashidx, align 8, !dbg !739, !tbaa !368
  %cmp1.not = icmp eq i32 %1, -1, !dbg !739
  br i1 %cmp1.not, label %if.end3, label %if.then2, !dbg !741

if.then2:                                         ; preds = %if.end
  call void @_dictRehashStep(%struct.dict* noundef %d), !dbg !742
  br label %if.end3, !dbg !742

if.end3:                                          ; preds = %if.then2, %if.end
  %type = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 0, !dbg !743
  %2 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !743, !tbaa !361
  %hashFunction = getelementptr inbounds %struct.dictType, %struct.dictType* %2, i64 0, i32 0, !dbg !743
  %3 = load i32 (i8*)*, i32 (i8*)** %hashFunction, align 8, !dbg !743, !tbaa !487
  %call = call i32 %3(i8* noundef %key) #25, !dbg !743
  call void @llvm.dbg.value(metadata i32 %call, metadata !729, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata i32 0, metadata !733, metadata !DIExpression()), !dbg !734
  %privdata = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1
  br label %for.body, !dbg !744

for.body:                                         ; preds = %while.end, %if.end3
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.end ], [ 0, %if.end3 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !733, metadata !DIExpression()), !dbg !734
  %sizemask = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 2, !dbg !746
  %4 = load i64, i64* %sizemask, align 8, !dbg !746, !tbaa !491
  %5 = trunc i64 %4 to i32, !dbg !749
  %conv7 = and i32 %call, %5, !dbg !749
  call void @llvm.dbg.value(metadata i32 %conv7, metadata !730, metadata !DIExpression()), !dbg !734
  %table11 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %indvars.iv, i32 0, !dbg !750
  %6 = load %struct.dictEntry**, %struct.dictEntry*** %table11, align 8, !dbg !750, !tbaa !416
  %idxprom12 = zext i32 %conv7 to i64, !dbg !751
  %arrayidx13 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %6, i64 %idxprom12, !dbg !751
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !731, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata %struct.dictEntry* null, metadata !732, metadata !DIExpression()), !dbg !734
  %he.0114 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx13, align 8, !dbg !752, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0114, metadata !731, metadata !DIExpression()), !dbg !734
  %tobool.not115 = icmp eq %struct.dictEntry* %he.0114, null, !dbg !753
  br i1 %tobool.not115, label %while.end, label %while.body, !dbg !753

while.body:                                       ; preds = %for.body, %if.end57
  %he.0117 = phi %struct.dictEntry* [ %he.0, %if.end57 ], [ %he.0114, %for.body ]
  %prevHe.0116 = phi %struct.dictEntry* [ %he.0117, %if.end57 ], [ null, %for.body ]
  call void @llvm.dbg.value(metadata %struct.dictEntry* %prevHe.0116, metadata !732, metadata !DIExpression()), !dbg !734
  %7 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !754, !tbaa !361
  %keyCompare = getelementptr inbounds %struct.dictType, %struct.dictType* %7, i64 0, i32 3, !dbg !754
  %8 = load i32 (i8*, i8*, i8*)*, i32 (i8*, i8*, i8*)** %keyCompare, align 8, !dbg !754, !tbaa !641
  %tobool15.not = icmp eq i32 (i8*, i8*, i8*)* %8, null, !dbg !754
  br i1 %tobool15.not, label %cond.false, label %cond.true, !dbg !757

cond.true:                                        ; preds = %while.body
  %9 = load i8*, i8** %privdata, align 8, !dbg !754, !tbaa !365
  %key18 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 0, !dbg !754
  %10 = load i8*, i8** %key18, align 8, !dbg !754, !tbaa !489
  %call19 = call i32 %8(i8* noundef %9, i8* noundef %key, i8* noundef %10) #25, !dbg !754
  %tobool20.not = icmp eq i32 %call19, 0, !dbg !754
  br i1 %tobool20.not, label %if.end57, label %if.then24, !dbg !754

cond.false:                                       ; preds = %while.body
  %key21 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 0, !dbg !754
  %11 = load i8*, i8** %key21, align 8, !dbg !754, !tbaa !489
  %cmp22 = icmp eq i8* %11, %key, !dbg !754
  br i1 %cmp22, label %if.then24, label %if.end57, !dbg !757

if.then24:                                        ; preds = %cond.false, %cond.true
  %idxprom.le = and i64 %indvars.iv, 4294967295, !dbg !758
  %tobool25.not = icmp eq %struct.dictEntry* %prevHe.0116, null, !dbg !759
  br i1 %tobool25.not, label %if.else, label %if.then26, !dbg !762

if.then26:                                        ; preds = %if.then24
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 2, !dbg !763
  %12 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !763, !tbaa !484
  %next27 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %prevHe.0116, i64 0, i32 2, !dbg !764
  store %struct.dictEntry* %12, %struct.dictEntry** %next27, align 8, !dbg !765, !tbaa !484
  br label %if.end35, !dbg !766

if.else:                                          ; preds = %if.then24
  %idxprom12.le = zext i32 %conv7 to i64, !dbg !751
  %next28 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 2, !dbg !767
  %13 = load %struct.dictEntry*, %struct.dictEntry** %next28, align 8, !dbg !767, !tbaa !484
  %14 = load %struct.dictEntry**, %struct.dictEntry*** %table11, align 8, !dbg !768, !tbaa !416
  %arrayidx34 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %14, i64 %idxprom12.le, !dbg !769
  store %struct.dictEntry* %13, %struct.dictEntry** %arrayidx34, align 8, !dbg !770, !tbaa !97
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.then26
  %tobool36.not = icmp eq i32 %nofree, 0, !dbg !771
  br i1 %tobool36.not, label %if.then37, label %if.end53, !dbg !773

if.then37:                                        ; preds = %if.end35
  %15 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !774, !tbaa !361
  %keyDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %15, i64 0, i32 4, !dbg !774
  %16 = load void (i8*, i8*)*, void (i8*, i8*)** %keyDestructor, align 8, !dbg !774, !tbaa !777
  %tobool39.not = icmp eq void (i8*, i8*)* %16, null, !dbg !774
  br i1 %tobool39.not, label %if.end45, label %if.then40, !dbg !778

if.then40:                                        ; preds = %if.then37
  %privdata43 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !774
  %17 = load i8*, i8** %privdata43, align 8, !dbg !774, !tbaa !365
  %key44 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 0, !dbg !774
  %18 = load i8*, i8** %key44, align 8, !dbg !774, !tbaa !489
  call void %16(i8* noundef %17, i8* noundef %18) #25, !dbg !774
  br label %if.end45, !dbg !774

if.end45:                                         ; preds = %if.then40, %if.then37
  %19 = load %struct.dictType*, %struct.dictType** %type, align 8, !dbg !779, !tbaa !361
  %valDestructor = getelementptr inbounds %struct.dictType, %struct.dictType* %19, i64 0, i32 5, !dbg !779
  %20 = load void (i8*, i8*)*, void (i8*, i8*)** %valDestructor, align 8, !dbg !779, !tbaa !674
  %tobool47.not = icmp eq void (i8*, i8*)* %20, null, !dbg !779
  br i1 %tobool47.not, label %if.end53, label %if.then48, !dbg !781

if.then48:                                        ; preds = %if.end45
  %privdata51 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 1, !dbg !779
  %21 = load i8*, i8** %privdata51, align 8, !dbg !779, !tbaa !365
  %val = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 1, !dbg !779
  %22 = load i8*, i8** %val, align 8, !dbg !779, !tbaa !610
  call void %20(i8* noundef %21, i8* noundef %22) #25, !dbg !779
  br label %if.end53, !dbg !779

if.end53:                                         ; preds = %if.end45, %if.then48, %if.end35
  %23 = bitcast %struct.dictEntry* %he.0117 to i8*, !dbg !782
  call void @_dictFree(i8* noundef nonnull %23), !dbg !783
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 %idxprom.le, i32 3, !dbg !784
  %24 = load i64, i64* %used, align 8, !dbg !785, !tbaa !386
  %dec = add i64 %24, -1, !dbg !785
  store i64 %dec, i64* %used, align 8, !dbg !785, !tbaa !386
  br label %cleanup, !dbg !786

if.end57:                                         ; preds = %cond.false, %cond.true
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0117, metadata !732, metadata !DIExpression()), !dbg !734
  %next58 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0117, i64 0, i32 2, !dbg !787
  call void @llvm.dbg.value(metadata %struct.dictEntry* undef, metadata !731, metadata !DIExpression()), !dbg !734
  %he.0 = load %struct.dictEntry*, %struct.dictEntry** %next58, align 8, !dbg !752, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !731, metadata !DIExpression()), !dbg !734
  %tobool.not = icmp eq %struct.dictEntry* %he.0, null, !dbg !753
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !753, !llvm.loop !788

while.end:                                        ; preds = %if.end57, %for.body
  %25 = load i32, i32* %rehashidx, align 8, !dbg !790, !tbaa !368
  %cmp60.not = icmp ne i32 %25, -1, !dbg !790
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp4 = icmp eq i64 %indvars.iv, 0
  %or.cond = select i1 %cmp60.not, i1 %cmp4, i1 false, !dbg !792
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !733, metadata !DIExpression()), !dbg !734
  br i1 %or.cond, label %for.body, label %cleanup, !dbg !792, !llvm.loop !793

cleanup:                                          ; preds = %while.end, %entry, %if.end53
  %retval.0 = phi i32 [ 0, %if.end53 ], [ 1, %entry ], [ 1, %while.end ], !dbg !734
  ret i32 %retval.0, !dbg !795
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictDelete(%struct.dict* nocapture noundef %ht, i8* noundef %key) local_unnamed_addr #4 !dbg !796 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %ht, metadata !798, metadata !DIExpression()), !dbg !800
  call void @llvm.dbg.value(metadata i8* %key, metadata !799, metadata !DIExpression()), !dbg !800
  %call = call i32 @dictGenericDelete(%struct.dict* noundef %ht, i8* noundef %key, i32 noundef 0), !dbg !801
  ret i32 %call, !dbg !802
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dictDeleteNoFree(%struct.dict* nocapture noundef %ht, i8* noundef %key) local_unnamed_addr #4 !dbg !803 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %ht, metadata !805, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata i8* %key, metadata !806, metadata !DIExpression()), !dbg !807
  %call = call i32 @dictGenericDelete(%struct.dict* noundef %ht, i8* noundef %key, i32 noundef 1), !dbg !808
  ret i32 %call, !dbg !809
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_dictClear(%struct.dict* nocapture readnone %d, %struct.dictht* nocapture noundef %ht) local_unnamed_addr #4 !dbg !810 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* undef, metadata !814, metadata !DIExpression()), !dbg !822
  call void @llvm.dbg.value(metadata %struct.dictht* %ht, metadata !815, metadata !DIExpression()), !dbg !822
  call void @llvm.dbg.value(metadata i64 0, metadata !816, metadata !DIExpression()), !dbg !822
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 3, !dbg !823
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 1
  call void @llvm.dbg.value(metadata i64 0, metadata !816, metadata !DIExpression()), !dbg !822
  %0 = load i64, i64* %size, align 8, !dbg !824, !tbaa !690
  %cmp21.not = icmp eq i64 %0, 0, !dbg !825
  br i1 %cmp21.not, label %for.end, label %land.rhs.lr.ph, !dbg !826

land.rhs.lr.ph:                                   ; preds = %entry
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 0
  br label %land.rhs, !dbg !826

land.rhs:                                         ; preds = %land.rhs.lr.ph, %cleanup
  %i.022 = phi i64 [ 0, %land.rhs.lr.ph ], [ %inc, %cleanup ]
  call void @llvm.dbg.value(metadata i64 %i.022, metadata !816, metadata !DIExpression()), !dbg !822
  %1 = load i64, i64* %used, align 8, !dbg !823, !tbaa !386
  %cmp1.not = icmp eq i64 %1, 0, !dbg !827
  br i1 %cmp1.not, label %for.end, label %for.body, !dbg !828

for.body:                                         ; preds = %land.rhs
  %2 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !829, !tbaa !416
  %arrayidx = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %2, i64 %i.022, !dbg !831
  %3 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx, align 8, !dbg !831, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %3, metadata !817, metadata !DIExpression()), !dbg !832
  %cmp2 = icmp eq %struct.dictEntry* %3, null, !dbg !833
  br i1 %cmp2, label %cleanup, label %while.body, !dbg !834

while.body:                                       ; preds = %for.body, %while.body
  %he.020 = phi %struct.dictEntry* [ %4, %while.body ], [ %3, %for.body ]
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.020, metadata !817, metadata !DIExpression()), !dbg !832
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.020, i64 0, i32 2, !dbg !835
  %4 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !835, !tbaa !484
  call void @llvm.dbg.value(metadata %struct.dictEntry* %4, metadata !821, metadata !DIExpression()), !dbg !832
  %5 = bitcast %struct.dictEntry* %he.020 to i8*, !dbg !837
  call void @_dictFree(i8* noundef nonnull %5), !dbg !838
  %6 = load i64, i64* %used, align 8, !dbg !839, !tbaa !386
  %dec = add i64 %6, -1, !dbg !839
  store i64 %dec, i64* %used, align 8, !dbg !839, !tbaa !386
  call void @llvm.dbg.value(metadata %struct.dictEntry* %4, metadata !817, metadata !DIExpression()), !dbg !832
  %tobool.not = icmp eq %struct.dictEntry* %4, null, !dbg !840
  br i1 %tobool.not, label %cleanup, label %while.body, !dbg !840, !llvm.loop !841

cleanup:                                          ; preds = %while.body, %for.body
  %inc = add nuw i64 %i.022, 1, !dbg !843
  call void @llvm.dbg.value(metadata i64 %inc, metadata !816, metadata !DIExpression()), !dbg !822
  %7 = load i64, i64* %size, align 8, !dbg !824, !tbaa !690
  %cmp = icmp ult i64 %inc, %7, !dbg !825
  br i1 %cmp, label %land.rhs, label %for.end, !dbg !826, !llvm.loop !844

for.end:                                          ; preds = %land.rhs, %cleanup, %entry
  %8 = bitcast %struct.dictht* %ht to i8**, !dbg !846
  %9 = load i8*, i8** %8, align 8, !dbg !846, !tbaa !416
  call void @_dictFree(i8* noundef %9), !dbg !847
  call void @_dictReset(%struct.dictht* noundef %ht), !dbg !848
  ret i32 0, !dbg !849
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dictRelease(%struct.dict* noundef %d) local_unnamed_addr #4 !dbg !850 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !852, metadata !DIExpression()), !dbg !853
  %arrayidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, !dbg !854
  %call = call i32 @_dictClear(%struct.dict* undef, %struct.dictht* noundef nonnull %arrayidx), !dbg !855
  %arrayidx2 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, !dbg !856
  %call3 = call i32 @_dictClear(%struct.dict* undef, %struct.dictht* noundef nonnull %arrayidx2), !dbg !857
  %0 = bitcast %struct.dict* %d to i8*, !dbg !858
  call void @_dictFree(i8* noundef %0), !dbg !859
  ret void, !dbg !860
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @dictFetchValue(%struct.dict* nocapture noundef %d, i8* noundef %key) local_unnamed_addr #4 !dbg !861 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !865, metadata !DIExpression()), !dbg !868
  call void @llvm.dbg.value(metadata i8* %key, metadata !866, metadata !DIExpression()), !dbg !868
  %call = call %struct.dictEntry* @dictFind(%struct.dict* noundef %d, i8* noundef %key), !dbg !869
  call void @llvm.dbg.value(metadata %struct.dictEntry* %call, metadata !867, metadata !DIExpression()), !dbg !868
  %tobool.not = icmp eq %struct.dictEntry* %call, null, !dbg !870
  br i1 %tobool.not, label %cond.end, label %cond.true, !dbg !870

cond.true:                                        ; preds = %entry
  %val = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %call, i64 0, i32 1, !dbg !871
  %0 = load i8*, i8** %val, align 8, !dbg !871, !tbaa !610
  br label %cond.end, !dbg !870

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i8* [ %0, %cond.true ], [ null, %entry ], !dbg !870
  ret i8* %cond, !dbg !872
}

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull %struct.dictIterator* @dictGetIterator(%struct.dict* noundef %d) local_unnamed_addr #4 !dbg !873 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !886, metadata !DIExpression()), !dbg !888
  %call = call i8* @_dictAlloc(i64 noundef 32), !dbg !889
  %0 = bitcast i8* %call to %struct.dictIterator*, !dbg !889
  call void @llvm.dbg.value(metadata %struct.dictIterator* %0, metadata !887, metadata !DIExpression()), !dbg !888
  %d1 = bitcast i8* %call to %struct.dict**, !dbg !890
  store %struct.dict* %d, %struct.dict** %d1, align 8, !dbg !891, !tbaa !892
  %table = getelementptr inbounds i8, i8* %call, i64 8, !dbg !894
  %1 = bitcast i8* %table to i32*, !dbg !894
  store i32 0, i32* %1, align 8, !dbg !895, !tbaa !896
  %index = getelementptr inbounds i8, i8* %call, i64 12, !dbg !897
  %2 = bitcast i8* %index to i32*, !dbg !897
  store i32 -1, i32* %2, align 4, !dbg !898, !tbaa !899
  %entry2 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !900
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %entry2, i8 0, i64 16, i1 false), !dbg !901
  ret %struct.dictIterator* %0, !dbg !902
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local %struct.dictEntry* @dictNext(%struct.dictIterator* nocapture noundef %iter) local_unnamed_addr #16 !dbg !903 {
entry:
  call void @llvm.dbg.value(metadata %struct.dictIterator* %iter, metadata !907, metadata !DIExpression()), !dbg !912
  %entry1 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 3
  %nextEntry = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 4
  %d = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 0
  %table = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 1
  %index = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 2
  br label %while.body, !dbg !913

while.body:                                       ; preds = %if.end37, %entry
  %0 = load %struct.dictEntry*, %struct.dictEntry** %entry1, align 8, !dbg !914, !tbaa !915
  %cmp = icmp eq %struct.dictEntry* %0, null, !dbg !916
  br i1 %cmp, label %if.then, label %if.end37, !dbg !917

if.then:                                          ; preds = %while.body
  %1 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !918, !tbaa !892
  %2 = load i32, i32* %table, align 8, !dbg !919, !tbaa !896
  %idxprom = sext i32 %2 to i64, !dbg !920
  call void @llvm.dbg.value(metadata !DIArgList(%struct.dict* %1, i64 %idxprom), metadata !908, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 32, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !921
  %3 = load i32, i32* %index, align 4, !dbg !922, !tbaa !899
  %cmp3 = icmp eq i32 %3, -1, !dbg !924
  %cmp5 = icmp eq i32 %2, 0
  %or.cond = select i1 %cmp3, i1 %cmp5, i1 false, !dbg !925
  br i1 %or.cond, label %if.then6, label %if.end, !dbg !925

if.then6:                                         ; preds = %if.then
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %1, i64 0, i32 4, !dbg !926
  %4 = load i32, i32* %iterators, align 4, !dbg !927, !tbaa !371
  %inc = add nsw i32 %4, 1, !dbg !927
  store i32 %inc, i32* %iterators, align 4, !dbg !927, !tbaa !371
  br label %if.end, !dbg !928

if.end:                                           ; preds = %if.then6, %if.then
  %inc9 = add nsw i32 %3, 1, !dbg !929
  store i32 %inc9, i32* %index, align 4, !dbg !929, !tbaa !899
  %size = getelementptr inbounds %struct.dict, %struct.dict* %1, i64 0, i32 2, i64 %idxprom, i32 1, !dbg !930
  %5 = load i64, i64* %size, align 8, !dbg !930, !tbaa !690
  %conv = trunc i64 %5 to i32, !dbg !932
  %cmp11.not = icmp slt i32 %inc9, %conv, !dbg !933
  br i1 %cmp11.not, label %if.end29, label %if.then13, !dbg !934

if.then13:                                        ; preds = %if.end
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %1, i64 0, i32 3, !dbg !935
  %6 = load i32, i32* %rehashidx, align 8, !dbg !935, !tbaa !368
  %cmp15.not = icmp eq i32 %6, -1, !dbg !935
  %cmp5.not = xor i1 %cmp5, true, !dbg !938
  %brmerge = select i1 %cmp15.not, i1 true, i1 %cmp5.not, !dbg !938
  br i1 %brmerge, label %return, label %if.then21, !dbg !938

if.then21:                                        ; preds = %if.then13
  store i32 1, i32* %table, align 8, !dbg !939, !tbaa !896
  store i32 0, i32* %index, align 4, !dbg !941, !tbaa !899
  call void @llvm.dbg.value(metadata %struct.dict* %1, metadata !908, metadata !DIExpression(DW_OP_plus_uconst, 48, DW_OP_stack_value)), !dbg !921
  br label %if.end29, !dbg !942

if.end29:                                         ; preds = %if.then21, %if.end
  %7 = phi i64 [ 1, %if.then21 ], [ %idxprom, %if.end ], !dbg !921
  call void @llvm.dbg.value(metadata %struct.dictht* undef, metadata !908, metadata !DIExpression()), !dbg !921
  %table30 = getelementptr inbounds %struct.dict, %struct.dict* %1, i64 0, i32 2, i64 %7, i32 0, !dbg !943
  %8 = load %struct.dictEntry**, %struct.dictEntry*** %table30, align 8, !dbg !943, !tbaa !416
  %9 = load i32, i32* %index, align 4, !dbg !944, !tbaa !899
  %idxprom32 = sext i32 %9 to i64, !dbg !945
  %arrayidx33 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %8, i64 %idxprom32, !dbg !945
  br label %if.end37

if.end37:                                         ; preds = %while.body, %if.end29
  %storemerge.in = phi %struct.dictEntry** [ %arrayidx33, %if.end29 ], [ %nextEntry, %while.body ]
  %storemerge = load %struct.dictEntry*, %struct.dictEntry** %storemerge.in, align 8, !dbg !946, !tbaa !97
  store %struct.dictEntry* %storemerge, %struct.dictEntry** %entry1, align 8, !dbg !946, !tbaa !915
  %tobool.not = icmp eq %struct.dictEntry* %storemerge, null, !dbg !947
  br i1 %tobool.not, label %while.body, label %if.then39, !dbg !949, !llvm.loop !950

if.then39:                                        ; preds = %if.end37
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %storemerge, i64 0, i32 2, !dbg !952
  %10 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !952, !tbaa !484
  %nextEntry41 = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 4, !dbg !954
  store %struct.dictEntry* %10, %struct.dictEntry** %nextEntry41, align 8, !dbg !955, !tbaa !956
  br label %return, !dbg !957

return:                                           ; preds = %if.then13, %if.then39
  %retval.0 = phi %struct.dictEntry* [ %storemerge, %if.then39 ], [ null, %if.then13 ], !dbg !912
  ret %struct.dictEntry* %retval.0, !dbg !958
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dictReleaseIterator(%struct.dictIterator* noundef %iter) local_unnamed_addr #4 !dbg !959 {
entry:
  call void @llvm.dbg.value(metadata %struct.dictIterator* %iter, metadata !963, metadata !DIExpression()), !dbg !964
  %index = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 2, !dbg !965
  %0 = load i32, i32* %index, align 4, !dbg !965, !tbaa !899
  %cmp = icmp eq i32 %0, -1, !dbg !967
  br i1 %cmp, label %land.lhs.true, label %if.then, !dbg !968

land.lhs.true:                                    ; preds = %entry
  %table = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 1, !dbg !969
  %1 = load i32, i32* %table, align 8, !dbg !969, !tbaa !896
  %cmp1 = icmp eq i32 %1, 0, !dbg !970
  br i1 %cmp1, label %if.end, label %if.then, !dbg !971

if.then:                                          ; preds = %land.lhs.true, %entry
  %d = getelementptr inbounds %struct.dictIterator, %struct.dictIterator* %iter, i64 0, i32 0, !dbg !972
  %2 = load %struct.dict*, %struct.dict** %d, align 8, !dbg !972, !tbaa !892
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %2, i64 0, i32 4, !dbg !973
  %3 = load i32, i32* %iterators, align 4, !dbg !974, !tbaa !371
  %dec = add nsw i32 %3, -1, !dbg !974
  store i32 %dec, i32* %iterators, align 4, !dbg !974, !tbaa !371
  br label %if.end, !dbg !975

if.end:                                           ; preds = %if.then, %land.lhs.true
  %4 = bitcast %struct.dictIterator* %iter to i8*, !dbg !976
  call void @_dictFree(i8* noundef %4), !dbg !977
  ret void, !dbg !978
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.dictEntry* @dictGetRandomKey(%struct.dict* nocapture noundef %d) local_unnamed_addr #4 !dbg !979 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !983, metadata !DIExpression()), !dbg !989
  %ht = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, !dbg !990
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 3, !dbg !990
  %0 = load i64, i64* %used, align 8, !dbg !990, !tbaa !386
  %used3 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 3, !dbg !990
  %1 = load i64, i64* %used3, align 8, !dbg !990, !tbaa !386
  %add = sub i64 0, %1, !dbg !992
  %cmp = icmp eq i64 %0, %add, !dbg !992
  br i1 %cmp, label %cleanup, label %if.end, !dbg !993

if.end:                                           ; preds = %entry
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !994
  %2 = load i32, i32* %rehashidx, align 8, !dbg !994, !tbaa !368
  %cmp4.not = icmp eq i32 %2, -1, !dbg !994
  br i1 %cmp4.not, label %if.end6, label %if.then5, !dbg !996

if.then5:                                         ; preds = %if.end
  call void @_dictRehashStep(%struct.dict* noundef %d), !dbg !997
  br label %if.end6, !dbg !997

if.end6:                                          ; preds = %if.then5, %if.end
  %3 = load i32, i32* %rehashidx, align 8, !dbg !998, !tbaa !368
  %cmp8.not = icmp eq i32 %3, -1, !dbg !998
  br i1 %cmp8.not, label %do.body36.preheader, label %do.body.preheader, !dbg !1000

do.body.preheader:                                ; preds = %if.end6
  %size = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 1
  %size14 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 1
  %table = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, i32 0
  %table32 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, i32 0
  br label %do.body, !dbg !1001

do.body36.preheader:                              ; preds = %if.end6
  %sizemask = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 2
  %table44 = getelementptr inbounds [2 x %struct.dictht], [2 x %struct.dictht]* %ht, i64 0, i64 0, i32 0
  br label %do.body36, !dbg !1003

do.body:                                          ; preds = %do.body.preheader, %cond.end
  %call = call i32 (...) @random() #25, !dbg !1005
  %conv = sext i32 %call to i64, !dbg !1005
  %4 = load i64, i64* %size, align 8, !dbg !1007, !tbaa !690
  %5 = load i64, i64* %size14, align 8, !dbg !1008, !tbaa !690
  %add15 = add i64 %5, %4, !dbg !1009
  %rem = urem i64 %conv, %add15, !dbg !1010
  %conv17 = and i64 %rem, 4294967295, !dbg !1011
  call void @llvm.dbg.value(metadata i64 %rem, metadata !986, metadata !DIExpression()), !dbg !989
  %cmp21.not = icmp ult i64 %conv17, %4, !dbg !1012
  br i1 %cmp21.not, label %cond.false, label %cond.true, !dbg !1013

cond.true:                                        ; preds = %do.body
  %6 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !dbg !1014, !tbaa !416
  %sub = sub i64 %conv17, %4, !dbg !1015
  %arrayidx29 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %6, i64 %sub, !dbg !1016
  br label %cond.end, !dbg !1013

cond.false:                                       ; preds = %do.body
  %7 = load %struct.dictEntry**, %struct.dictEntry*** %table32, align 8, !dbg !1017, !tbaa !416
  %arrayidx33 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %7, i64 %conv17, !dbg !1018
  br label %cond.end, !dbg !1013

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond.in = phi %struct.dictEntry** [ %arrayidx29, %cond.true ], [ %arrayidx33, %cond.false ]
  %cond = load %struct.dictEntry*, %struct.dictEntry** %cond.in, align 8, !dbg !1013, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %cond, metadata !984, metadata !DIExpression()), !dbg !989
  %cmp34 = icmp eq %struct.dictEntry* %cond, null, !dbg !1019
  br i1 %cmp34, label %do.body, label %while.body.preheader, !dbg !1020, !llvm.loop !1021

do.body36:                                        ; preds = %do.body36.preheader, %do.body36
  %call37 = call i32 (...) @random() #25, !dbg !1023
  %8 = load i64, i64* %sizemask, align 8, !dbg !1025, !tbaa !491
  %9 = trunc i64 %8 to i32, !dbg !1023
  %conv41 = and i32 %call37, %9, !dbg !1023
  call void @llvm.dbg.value(metadata i32 %conv41, metadata !986, metadata !DIExpression()), !dbg !989
  %10 = load %struct.dictEntry**, %struct.dictEntry*** %table44, align 8, !dbg !1026, !tbaa !416
  %idxprom45 = zext i32 %conv41 to i64, !dbg !1027
  %arrayidx46 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %10, i64 %idxprom45, !dbg !1027
  %11 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx46, align 8, !dbg !1027, !tbaa !97
  call void @llvm.dbg.value(metadata %struct.dictEntry* %11, metadata !984, metadata !DIExpression()), !dbg !989
  %cmp48 = icmp eq %struct.dictEntry* %11, null, !dbg !1028
  br i1 %cmp48, label %do.body36, label %while.body.preheader, !dbg !1029, !llvm.loop !1030

while.body.preheader:                             ; preds = %cond.end, %do.body36
  %he.0 = phi %struct.dictEntry* [ %11, %do.body36 ], [ %cond, %cond.end ], !dbg !1032
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !984, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata i32 0, metadata !987, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !985, metadata !DIExpression()), !dbg !989
  br label %while.body, !dbg !1033

while.body:                                       ; preds = %while.body.preheader, %while.body
  %listlen.095 = phi i32 [ %inc, %while.body ], [ 0, %while.body.preheader ]
  %he.194 = phi %struct.dictEntry* [ %12, %while.body ], [ %he.0, %while.body.preheader ]
  call void @llvm.dbg.value(metadata i32 %listlen.095, metadata !987, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.194, metadata !984, metadata !DIExpression()), !dbg !989
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.194, i64 0, i32 2, !dbg !1034
  %12 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1034, !tbaa !484
  call void @llvm.dbg.value(metadata %struct.dictEntry* %12, metadata !984, metadata !DIExpression()), !dbg !989
  %inc = add nuw nsw i32 %listlen.095, 1, !dbg !1036
  call void @llvm.dbg.value(metadata i32 %inc, metadata !987, metadata !DIExpression()), !dbg !989
  %tobool.not = icmp eq %struct.dictEntry* %12, null, !dbg !1033
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !1033, !llvm.loop !1037

while.end:                                        ; preds = %while.body
  %call52 = call i32 (...) @random() #25, !dbg !1039
  %rem53 = srem i32 %call52, %inc, !dbg !1040
  call void @llvm.dbg.value(metadata i32 %rem53, metadata !988, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0, metadata !984, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata i32 %rem53, metadata !988, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !989
  %tobool55.not96 = icmp eq i32 %rem53, 0, !dbg !1041
  br i1 %tobool55.not96, label %cleanup, label %while.body56, !dbg !1041

while.body56:                                     ; preds = %while.end, %while.body56
  %listele.098 = phi i32 [ %dec, %while.body56 ], [ %rem53, %while.end ]
  %he.297 = phi %struct.dictEntry* [ %13, %while.body56 ], [ %he.0, %while.end ]
  call void @llvm.dbg.value(metadata i32 %listele.098, metadata !988, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.297, metadata !984, metadata !DIExpression()), !dbg !989
  %dec = add nsw i32 %listele.098, -1, !dbg !1042
  call void @llvm.dbg.value(metadata i32 %dec, metadata !988, metadata !DIExpression()), !dbg !989
  %next57 = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.297, i64 0, i32 2, !dbg !1043
  %13 = load %struct.dictEntry*, %struct.dictEntry** %next57, align 8, !dbg !1043, !tbaa !484
  call void @llvm.dbg.value(metadata %struct.dictEntry* %13, metadata !984, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.value(metadata i32 %dec, metadata !988, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !989
  %tobool55.not = icmp eq i32 %dec, 0, !dbg !1041
  br i1 %tobool55.not, label %cleanup, label %while.body56, !dbg !1041, !llvm.loop !1044

cleanup:                                          ; preds = %while.body56, %while.end, %entry
  %retval.0 = phi %struct.dictEntry* [ null, %entry ], [ %he.0, %while.end ], [ %13, %while.body56 ], !dbg !989
  ret %struct.dictEntry* %retval.0, !dbg !1045
}

declare !dbg !1046 i32 @random(...) local_unnamed_addr #17

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_dictExpandIfNeeded(%struct.dict* nocapture noundef %d) local_unnamed_addr #4 !dbg !1049 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !1051, metadata !DIExpression()), !dbg !1052
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !1053
  %0 = load i32, i32* %rehashidx, align 8, !dbg !1053, !tbaa !368
  %cmp.not = icmp eq i32 %0, -1, !dbg !1053
  br i1 %cmp.not, label %if.end, label %return, !dbg !1055

if.end:                                           ; preds = %entry
  %size = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 1, !dbg !1056
  %1 = load i64, i64* %size, align 8, !dbg !1056, !tbaa !690
  %cmp1 = icmp eq i64 %1, 0, !dbg !1058
  br i1 %cmp1, label %return.sink.split, label %if.end3, !dbg !1059

if.end3:                                          ; preds = %if.end
  %used = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, i32 3, !dbg !1060
  %2 = load i64, i64* %used, align 8, !dbg !1060, !tbaa !386
  %cmp9 = icmp uge i64 %2, %1, !dbg !1062
  %3 = load i32, i32* @dict_can_resize, align 4
  %tobool = icmp ne i32 %3, 0
  %or.cond = select i1 %cmp9, i1 %tobool, i1 false, !dbg !1063
  br i1 %or.cond, label %cond.end, label %return, !dbg !1063

cond.end:                                         ; preds = %if.end3
  %mul = shl i64 %2, 1, !dbg !1064
  br label %return.sink.split, !dbg !1065

return.sink.split:                                ; preds = %if.end, %cond.end
  %mul.sink = phi i64 [ %mul, %cond.end ], [ 4, %if.end ]
  %call24 = call i32 @dictExpand(%struct.dict* noundef %d, i64 noundef %mul.sink), !dbg !1052
  br label %return, !dbg !1066

return:                                           ; preds = %return.sink.split, %if.end3, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 0, %if.end3 ], [ %call24, %return.sink.split ], !dbg !1052
  ret i32 %retval.0, !dbg !1066
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dictEmpty(%struct.dict* nocapture noundef %d) local_unnamed_addr #4 !dbg !1067 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !1069, metadata !DIExpression()), !dbg !1070
  %arrayidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, !dbg !1071
  %call = call i32 @_dictClear(%struct.dict* undef, %struct.dictht* noundef nonnull %arrayidx), !dbg !1072
  %arrayidx2 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, !dbg !1073
  %call3 = call i32 @_dictClear(%struct.dict* undef, %struct.dictht* noundef nonnull %arrayidx2), !dbg !1074
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !1075
  store i32 -1, i32* %rehashidx, align 8, !dbg !1076, !tbaa !368
  %iterators = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 4, !dbg !1077
  store i32 0, i32* %iterators, align 4, !dbg !1078, !tbaa !371
  ret void, !dbg !1079
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @_dictPrintStatsHt(%struct.dictht* nocapture noundef readonly %ht) local_unnamed_addr #15 !dbg !1080 {
entry:
  %clvector = alloca [50 x i64], align 16
  call void @llvm.dbg.value(metadata %struct.dictht* %ht, metadata !1082, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1084, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1086, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1087, metadata !DIExpression()), !dbg !1096
  %0 = bitcast [50 x i64]* %clvector to i8*, !dbg !1097
  call void @llvm.lifetime.start.p0i8(i64 400, i8* nonnull %0) #25, !dbg !1097
  call void @llvm.dbg.declare(metadata [50 x i64]* %clvector, metadata !1088, metadata !DIExpression()), !dbg !1098
  %used = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 3, !dbg !1099
  %1 = load i64, i64* %used, align 8, !dbg !1099, !tbaa !386
  %cmp = icmp eq i64 %1, 0, !dbg !1101
  br i1 %cmp, label %if.then, label %for.body.preheader, !dbg !1102

for.body.preheader:                               ; preds = %entry
  %clvector125 = bitcast [50 x i64]* %clvector to i8*, !dbg !1096
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(400) %clvector125, i8 0, i64 400, i1 false), !dbg !1103, !tbaa !182
  call void @llvm.dbg.value(metadata i32 undef, metadata !1083, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i32 undef, metadata !1083, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1096
  %size = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 1
  %2 = load i64, i64* %size, align 8, !tbaa !690
  call void @llvm.dbg.value(metadata i64 0, metadata !1087, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1086, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1084, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 0, metadata !1083, metadata !DIExpression()), !dbg !1096
  %cmp3116.not = icmp eq i64 %2, 0, !dbg !1106
  br i1 %cmp3116.not, label %for.end23, label %for.body4.lr.ph, !dbg !1107

if.then:                                          ; preds = %entry
  %puts111 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @str.18, i64 0, i64 0)), !dbg !1108
  br label %cleanup64, !dbg !1110

for.body4.lr.ph:                                  ; preds = %for.body.preheader
  %table = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 0
  %3 = load %struct.dictEntry**, %struct.dictEntry*** %table, align 8, !tbaa !416
  %arrayidx8 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 0
  br label %for.body4, !dbg !1107

for.body4:                                        ; preds = %for.body4.lr.ph, %cleanup
  %totchainlen.0120 = phi i64 [ 0, %for.body4.lr.ph ], [ %totchainlen.1, %cleanup ]
  %maxchainlen.0119 = phi i64 [ 0, %for.body4.lr.ph ], [ %maxchainlen.2, %cleanup ]
  %slots.0118 = phi i64 [ 0, %for.body4.lr.ph ], [ %slots.1, %cleanup ]
  %i.1117 = phi i64 [ 0, %for.body4.lr.ph ], [ %inc22, %cleanup ]
  call void @llvm.dbg.value(metadata i64 %totchainlen.0120, metadata !1087, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 %maxchainlen.0119, metadata !1086, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 %slots.0118, metadata !1084, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 %i.1117, metadata !1083, metadata !DIExpression()), !dbg !1096
  %arrayidx5 = getelementptr inbounds %struct.dictEntry*, %struct.dictEntry** %3, i64 %i.1117, !dbg !1111
  %4 = load %struct.dictEntry*, %struct.dictEntry** %arrayidx5, align 8, !dbg !1111, !tbaa !97
  %cmp6 = icmp eq %struct.dictEntry* %4, null, !dbg !1113
  br i1 %cmp6, label %if.then7, label %while.body, !dbg !1114

if.then7:                                         ; preds = %for.body4
  %5 = load i64, i64* %arrayidx8, align 16, !dbg !1115, !tbaa !182
  %inc9 = add i64 %5, 1, !dbg !1115
  store i64 %inc9, i64* %arrayidx8, align 16, !dbg !1115, !tbaa !182
  br label %cleanup, !dbg !1117

while.body:                                       ; preds = %for.body4, %while.body
  %he.0115 = phi %struct.dictEntry* [ %6, %while.body ], [ %4, %for.body4 ]
  %chainlen.0114 = phi i64 [ %inc14, %while.body ], [ 0, %for.body4 ]
  call void @llvm.dbg.value(metadata %struct.dictEntry* %he.0115, metadata !1092, metadata !DIExpression()), !dbg !1118
  call void @llvm.dbg.value(metadata i64 %chainlen.0114, metadata !1085, metadata !DIExpression()), !dbg !1096
  %inc14 = add i64 %chainlen.0114, 1, !dbg !1119
  call void @llvm.dbg.value(metadata i64 %inc14, metadata !1085, metadata !DIExpression()), !dbg !1096
  %next = getelementptr inbounds %struct.dictEntry, %struct.dictEntry* %he.0115, i64 0, i32 2, !dbg !1121
  %6 = load %struct.dictEntry*, %struct.dictEntry** %next, align 8, !dbg !1121, !tbaa !484
  call void @llvm.dbg.value(metadata %struct.dictEntry* %6, metadata !1092, metadata !DIExpression()), !dbg !1118
  %tobool.not = icmp eq %struct.dictEntry* %6, null, !dbg !1122
  br i1 %tobool.not, label %while.cond.while.end_crit_edge, label %while.body, !dbg !1122, !llvm.loop !1123

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %inc11 = add i64 %slots.0118, 1, !dbg !1125
  %7 = icmp ult i64 %inc14, 49, !dbg !1126
  %cond = select i1 %7, i64 %inc14, i64 49, !dbg !1126
  %arrayidx16 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %cond, !dbg !1127
  %8 = load i64, i64* %arrayidx16, align 8, !dbg !1128, !tbaa !182
  %inc17 = add i64 %8, 1, !dbg !1128
  store i64 %inc17, i64* %arrayidx16, align 8, !dbg !1128, !tbaa !182
  %cmp18 = icmp ugt i64 %inc14, %maxchainlen.0119, !dbg !1129
  %spec.select = select i1 %cmp18, i64 %inc14, i64 %maxchainlen.0119, !dbg !1131
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !1086, metadata !DIExpression()), !dbg !1096
  %add = add i64 %inc14, %totchainlen.0120, !dbg !1132
  call void @llvm.dbg.value(metadata i64 %add, metadata !1087, metadata !DIExpression()), !dbg !1096
  br label %cleanup, !dbg !1133

cleanup:                                          ; preds = %while.cond.while.end_crit_edge, %if.then7
  %slots.1 = phi i64 [ %slots.0118, %if.then7 ], [ %inc11, %while.cond.while.end_crit_edge ], !dbg !1096
  %maxchainlen.2 = phi i64 [ %maxchainlen.0119, %if.then7 ], [ %spec.select, %while.cond.while.end_crit_edge ], !dbg !1096
  %totchainlen.1 = phi i64 [ %totchainlen.0120, %if.then7 ], [ %add, %while.cond.while.end_crit_edge ], !dbg !1096
  call void @llvm.dbg.value(metadata i64 %totchainlen.1, metadata !1087, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 %maxchainlen.2, metadata !1086, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.value(metadata i64 %slots.1, metadata !1084, metadata !DIExpression()), !dbg !1096
  %inc22 = add nuw i64 %i.1117, 1, !dbg !1134
  call void @llvm.dbg.value(metadata i64 %inc22, metadata !1083, metadata !DIExpression()), !dbg !1096
  %exitcond.not = icmp eq i64 %inc22, %2, !dbg !1106
  br i1 %exitcond.not, label %for.end23, label %for.body4, !dbg !1107, !llvm.loop !1135

for.end23:                                        ; preds = %cleanup, %for.body.preheader
  %slots.0.lcssa = phi i64 [ 0, %for.body.preheader ], [ %slots.1, %cleanup ], !dbg !1137
  %maxchainlen.0.lcssa = phi i64 [ 0, %for.body.preheader ], [ %maxchainlen.2, %cleanup ], !dbg !1138
  %totchainlen.0.lcssa = phi i64 [ 0, %for.body.preheader ], [ %totchainlen.1, %cleanup ], !dbg !1139
  %size.le = getelementptr inbounds %struct.dictht, %struct.dictht* %ht, i64 0, i32 1, !dbg !1140
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @str, i64 0, i64 0)), !dbg !1141
  %9 = load i64, i64* %size.le, align 8, !dbg !1142, !tbaa !690
  %call26 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i64 noundef %9), !dbg !1143
  %10 = load i64, i64* %used, align 8, !dbg !1144, !tbaa !386
  %call28 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i64 noundef %10), !dbg !1145
  %call29 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0), i64 noundef %slots.0.lcssa), !dbg !1146
  %call30 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i64 0, i64 0), i64 noundef %maxchainlen.0.lcssa), !dbg !1147
  %conv = uitofp i64 %totchainlen.0.lcssa to float, !dbg !1148
  %conv31 = uitofp i64 %slots.0.lcssa to float, !dbg !1149
  %div = fdiv float %conv, %conv31, !dbg !1150
  %conv32 = fpext float %div to double, !dbg !1148
  %call33 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i64 0, i64 0), double noundef %conv32), !dbg !1151
  %11 = load i64, i64* %used, align 8, !dbg !1152, !tbaa !386
  %conv35 = uitofp i64 %11 to float, !dbg !1153
  %div37 = fdiv float %conv35, %conv31, !dbg !1154
  %conv38 = fpext float %div37 to double, !dbg !1153
  %call39 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i64 0, i64 0), double noundef %conv38), !dbg !1155
  %puts110 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([28 x i8], [28 x i8]* @str.17, i64 0, i64 0)), !dbg !1156
  call void @llvm.dbg.value(metadata i64 0, metadata !1083, metadata !DIExpression()), !dbg !1096
  br label %for.body44, !dbg !1157

for.body44:                                       ; preds = %for.end23, %for.inc61
  %i.2124 = phi i64 [ 0, %for.end23 ], [ %inc62, %for.inc61 ]
  call void @llvm.dbg.value(metadata i64 %i.2124, metadata !1083, metadata !DIExpression()), !dbg !1096
  %arrayidx45 = getelementptr inbounds [50 x i64], [50 x i64]* %clvector, i64 0, i64 %i.2124, !dbg !1159
  %12 = load i64, i64* %arrayidx45, align 8, !dbg !1159, !tbaa !182
  %cmp46 = icmp eq i64 %12, 0, !dbg !1163
  br i1 %cmp46, label %for.inc61, label %if.end49, !dbg !1164

if.end49:                                         ; preds = %for.body44
  %conv55 = uitofp i64 %12 to float, !dbg !1165
  %13 = load i64, i64* %size.le, align 8, !dbg !1166, !tbaa !690
  %conv57 = uitofp i64 %13 to float, !dbg !1167
  %div58 = fdiv float %conv55, %conv57, !dbg !1168
  %mul = fmul float %div58, 1.000000e+02, !dbg !1169
  %conv59 = fpext float %mul to double, !dbg !1170
  %call60 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i64 0, i64 0), i64 noundef %i.2124, i64 noundef %12, double noundef %conv59), !dbg !1171
  br label %for.inc61, !dbg !1172

for.inc61:                                        ; preds = %for.body44, %if.end49
  %inc62 = add nuw nsw i64 %i.2124, 1, !dbg !1173
  call void @llvm.dbg.value(metadata i64 %inc62, metadata !1083, metadata !DIExpression()), !dbg !1096
  %exitcond126.not = icmp eq i64 %inc62, 49, !dbg !1174
  br i1 %exitcond126.not, label %cleanup64, label %for.body44, !dbg !1157, !llvm.loop !1175

cleanup64:                                        ; preds = %for.inc61, %if.then
  call void @llvm.lifetime.end.p0i8(i64 400, i8* nonnull %0) #25, !dbg !1177
  ret void, !dbg !1177
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @dictPrintStats(%struct.dict* nocapture noundef readonly %d) local_unnamed_addr #15 !dbg !1178 {
entry:
  call void @llvm.dbg.value(metadata %struct.dict* %d, metadata !1180, metadata !DIExpression()), !dbg !1181
  %arrayidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 0, !dbg !1182
  call void @_dictPrintStatsHt(%struct.dictht* noundef nonnull %arrayidx), !dbg !1183
  %rehashidx = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 3, !dbg !1184
  %0 = load i32, i32* %rehashidx, align 8, !dbg !1184, !tbaa !368
  %cmp.not = icmp eq i32 %0, -1, !dbg !1184
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !1186

if.then:                                          ; preds = %entry
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @str.19, i64 0, i64 0)), !dbg !1187
  %arrayidx2 = getelementptr inbounds %struct.dict, %struct.dict* %d, i64 0, i32 2, i64 1, !dbg !1189
  call void @_dictPrintStatsHt(%struct.dictht* noundef nonnull %arrayidx2), !dbg !1190
  br label %if.end, !dbg !1191

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !1192
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @dictEnableResize() local_unnamed_addr #11 !dbg !1193 {
entry:
  store i32 1, i32* @dict_can_resize, align 4, !dbg !1194, !tbaa !190
  ret void, !dbg !1195
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @dictDisableResize() local_unnamed_addr #11 !dbg !1196 {
entry:
  store i32 0, i32* @dict_can_resize, align 4, !dbg !1197, !tbaa !190
  ret void, !dbg !1198
}

; Function Attrs: nofree noinline nounwind readonly uwtable
define dso_local i32 @_dictStringCopyHTHashFunction(i8* nocapture noundef readonly %key) #18 !dbg !1199 {
entry:
  call void @llvm.dbg.value(metadata i8* %key, metadata !1201, metadata !DIExpression()), !dbg !1202
  %call = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %key) #26, !dbg !1203
  %conv = trunc i64 %call to i32, !dbg !1203
  %call1 = call i32 @dictGenHashFunction(i8* noundef %key, i32 noundef %conv), !dbg !1204
  ret i32 %call1, !dbg !1205
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i64 @strlen(i8* nocapture noundef) local_unnamed_addr #19

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull i8* @_dictStringCopyHTKeyDup(i8* nocapture readnone %privdata, i8* nocapture noundef readonly %key) #4 !dbg !1206 {
entry:
  call void @llvm.dbg.value(metadata i8* undef, metadata !1208, metadata !DIExpression()), !dbg !1212
  call void @llvm.dbg.value(metadata i8* %key, metadata !1209, metadata !DIExpression()), !dbg !1212
  %call = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %key) #26, !dbg !1213
  call void @llvm.dbg.value(metadata i64 %call, metadata !1210, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1212
  %add = shl i64 %call, 32, !dbg !1214
  %sext = add i64 %add, 4294967296, !dbg !1214
  %conv1 = ashr exact i64 %sext, 32, !dbg !1214
  %call2 = call i8* @_dictAlloc(i64 noundef %conv1), !dbg !1215
  call void @llvm.dbg.value(metadata i8* %call2, metadata !1211, metadata !DIExpression()), !dbg !1212
  %conv3 = ashr exact i64 %add, 32, !dbg !1216
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %call2, i8* align 1 %key, i64 %conv3, i1 false), !dbg !1217
  %arrayidx = getelementptr inbounds i8, i8* %call2, i64 %conv3, !dbg !1218
  store i8 0, i8* %arrayidx, align 1, !dbg !1219, !tbaa !240
  ret i8* %call2, !dbg !1220
}

; Function Attrs: noinline nounwind uwtable
define dso_local noalias nonnull i8* @_dictStringKeyValCopyHTValDup(i8* nocapture readnone %privdata, i8* nocapture noundef readonly %val) #4 !dbg !1221 {
entry:
  call void @llvm.dbg.value(metadata i8* undef, metadata !1223, metadata !DIExpression()), !dbg !1227
  call void @llvm.dbg.value(metadata i8* %val, metadata !1224, metadata !DIExpression()), !dbg !1227
  %call = call i64 @strlen(i8* noundef nonnull dereferenceable(1) %val) #26, !dbg !1228
  call void @llvm.dbg.value(metadata i64 %call, metadata !1225, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1227
  %add = shl i64 %call, 32, !dbg !1229
  %sext = add i64 %add, 4294967296, !dbg !1229
  %conv1 = ashr exact i64 %sext, 32, !dbg !1229
  %call2 = call i8* @_dictAlloc(i64 noundef %conv1), !dbg !1230
  call void @llvm.dbg.value(metadata i8* %call2, metadata !1226, metadata !DIExpression()), !dbg !1227
  %conv3 = ashr exact i64 %add, 32, !dbg !1231
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %call2, i8* align 1 %val, i64 %conv3, i1 false), !dbg !1232
  %arrayidx = getelementptr inbounds i8, i8* %call2, i64 %conv3, !dbg !1233
  store i8 0, i8* %arrayidx, align 1, !dbg !1234, !tbaa !240
  ret i8* %call2, !dbg !1235
}

; Function Attrs: mustprogress nofree noinline nounwind readonly uwtable willreturn
define dso_local i32 @_dictStringCopyHTKeyCompare(i8* nocapture readnone %privdata, i8* nocapture noundef readonly %key1, i8* nocapture noundef readonly %key2) #20 !dbg !1236 {
entry:
  call void @llvm.dbg.value(metadata i8* undef, metadata !1238, metadata !DIExpression()), !dbg !1241
  call void @llvm.dbg.value(metadata i8* %key1, metadata !1239, metadata !DIExpression()), !dbg !1241
  call void @llvm.dbg.value(metadata i8* %key2, metadata !1240, metadata !DIExpression()), !dbg !1241
  %call = call i32 @strcmp(i8* noundef nonnull dereferenceable(1) %key1, i8* noundef nonnull dereferenceable(1) %key2) #26, !dbg !1242
  %cmp = icmp eq i32 %call, 0, !dbg !1243
  %conv = zext i1 %cmp to i32, !dbg !1243
  ret i32 %conv, !dbg !1244
}

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @strcmp(i8* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #19

; Function Attrs: noinline nounwind uwtable
define dso_local void @_dictStringCopyHTKeyDestructor(i8* nocapture readnone %privdata, i8* noundef %key) #4 !dbg !1245 {
entry:
  call void @llvm.dbg.value(metadata i8* undef, metadata !1247, metadata !DIExpression()), !dbg !1249
  call void @llvm.dbg.value(metadata i8* %key, metadata !1248, metadata !DIExpression()), !dbg !1249
  call void @_dictFree(i8* noundef %key), !dbg !1250
  ret void, !dbg !1251
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @_dictStringKeyValCopyHTValDestructor(i8* nocapture readnone %privdata, i8* noundef %val) #4 !dbg !1252 {
entry:
  call void @llvm.dbg.value(metadata i8* undef, metadata !1254, metadata !DIExpression()), !dbg !1256
  call void @llvm.dbg.value(metadata i8* %val, metadata !1255, metadata !DIExpression()), !dbg !1256
  call void @_dictFree(i8* noundef %val), !dbg !1257
  ret void, !dbg !1258
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #21

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #22

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #6 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree noinline norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree noinline norecurse nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #14 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #15 = { nofree noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nofree noinline nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { argmemonly mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #20 = { mustprogress nofree noinline nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #21 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #22 = { nofree nounwind }
attributes #23 = { cold }
attributes #24 = { noreturn nounwind }
attributes #25 = { nounwind }
attributes #26 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!83, !84, !85, !86, !87, !88}
!llvm.ident = !{!89}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "used_memory", scope: !2, file: !3, line: 44, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "Redis.c", directory: "/workspaces/project/redis", checksumkind: CSK_MD5, checksum: "85d5b8bb483382a9583dd2e17f5b1944")
!4 = !{!5, !9, !11, !12, !13, !14}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
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
!52 = distinct !DIGlobalVariable(name: "dict_can_resize", scope: !2, file: !3, line: 147, type: !13, isLocal: false, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "dictTypeHeapStringCopyKey", scope: !2, file: !3, line: 794, type: !55, isLocal: false, isDefinition: true)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictType", file: !56, line: 58, baseType: !57)
!56 = !DIFile(filename: "./dict.h", directory: "/workspaces/project/redis", checksumkind: CSK_MD5, checksum: "b8b7e1319e2afa32704af21432f9ee20")
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
!80 = distinct !DIGlobalVariable(name: "dictTypeHeapStrings", scope: !2, file: !3, line: 805, type: !55, isLocal: false, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "dictTypeHeapStringCopyKeyValue", scope: !2, file: !3, line: 816, type: !55, isLocal: false, isDefinition: true)
!83 = !{i32 7, !"Dwarf Version", i32 5}
!84 = !{i32 2, !"Debug Info Version", i32 3}
!85 = !{i32 1, !"wchar_size", i32 4}
!86 = !{i32 7, !"PIC Level", i32 2}
!87 = !{i32 7, !"PIE Level", i32 2}
!88 = !{i32 7, !"uwtable", i32 1}
!89 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!90 = distinct !DISubprogram(name: "zmalloc_oom", scope: !3, file: !3, line: 48, type: !91, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !93)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !6}
!93 = !{!94}
!94 = !DILocalVariable(name: "size", arg: 1, scope: !90, file: !3, line: 48, type: !6)
!95 = !DILocation(line: 0, scope: !90)
!96 = !DILocation(line: 49, column: 13, scope: !90)
!97 = !{!98, !98, i64 0}
!98 = !{!"any pointer", !99, i64 0}
!99 = !{!"omnipotent char", !100, i64 0}
!100 = !{!"Simple C/C++ TBAA"}
!101 = !DILocation(line: 49, column: 5, scope: !90)
!102 = !DILocation(line: 51, column: 12, scope: !90)
!103 = !DILocation(line: 51, column: 5, scope: !90)
!104 = !DILocation(line: 52, column: 5, scope: !90)
!105 = !DISubprogram(name: "fflush", scope: !106, file: !106, line: 230, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !164)
!106 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!107 = !DISubroutineType(types: !108)
!108 = !{!13, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !111, line: 7, baseType: !112)
!111 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !113, line: 49, size: 1728, elements: !114)
!113 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !130, !132, !133, !134, !137, !139, !141, !145, !148, !150, !153, !156, !157, !158, !159, !160}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !112, file: !113, line: 51, baseType: !13, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !112, file: !113, line: 54, baseType: !9, size: 64, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !112, file: !113, line: 55, baseType: !9, size: 64, offset: 128)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !112, file: !113, line: 56, baseType: !9, size: 64, offset: 192)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !112, file: !113, line: 57, baseType: !9, size: 64, offset: 256)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !112, file: !113, line: 58, baseType: !9, size: 64, offset: 320)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !112, file: !113, line: 59, baseType: !9, size: 64, offset: 384)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !112, file: !113, line: 60, baseType: !9, size: 64, offset: 448)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !112, file: !113, line: 61, baseType: !9, size: 64, offset: 512)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !112, file: !113, line: 64, baseType: !9, size: 64, offset: 576)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !112, file: !113, line: 65, baseType: !9, size: 64, offset: 640)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !112, file: !113, line: 66, baseType: !9, size: 64, offset: 704)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !112, file: !113, line: 68, baseType: !128, size: 64, offset: 768)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !113, line: 36, flags: DIFlagFwdDecl)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !112, file: !113, line: 70, baseType: !131, size: 64, offset: 832)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !112, file: !113, line: 72, baseType: !13, size: 32, offset: 896)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !112, file: !113, line: 73, baseType: !13, size: 32, offset: 928)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !112, file: !113, line: 74, baseType: !135, size: 64, offset: 960)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !136, line: 152, baseType: !50)
!136 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!137 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !112, file: !113, line: 77, baseType: !138, size: 16, offset: 1024)
!138 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !112, file: !113, line: 78, baseType: !140, size: 8, offset: 1040)
!140 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !112, file: !113, line: 79, baseType: !142, size: 8, offset: 1048)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 8, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 1)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !112, file: !113, line: 81, baseType: !146, size: 64, offset: 1088)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !113, line: 43, baseType: null)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !112, file: !113, line: 89, baseType: !149, size: 64, offset: 1152)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !136, line: 153, baseType: !50)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !112, file: !113, line: 91, baseType: !151, size: 64, offset: 1216)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !113, line: 37, flags: DIFlagFwdDecl)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !112, file: !113, line: 92, baseType: !154, size: 64, offset: 1280)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !113, line: 38, flags: DIFlagFwdDecl)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !112, file: !113, line: 93, baseType: !131, size: 64, offset: 1344)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !112, file: !113, line: 94, baseType: !11, size: 64, offset: 1408)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !112, file: !113, line: 95, baseType: !6, size: 64, offset: 1472)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !112, file: !113, line: 96, baseType: !13, size: 32, offset: 1536)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !112, file: !113, line: 98, baseType: !161, size: 160, offset: 1568)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 20)
!164 = !{}
!165 = distinct !DISubprogram(name: "zmalloc", scope: !3, file: !3, line: 55, type: !166, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!166 = !DISubroutineType(types: !167)
!167 = !{!11, !6}
!168 = !{!169, !170, !171}
!169 = !DILocalVariable(name: "size", arg: 1, scope: !165, file: !3, line: 55, type: !6)
!170 = !DILocalVariable(name: "ptr", scope: !165, file: !3, line: 56, type: !11)
!171 = !DILocalVariable(name: "_n", scope: !172, file: !3, line: 64, type: !6)
!172 = distinct !DILexicalBlock(scope: !165, file: !3, line: 64, column: 5)
!173 = !DILocation(line: 0, scope: !165)
!174 = !DILocation(line: 56, column: 28, scope: !165)
!175 = !DILocation(line: 56, column: 17, scope: !165)
!176 = !DILocation(line: 58, column: 10, scope: !177)
!177 = distinct !DILexicalBlock(scope: !165, file: !3, line: 58, column: 9)
!178 = !DILocation(line: 58, column: 9, scope: !165)
!179 = !DILocation(line: 58, column: 15, scope: !177)
!180 = !DILocation(line: 63, column: 7, scope: !165)
!181 = !DILocation(line: 63, column: 21, scope: !165)
!182 = !{!183, !183, i64 0}
!183 = !{!"long", !99, i64 0}
!184 = !DILocation(line: 0, scope: !172)
!185 = !DILocation(line: 64, column: 5, scope: !186)
!186 = distinct !DILexicalBlock(scope: !172, file: !3, line: 64, column: 5)
!187 = !DILocation(line: 64, column: 5, scope: !172)
!188 = !DILocation(line: 64, column: 5, scope: !189)
!189 = distinct !DILexicalBlock(scope: !172, file: !3, line: 64, column: 5)
!190 = !{!191, !191, i64 0}
!191 = !{!"int", !99, i64 0}
!192 = !DILocation(line: 64, column: 5, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !3, line: 64, column: 5)
!194 = !DILocation(line: 64, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !189, file: !3, line: 64, column: 5)
!196 = !DILocation(line: 65, column: 22, scope: !165)
!197 = !DILocation(line: 65, column: 5, scope: !165)
!198 = !DISubprogram(name: "pthread_mutex_lock", scope: !199, file: !199, line: 794, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !164)
!199 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!200 = !DISubroutineType(types: !201)
!201 = !{!13, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!203 = !DISubprogram(name: "pthread_mutex_unlock", scope: !199, file: !199, line: 835, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !164)
!204 = distinct !DISubprogram(name: "zfree", scope: !3, file: !3, line: 69, type: !205, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !207)
!205 = !DISubroutineType(types: !206)
!206 = !{null, !11}
!207 = !{!208, !209, !210, !211}
!208 = !DILocalVariable(name: "ptr", arg: 1, scope: !204, file: !3, line: 69, type: !11)
!209 = !DILocalVariable(name: "realptr", scope: !204, file: !3, line: 71, type: !11)
!210 = !DILocalVariable(name: "oldsize", scope: !204, file: !3, line: 72, type: !6)
!211 = !DILocalVariable(name: "_n", scope: !212, file: !3, line: 82, type: !6)
!212 = distinct !DILexicalBlock(scope: !204, file: !3, line: 82, column: 5)
!213 = !DILocation(line: 0, scope: !204)
!214 = !DILocation(line: 75, column: 13, scope: !215)
!215 = distinct !DILexicalBlock(scope: !204, file: !3, line: 75, column: 9)
!216 = !DILocation(line: 75, column: 9, scope: !204)
!217 = !DILocation(line: 80, column: 25, scope: !204)
!218 = !DILocation(line: 81, column: 17, scope: !204)
!219 = !DILocation(line: 81, column: 15, scope: !204)
!220 = !DILocation(line: 82, column: 5, scope: !212)
!221 = !DILocation(line: 0, scope: !212)
!222 = !DILocation(line: 82, column: 5, scope: !223)
!223 = distinct !DILexicalBlock(scope: !212, file: !3, line: 82, column: 5)
!224 = !DILocation(line: 82, column: 5, scope: !225)
!225 = distinct !DILexicalBlock(scope: !212, file: !3, line: 82, column: 5)
!226 = !DILocation(line: 82, column: 5, scope: !227)
!227 = distinct !DILexicalBlock(scope: !225, file: !3, line: 82, column: 5)
!228 = !DILocation(line: 82, column: 5, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !3, line: 82, column: 5)
!230 = !DILocation(line: 83, column: 5, scope: !204)
!231 = !DILocation(line: 85, column: 1, scope: !204)
!232 = distinct !DISubprogram(name: "test", scope: !3, file: !3, line: 136, type: !233, scopeLine: 137, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !235)
!233 = !DISubroutineType(types: !234)
!234 = !{null}
!235 = !{!236}
!236 = !DILocalVariable(name: "p", scope: !232, file: !3, line: 138, type: !9)
!237 = !DILocation(line: 138, column: 16, scope: !232)
!238 = !DILocation(line: 0, scope: !232)
!239 = !DILocation(line: 139, column: 8, scope: !232)
!240 = !{!99, !99, i64 0}
!241 = !DILocation(line: 140, column: 5, scope: !232)
!242 = !DILocation(line: 141, column: 1, scope: !232)
!243 = distinct !DISubprogram(name: "_dictAlloc", scope: !3, file: !3, line: 164, type: !166, scopeLine: 165, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !244)
!244 = !{!245, !246}
!245 = !DILocalVariable(name: "size", arg: 1, scope: !243, file: !3, line: 164, type: !6)
!246 = !DILocalVariable(name: "p", scope: !243, file: !3, line: 166, type: !11)
!247 = !DILocation(line: 0, scope: !243)
!248 = !DILocation(line: 166, column: 15, scope: !243)
!249 = !DILocation(line: 169, column: 5, scope: !243)
!250 = distinct !DISubprogram(name: "_dictFree", scope: !3, file: !3, line: 172, type: !205, scopeLine: 172, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !251)
!251 = !{!252}
!252 = !DILocalVariable(name: "ptr", arg: 1, scope: !250, file: !3, line: 172, type: !11)
!253 = !DILocation(line: 0, scope: !250)
!254 = !DILocation(line: 173, column: 5, scope: !250)
!255 = !DILocation(line: 174, column: 1, scope: !250)
!256 = distinct !DISubprogram(name: "dictIntHashFunction", scope: !3, file: !3, line: 188, type: !257, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !259)
!257 = !DISubroutineType(types: !258)
!258 = !{!30, !30}
!259 = !{!260}
!260 = !DILocalVariable(name: "key", arg: 1, scope: !256, file: !3, line: 188, type: !30)
!261 = !DILocation(line: 0, scope: !256)
!262 = !DILocation(line: 190, column: 12, scope: !256)
!263 = !DILocation(line: 190, column: 9, scope: !256)
!264 = !DILocation(line: 191, column: 11, scope: !256)
!265 = !DILocation(line: 192, column: 9, scope: !256)
!266 = !DILocation(line: 193, column: 11, scope: !256)
!267 = !DILocation(line: 194, column: 12, scope: !256)
!268 = !DILocation(line: 194, column: 9, scope: !256)
!269 = !DILocation(line: 195, column: 11, scope: !256)
!270 = !DILocation(line: 196, column: 5, scope: !256)
!271 = distinct !DISubprogram(name: "dictIdentityHashFunction", scope: !3, file: !3, line: 200, type: !257, scopeLine: 201, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !272)
!272 = !{!273}
!273 = !DILocalVariable(name: "key", arg: 1, scope: !271, file: !3, line: 200, type: !30)
!274 = !DILocation(line: 0, scope: !271)
!275 = !DILocation(line: 202, column: 5, scope: !271)
!276 = distinct !DISubprogram(name: "dictGenHashFunction", scope: !3, file: !3, line: 207, type: !277, scopeLine: 207, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !282)
!277 = !DISubroutineType(types: !278)
!278 = !{!30, !279, !13}
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !281)
!281 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!282 = !{!283, !284, !285}
!283 = !DILocalVariable(name: "buf", arg: 1, scope: !276, file: !3, line: 207, type: !279)
!284 = !DILocalVariable(name: "len", arg: 2, scope: !276, file: !3, line: 207, type: !13)
!285 = !DILocalVariable(name: "hash", scope: !276, file: !3, line: 208, type: !30)
!286 = !DILocation(line: 0, scope: !276)
!287 = !DILocation(line: 210, column: 5, scope: !276)
!288 = !DILocation(line: 210, column: 15, scope: !276)
!289 = !DILocation(line: 211, column: 29, scope: !276)
!290 = !DILocation(line: 211, column: 44, scope: !276)
!291 = !DILocation(line: 211, column: 40, scope: !276)
!292 = !DILocation(line: 211, column: 39, scope: !276)
!293 = !DILocation(line: 211, column: 37, scope: !276)
!294 = distinct !{!294, !287, !295, !296}
!295 = !DILocation(line: 211, column: 46, scope: !276)
!296 = !{!"llvm.loop.unroll.disable"}
!297 = !DILocation(line: 212, column: 5, scope: !276)
!298 = distinct !DISubprogram(name: "_dictReset", scope: !3, file: !3, line: 219, type: !299, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !318)
!299 = !DISubroutineType(types: !300)
!300 = !{null, !301}
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictht", file: !56, line: 67, baseType: !303)
!303 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictht", file: !56, line: 62, size: 256, elements: !304)
!304 = !{!305, !315, !316, !317}
!305 = !DIDerivedType(tag: DW_TAG_member, name: "table", scope: !303, file: !56, line: 63, baseType: !306, size: 64)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !307, size: 64)
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictEntry", file: !56, line: 49, baseType: !309)
!309 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictEntry", file: !56, line: 45, size: 192, elements: !310)
!310 = !{!311, !312, !313}
!311 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !309, file: !56, line: 46, baseType: !11, size: 64)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !309, file: !56, line: 47, baseType: !11, size: 64, offset: 64)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !309, file: !56, line: 48, baseType: !314, size: 64, offset: 128)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !303, file: !56, line: 64, baseType: !8, size: 64, offset: 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "sizemask", scope: !303, file: !56, line: 65, baseType: !8, size: 64, offset: 128)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "used", scope: !303, file: !56, line: 66, baseType: !8, size: 64, offset: 192)
!318 = !{!319}
!319 = !DILocalVariable(name: "ht", arg: 1, scope: !298, file: !3, line: 219, type: !301)
!320 = !DILocation(line: 0, scope: !298)
!321 = !DILocation(line: 225, column: 1, scope: !298)
!322 = !DILocation(line: 222, column: 14, scope: !298)
!323 = distinct !DISubprogram(name: "dictCreate", scope: !3, file: !3, line: 228, type: !324, scopeLine: 230, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !339)
!324 = !DISubroutineType(types: !325)
!325 = !{!326, !331, !11}
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "dict", file: !56, line: 75, baseType: !328)
!328 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dict", file: !56, line: 69, size: 704, elements: !329)
!329 = !{!330, !332, !333, !337, !338}
!330 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !328, file: !56, line: 70, baseType: !331, size: 64)
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "privdata", scope: !328, file: !56, line: 71, baseType: !11, size: 64, offset: 64)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "ht", scope: !328, file: !56, line: 72, baseType: !334, size: 512, offset: 128)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !302, size: 512, elements: !335)
!335 = !{!336}
!336 = !DISubrange(count: 2)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "rehashidx", scope: !328, file: !56, line: 73, baseType: !13, size: 32, offset: 640)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "iterators", scope: !328, file: !56, line: 74, baseType: !13, size: 32, offset: 672)
!339 = !{!340, !341, !342}
!340 = !DILocalVariable(name: "type", arg: 1, scope: !323, file: !3, line: 228, type: !331)
!341 = !DILocalVariable(name: "privDataPtr", arg: 2, scope: !323, file: !3, line: 229, type: !11)
!342 = !DILocalVariable(name: "d", scope: !323, file: !3, line: 231, type: !326)
!343 = !DILocation(line: 0, scope: !323)
!344 = !DILocation(line: 231, column: 15, scope: !323)
!345 = !DILocation(line: 233, column: 5, scope: !323)
!346 = !DILocation(line: 234, column: 5, scope: !323)
!347 = distinct !DISubprogram(name: "_dictInit", scope: !3, file: !3, line: 238, type: !348, scopeLine: 240, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !350)
!348 = !DISubroutineType(types: !349)
!349 = !{!13, !326, !331, !11}
!350 = !{!351, !352, !353}
!351 = !DILocalVariable(name: "d", arg: 1, scope: !347, file: !3, line: 238, type: !326)
!352 = !DILocalVariable(name: "type", arg: 2, scope: !347, file: !3, line: 238, type: !331)
!353 = !DILocalVariable(name: "privDataPtr", arg: 3, scope: !347, file: !3, line: 239, type: !11)
!354 = !DILocation(line: 0, scope: !347)
!355 = !DILocation(line: 241, column: 17, scope: !347)
!356 = !DILocation(line: 241, column: 5, scope: !347)
!357 = !DILocation(line: 242, column: 17, scope: !347)
!358 = !DILocation(line: 242, column: 5, scope: !347)
!359 = !DILocation(line: 243, column: 8, scope: !347)
!360 = !DILocation(line: 243, column: 13, scope: !347)
!361 = !{!362, !98, i64 0}
!362 = !{!"dict", !98, i64 0, !98, i64 8, !99, i64 16, !191, i64 80, !191, i64 84}
!363 = !DILocation(line: 244, column: 8, scope: !347)
!364 = !DILocation(line: 244, column: 17, scope: !347)
!365 = !{!362, !98, i64 8}
!366 = !DILocation(line: 245, column: 8, scope: !347)
!367 = !DILocation(line: 245, column: 18, scope: !347)
!368 = !{!362, !191, i64 80}
!369 = !DILocation(line: 246, column: 8, scope: !347)
!370 = !DILocation(line: 246, column: 18, scope: !347)
!371 = !{!362, !191, i64 84}
!372 = !DILocation(line: 247, column: 5, scope: !347)
!373 = distinct !DISubprogram(name: "dictResize", scope: !3, file: !3, line: 252, type: !374, scopeLine: 253, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !376)
!374 = !DISubroutineType(types: !375)
!375 = !{!13, !326}
!376 = !{!377, !378}
!377 = !DILocalVariable(name: "d", arg: 1, scope: !373, file: !3, line: 252, type: !326)
!378 = !DILocalVariable(name: "minimal", scope: !373, file: !3, line: 254, type: !13)
!379 = !DILocation(line: 0, scope: !373)
!380 = !DILocation(line: 256, column: 10, scope: !381)
!381 = distinct !DILexicalBlock(scope: !373, file: !3, line: 256, column: 9)
!382 = !DILocation(line: 256, column: 26, scope: !381)
!383 = !DILocation(line: 256, column: 29, scope: !381)
!384 = !DILocation(line: 256, column: 9, scope: !373)
!385 = !DILocation(line: 257, column: 24, scope: !373)
!386 = !{!387, !183, i64 24}
!387 = !{!"dictht", !98, i64 0, !183, i64 8, !183, i64 16, !183, i64 24}
!388 = !DILocation(line: 257, column: 15, scope: !373)
!389 = !DILocation(line: 258, column: 9, scope: !373)
!390 = !DILocation(line: 260, column: 26, scope: !373)
!391 = !DILocation(line: 260, column: 12, scope: !373)
!392 = !DILocation(line: 260, column: 5, scope: !373)
!393 = !DILocation(line: 261, column: 1, scope: !373)
!394 = distinct !DISubprogram(name: "dictExpand", scope: !3, file: !3, line: 264, type: !395, scopeLine: 265, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !397)
!395 = !DISubroutineType(types: !396)
!396 = !{!13, !326, !8}
!397 = !{!398, !399, !400, !401}
!398 = !DILocalVariable(name: "d", arg: 1, scope: !394, file: !3, line: 264, type: !326)
!399 = !DILocalVariable(name: "size", arg: 2, scope: !394, file: !3, line: 264, type: !8)
!400 = !DILocalVariable(name: "n", scope: !394, file: !3, line: 266, type: !302)
!401 = !DILocalVariable(name: "realsize", scope: !394, file: !3, line: 267, type: !8)
!402 = !DILocation(line: 0, scope: !394)
!403 = !DILocation(line: 267, column: 30, scope: !394)
!404 = !DILocation(line: 271, column: 9, scope: !405)
!405 = distinct !DILexicalBlock(scope: !394, file: !3, line: 271, column: 9)
!406 = !DILocation(line: 271, column: 28, scope: !405)
!407 = !DILocation(line: 271, column: 40, scope: !405)
!408 = !DILocation(line: 271, column: 45, scope: !405)
!409 = !DILocation(line: 271, column: 9, scope: !394)
!410 = !DILocation(line: 275, column: 26, scope: !394)
!411 = !DILocation(line: 276, column: 34, scope: !394)
!412 = !DILocation(line: 276, column: 15, scope: !394)
!413 = !DILocation(line: 280, column: 5, scope: !394)
!414 = !DILocation(line: 284, column: 18, scope: !415)
!415 = distinct !DILexicalBlock(scope: !394, file: !3, line: 284, column: 9)
!416 = !{!387, !98, i64 0}
!417 = !DILocation(line: 284, column: 24, scope: !415)
!418 = !DILocation(line: 284, column: 9, scope: !394)
!419 = !DILocation(line: 285, column: 20, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !3, line: 284, column: 33)
!421 = !{i64 0, i64 8, !97, i64 8, i64 8, !182, i64 16, i64 8, !182, i64 24, i64 8, !182}
!422 = !{i64 0, i64 8, !182, i64 8, i64 8, !182, i64 16, i64 8, !182}
!423 = !{i64 0, i64 8, !182, i64 8, i64 8, !182}
!424 = !{i64 0, i64 8, !182}
!425 = !DILocation(line: 286, column: 9, scope: !420)
!426 = !DILocation(line: 290, column: 16, scope: !394)
!427 = !DILocation(line: 291, column: 18, scope: !394)
!428 = !DILocation(line: 292, column: 5, scope: !394)
!429 = !DILocation(line: 293, column: 1, scope: !394)
!430 = distinct !DISubprogram(name: "_dictNextPower", scope: !3, file: !3, line: 633, type: !431, scopeLine: 634, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !433)
!431 = !DISubroutineType(types: !432)
!432 = !{!8, !8}
!433 = !{!434, !435}
!434 = !DILocalVariable(name: "size", arg: 1, scope: !430, file: !3, line: 633, type: !8)
!435 = !DILocalVariable(name: "i", scope: !430, file: !3, line: 635, type: !8)
!436 = !DILocation(line: 0, scope: !430)
!437 = !DILocation(line: 637, column: 14, scope: !438)
!438 = distinct !DILexicalBlock(scope: !430, file: !3, line: 637, column: 9)
!439 = !DILocation(line: 637, column: 9, scope: !430)
!440 = !DILocation(line: 639, column: 15, scope: !441)
!441 = distinct !DILexicalBlock(scope: !442, file: !3, line: 639, column: 13)
!442 = distinct !DILexicalBlock(scope: !430, file: !3, line: 638, column: 14)
!443 = !DILocation(line: 641, column: 11, scope: !442)
!444 = !DILocation(line: 639, column: 13, scope: !442)
!445 = distinct !{!445, !446, !447, !296}
!446 = !DILocation(line: 638, column: 5, scope: !430)
!447 = !DILocation(line: 642, column: 5, scope: !430)
!448 = !DILocation(line: 643, column: 1, scope: !430)
!449 = distinct !DISubprogram(name: "dictRehash", scope: !3, file: !3, line: 299, type: !450, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !452)
!450 = !DISubroutineType(types: !451)
!451 = !{!13, !326, !13}
!452 = !{!453, !454, !455, !457, !458}
!453 = !DILocalVariable(name: "d", arg: 1, scope: !449, file: !3, line: 299, type: !326)
!454 = !DILocalVariable(name: "n", arg: 2, scope: !449, file: !3, line: 299, type: !13)
!455 = !DILocalVariable(name: "de", scope: !456, file: !3, line: 303, type: !307)
!456 = distinct !DILexicalBlock(scope: !449, file: !3, line: 302, column: 16)
!457 = !DILocalVariable(name: "nextde", scope: !456, file: !3, line: 303, type: !307)
!458 = !DILocalVariable(name: "h", scope: !459, file: !3, line: 320, type: !30)
!459 = distinct !DILexicalBlock(scope: !456, file: !3, line: 319, column: 19)
!460 = !DILocation(line: 0, scope: !449)
!461 = !DILocation(line: 300, column: 10, scope: !462)
!462 = distinct !DILexicalBlock(scope: !449, file: !3, line: 300, column: 9)
!463 = !DILocation(line: 300, column: 9, scope: !449)
!464 = !DILocation(line: 302, column: 5, scope: !449)
!465 = !DILocation(line: 302, column: 12, scope: !449)
!466 = !DILocation(line: 306, column: 22, scope: !467)
!467 = distinct !DILexicalBlock(scope: !456, file: !3, line: 306, column: 13)
!468 = !DILocation(line: 306, column: 27, scope: !467)
!469 = !DILocation(line: 306, column: 13, scope: !456)
!470 = !DILocation(line: 316, column: 15, scope: !456)
!471 = !DILocation(line: 316, column: 44, scope: !456)
!472 = !DILocation(line: 316, column: 9, scope: !456)
!473 = !DILocation(line: 307, column: 32, scope: !474)
!474 = distinct !DILexicalBlock(scope: !467, file: !3, line: 306, column: 33)
!475 = !DILocation(line: 307, column: 13, scope: !474)
!476 = !DILocation(line: 308, column: 24, scope: !474)
!477 = !DILocation(line: 309, column: 13, scope: !474)
!478 = !DILocation(line: 311, column: 13, scope: !474)
!479 = !DILocation(line: 316, column: 65, scope: !456)
!480 = !DILocation(line: 0, scope: !456)
!481 = !DILocation(line: 319, column: 9, scope: !456)
!482 = distinct !{!482, !472, !479, !296}
!483 = !DILocation(line: 322, column: 26, scope: !459)
!484 = !{!485, !98, i64 16}
!485 = !{!"dictEntry", !98, i64 0, !98, i64 8, !98, i64 16}
!486 = !DILocation(line: 324, column: 17, scope: !459)
!487 = !{!488, !98, i64 0}
!488 = !{!"dictType", !98, i64 0, !98, i64 8, !98, i64 16, !98, i64 24, !98, i64 32, !98, i64 40}
!489 = !{!485, !98, i64 0}
!490 = !DILocation(line: 324, column: 52, scope: !459)
!491 = !{!387, !183, i64 16}
!492 = !DILocation(line: 0, scope: !459)
!493 = !DILocation(line: 325, column: 33, scope: !459)
!494 = !DILocation(line: 325, column: 24, scope: !459)
!495 = !DILocation(line: 325, column: 22, scope: !459)
!496 = !DILocation(line: 326, column: 31, scope: !459)
!497 = !DILocation(line: 327, column: 26, scope: !459)
!498 = !DILocation(line: 328, column: 26, scope: !459)
!499 = distinct !{!499, !481, !500, !296}
!500 = !DILocation(line: 330, column: 9, scope: !456)
!501 = !DILocation(line: 331, column: 18, scope: !456)
!502 = !DILocation(line: 331, column: 27, scope: !456)
!503 = !DILocation(line: 331, column: 9, scope: !456)
!504 = !DILocation(line: 331, column: 38, scope: !456)
!505 = !DILocation(line: 332, column: 21, scope: !456)
!506 = !DILocation(line: 333, column: 5, scope: !449)
!507 = !DILocation(line: 335, column: 1, scope: !449)
!508 = distinct !DISubprogram(name: "timeInMilliseconds", scope: !3, file: !3, line: 337, type: !509, scopeLine: 337, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !511)
!509 = !DISubroutineType(types: !510)
!510 = !{!12}
!511 = !{!512}
!512 = !DILocalVariable(name: "tv", scope: !508, file: !3, line: 338, type: !513)
!513 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !514, line: 8, size: 128, elements: !515)
!514 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "9b45d950050c215f216850b27bd1e8f3")
!515 = !{!516, !518}
!516 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !513, file: !514, line: 14, baseType: !517, size: 64)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !136, line: 160, baseType: !50)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !513, file: !514, line: 15, baseType: !519, size: 64, offset: 64)
!519 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !136, line: 162, baseType: !50)
!520 = !DILocation(line: 338, column: 5, scope: !508)
!521 = !DILocation(line: 338, column: 20, scope: !508)
!522 = !DILocation(line: 340, column: 5, scope: !508)
!523 = !DILocation(line: 341, column: 28, scope: !508)
!524 = !{!525, !183, i64 0}
!525 = !{!"timeval", !183, i64 0, !183, i64 8}
!526 = !DILocation(line: 341, column: 35, scope: !508)
!527 = !DILocation(line: 341, column: 46, scope: !508)
!528 = !{!525, !183, i64 8}
!529 = !DILocation(line: 341, column: 53, scope: !508)
!530 = !DILocation(line: 341, column: 41, scope: !508)
!531 = !DILocation(line: 342, column: 1, scope: !508)
!532 = !DILocation(line: 341, column: 5, scope: !508)
!533 = !DISubprogram(name: "gettimeofday", scope: !534, file: !534, line: 67, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !164)
!534 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "b36e339815f62ba7208e5294180e353c")
!535 = !DISubroutineType(types: !536)
!536 = !{!13, !537, !539}
!537 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !538)
!538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !513, size: 64)
!539 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !11)
!540 = distinct !DISubprogram(name: "dictRehashMilliseconds", scope: !3, file: !3, line: 345, type: !450, scopeLine: 345, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !541)
!541 = !{!542, !543, !544, !545}
!542 = !DILocalVariable(name: "d", arg: 1, scope: !540, file: !3, line: 345, type: !326)
!543 = !DILocalVariable(name: "ms", arg: 2, scope: !540, file: !3, line: 345, type: !13)
!544 = !DILocalVariable(name: "start", scope: !540, file: !3, line: 346, type: !12)
!545 = !DILocalVariable(name: "rehashes", scope: !540, file: !3, line: 347, type: !13)
!546 = !DILocation(line: 0, scope: !540)
!547 = !DILocation(line: 346, column: 23, scope: !540)
!548 = !DILocation(line: 349, column: 5, scope: !540)
!549 = !DILocation(line: 349, column: 11, scope: !540)
!550 = !DILocation(line: 350, column: 18, scope: !551)
!551 = distinct !DILexicalBlock(scope: !540, file: !3, line: 349, column: 30)
!552 = !DILocation(line: 351, column: 13, scope: !553)
!553 = distinct !DILexicalBlock(scope: !551, file: !3, line: 351, column: 13)
!554 = !DILocation(line: 351, column: 33, scope: !553)
!555 = !DILocation(line: 351, column: 40, scope: !553)
!556 = !DILocation(line: 351, column: 13, scope: !551)
!557 = distinct !{!557, !548, !558, !296}
!558 = !DILocation(line: 352, column: 5, scope: !540)
!559 = !DILocation(line: 353, column: 5, scope: !540)
!560 = distinct !DISubprogram(name: "_dictRehashStep", scope: !3, file: !3, line: 364, type: !561, scopeLine: 364, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !563)
!561 = !DISubroutineType(types: !562)
!562 = !{null, !326}
!563 = !{!564}
!564 = !DILocalVariable(name: "d", arg: 1, scope: !560, file: !3, line: 364, type: !326)
!565 = !DILocation(line: 0, scope: !560)
!566 = !DILocation(line: 365, column: 12, scope: !567)
!567 = distinct !DILexicalBlock(scope: !560, file: !3, line: 365, column: 9)
!568 = !DILocation(line: 365, column: 22, scope: !567)
!569 = !DILocation(line: 365, column: 9, scope: !560)
!570 = !DILocation(line: 365, column: 28, scope: !567)
!571 = !DILocation(line: 366, column: 1, scope: !560)
!572 = distinct !DISubprogram(name: "dictAdd", scope: !3, file: !3, line: 369, type: !573, scopeLine: 370, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !575)
!573 = !DISubroutineType(types: !574)
!574 = !{!13, !326, !11, !11}
!575 = !{!576, !577, !578, !579, !580, !581}
!576 = !DILocalVariable(name: "d", arg: 1, scope: !572, file: !3, line: 369, type: !326)
!577 = !DILocalVariable(name: "key", arg: 2, scope: !572, file: !3, line: 369, type: !11)
!578 = !DILocalVariable(name: "val", arg: 3, scope: !572, file: !3, line: 369, type: !11)
!579 = !DILocalVariable(name: "index", scope: !572, file: !3, line: 371, type: !13)
!580 = !DILocalVariable(name: "entry", scope: !572, file: !3, line: 372, type: !307)
!581 = !DILocalVariable(name: "ht", scope: !572, file: !3, line: 373, type: !301)
!582 = !DILocation(line: 0, scope: !572)
!583 = !DILocation(line: 375, column: 9, scope: !584)
!584 = distinct !DILexicalBlock(scope: !572, file: !3, line: 375, column: 9)
!585 = !DILocation(line: 375, column: 9, scope: !572)
!586 = !DILocation(line: 375, column: 29, scope: !584)
!587 = !DILocation(line: 379, column: 18, scope: !588)
!588 = distinct !DILexicalBlock(scope: !572, file: !3, line: 379, column: 9)
!589 = !DILocation(line: 379, column: 41, scope: !588)
!590 = !DILocation(line: 379, column: 9, scope: !572)
!591 = !DILocation(line: 383, column: 10, scope: !572)
!592 = !DILocation(line: 384, column: 13, scope: !572)
!593 = !DILocation(line: 385, column: 23, scope: !572)
!594 = !DILocation(line: 385, column: 19, scope: !572)
!595 = !DILocation(line: 385, column: 12, scope: !572)
!596 = !DILocation(line: 385, column: 17, scope: !572)
!597 = !DILocation(line: 386, column: 22, scope: !572)
!598 = !DILocation(line: 387, column: 9, scope: !572)
!599 = !DILocation(line: 387, column: 13, scope: !572)
!600 = !DILocation(line: 390, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !602, file: !3, line: 390, column: 5)
!602 = distinct !DILexicalBlock(scope: !572, file: !3, line: 390, column: 5)
!603 = !{!488, !98, i64 8}
!604 = !DILocation(line: 390, column: 5, scope: !602)
!605 = !DILocation(line: 391, column: 5, scope: !606)
!606 = distinct !DILexicalBlock(scope: !607, file: !3, line: 391, column: 5)
!607 = distinct !DILexicalBlock(scope: !572, file: !3, line: 391, column: 5)
!608 = !{!488, !98, i64 16}
!609 = !DILocation(line: 391, column: 5, scope: !607)
!610 = !{!485, !98, i64 8}
!611 = !DILocation(line: 393, column: 1, scope: !572)
!612 = distinct !DISubprogram(name: "_dictKeyIndex", scope: !3, file: !3, line: 651, type: !613, scopeLine: 652, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !615)
!613 = !DISubroutineType(types: !614)
!614 = !{!13, !326, !63}
!615 = !{!616, !617, !618, !619, !620, !621}
!616 = !DILocalVariable(name: "d", arg: 1, scope: !612, file: !3, line: 651, type: !326)
!617 = !DILocalVariable(name: "key", arg: 2, scope: !612, file: !3, line: 651, type: !63)
!618 = !DILocalVariable(name: "h", scope: !612, file: !3, line: 653, type: !30)
!619 = !DILocalVariable(name: "idx", scope: !612, file: !3, line: 653, type: !30)
!620 = !DILocalVariable(name: "table", scope: !612, file: !3, line: 653, type: !30)
!621 = !DILocalVariable(name: "he", scope: !612, file: !3, line: 654, type: !307)
!622 = !DILocation(line: 0, scope: !612)
!623 = !DILocation(line: 657, column: 9, scope: !624)
!624 = distinct !DILexicalBlock(scope: !612, file: !3, line: 657, column: 9)
!625 = !DILocation(line: 657, column: 32, scope: !624)
!626 = !DILocation(line: 657, column: 9, scope: !612)
!627 = !DILocation(line: 660, column: 9, scope: !612)
!628 = !DILocation(line: 661, column: 5, scope: !629)
!629 = distinct !DILexicalBlock(scope: !612, file: !3, line: 661, column: 5)
!630 = !DILocation(line: 662, column: 32, scope: !631)
!631 = distinct !DILexicalBlock(scope: !632, file: !3, line: 661, column: 42)
!632 = distinct !DILexicalBlock(scope: !629, file: !3, line: 661, column: 5)
!633 = !DILocation(line: 662, column: 15, scope: !631)
!634 = !DILocation(line: 664, column: 27, scope: !631)
!635 = !DILocation(line: 664, column: 14, scope: !631)
!636 = !DILocation(line: 0, scope: !631)
!637 = !DILocation(line: 665, column: 9, scope: !631)
!638 = !DILocation(line: 666, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !640, file: !3, line: 666, column: 17)
!640 = distinct !DILexicalBlock(scope: !631, file: !3, line: 665, column: 19)
!641 = !{!488, !98, i64 24}
!642 = !DILocation(line: 666, column: 17, scope: !640)
!643 = !DILocation(line: 668, column: 22, scope: !640)
!644 = distinct !{!644, !637, !645, !296}
!645 = !DILocation(line: 669, column: 9, scope: !631)
!646 = !DILocation(line: 670, column: 14, scope: !647)
!647 = distinct !DILexicalBlock(scope: !631, file: !3, line: 670, column: 13)
!648 = !DILocation(line: 661, column: 38, scope: !632)
!649 = !DILocation(line: 670, column: 13, scope: !631)
!650 = distinct !{!650, !628, !651, !296}
!651 = !DILocation(line: 671, column: 5, scope: !629)
!652 = !DILocation(line: 673, column: 1, scope: !612)
!653 = distinct !DISubprogram(name: "dictReplace", scope: !3, file: !3, line: 399, type: !573, scopeLine: 400, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !654)
!654 = !{!655, !656, !657, !658, !659}
!655 = !DILocalVariable(name: "d", arg: 1, scope: !653, file: !3, line: 399, type: !326)
!656 = !DILocalVariable(name: "key", arg: 2, scope: !653, file: !3, line: 399, type: !11)
!657 = !DILocalVariable(name: "val", arg: 3, scope: !653, file: !3, line: 399, type: !11)
!658 = !DILocalVariable(name: "entry", scope: !653, file: !3, line: 401, type: !307)
!659 = !DILocalVariable(name: "auxentry", scope: !653, file: !3, line: 401, type: !308)
!660 = !DILocation(line: 0, scope: !653)
!661 = !DILocation(line: 405, column: 9, scope: !662)
!662 = distinct !DILexicalBlock(scope: !653, file: !3, line: 405, column: 9)
!663 = !DILocation(line: 405, column: 30, scope: !662)
!664 = !DILocation(line: 405, column: 9, scope: !653)
!665 = !DILocation(line: 408, column: 13, scope: !653)
!666 = !DILocation(line: 415, column: 16, scope: !653)
!667 = !{i64 0, i64 8, !97, i64 8, i64 8, !97}
!668 = !DILocation(line: 416, column: 5, scope: !669)
!669 = distinct !DILexicalBlock(scope: !670, file: !3, line: 416, column: 5)
!670 = distinct !DILexicalBlock(scope: !653, file: !3, line: 416, column: 5)
!671 = !DILocation(line: 416, column: 5, scope: !670)
!672 = !DILocation(line: 417, column: 5, scope: !673)
!673 = distinct !DILexicalBlock(scope: !653, file: !3, line: 417, column: 5)
!674 = !{!488, !98, i64 40}
!675 = !DILocation(line: 417, column: 5, scope: !653)
!676 = !DILocation(line: 419, column: 1, scope: !653)
!677 = distinct !DISubprogram(name: "dictFind", scope: !3, file: !3, line: 501, type: !678, scopeLine: 502, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !680)
!678 = !DISubroutineType(types: !679)
!679 = !{!307, !326, !63}
!680 = !{!681, !682, !683, !684, !685, !686}
!681 = !DILocalVariable(name: "d", arg: 1, scope: !677, file: !3, line: 501, type: !326)
!682 = !DILocalVariable(name: "key", arg: 2, scope: !677, file: !3, line: 501, type: !63)
!683 = !DILocalVariable(name: "he", scope: !677, file: !3, line: 503, type: !307)
!684 = !DILocalVariable(name: "h", scope: !677, file: !3, line: 504, type: !30)
!685 = !DILocalVariable(name: "idx", scope: !677, file: !3, line: 504, type: !30)
!686 = !DILocalVariable(name: "table", scope: !677, file: !3, line: 504, type: !30)
!687 = !DILocation(line: 0, scope: !677)
!688 = !DILocation(line: 506, column: 18, scope: !689)
!689 = distinct !DILexicalBlock(scope: !677, file: !3, line: 506, column: 9)
!690 = !{!387, !183, i64 8}
!691 = !DILocation(line: 506, column: 23, scope: !689)
!692 = !DILocation(line: 506, column: 9, scope: !677)
!693 = !DILocation(line: 507, column: 9, scope: !694)
!694 = distinct !DILexicalBlock(scope: !677, file: !3, line: 507, column: 9)
!695 = !DILocation(line: 507, column: 9, scope: !677)
!696 = !DILocation(line: 507, column: 29, scope: !694)
!697 = !DILocation(line: 508, column: 9, scope: !677)
!698 = !DILocation(line: 509, column: 5, scope: !699)
!699 = distinct !DILexicalBlock(scope: !677, file: !3, line: 509, column: 5)
!700 = !DILocation(line: 510, column: 32, scope: !701)
!701 = distinct !DILexicalBlock(scope: !702, file: !3, line: 509, column: 42)
!702 = distinct !DILexicalBlock(scope: !699, file: !3, line: 509, column: 5)
!703 = !DILocation(line: 510, column: 15, scope: !701)
!704 = !DILocation(line: 511, column: 27, scope: !701)
!705 = !DILocation(line: 511, column: 14, scope: !701)
!706 = !DILocation(line: 0, scope: !701)
!707 = !DILocation(line: 512, column: 9, scope: !701)
!708 = !DILocation(line: 513, column: 17, scope: !709)
!709 = distinct !DILexicalBlock(scope: !710, file: !3, line: 513, column: 17)
!710 = distinct !DILexicalBlock(scope: !701, file: !3, line: 512, column: 19)
!711 = !DILocation(line: 513, column: 17, scope: !710)
!712 = !DILocation(line: 515, column: 22, scope: !710)
!713 = distinct !{!713, !707, !714, !296}
!714 = !DILocation(line: 516, column: 9, scope: !701)
!715 = !DILocation(line: 517, column: 14, scope: !716)
!716 = distinct !DILexicalBlock(scope: !701, file: !3, line: 517, column: 13)
!717 = !DILocation(line: 509, column: 38, scope: !702)
!718 = !DILocation(line: 517, column: 13, scope: !701)
!719 = distinct !{!719, !698, !720, !296}
!720 = !DILocation(line: 518, column: 5, scope: !699)
!721 = !DILocation(line: 520, column: 1, scope: !677)
!722 = distinct !DISubprogram(name: "dictGenericDelete", scope: !3, file: !3, line: 422, type: !723, scopeLine: 423, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !725)
!723 = !DISubroutineType(types: !724)
!724 = !{!13, !326, !63, !13}
!725 = !{!726, !727, !728, !729, !730, !731, !732, !733}
!726 = !DILocalVariable(name: "d", arg: 1, scope: !722, file: !3, line: 422, type: !326)
!727 = !DILocalVariable(name: "key", arg: 2, scope: !722, file: !3, line: 422, type: !63)
!728 = !DILocalVariable(name: "nofree", arg: 3, scope: !722, file: !3, line: 422, type: !13)
!729 = !DILocalVariable(name: "h", scope: !722, file: !3, line: 424, type: !30)
!730 = !DILocalVariable(name: "idx", scope: !722, file: !3, line: 424, type: !30)
!731 = !DILocalVariable(name: "he", scope: !722, file: !3, line: 425, type: !307)
!732 = !DILocalVariable(name: "prevHe", scope: !722, file: !3, line: 425, type: !307)
!733 = !DILocalVariable(name: "table", scope: !722, file: !3, line: 426, type: !13)
!734 = !DILocation(line: 0, scope: !722)
!735 = !DILocation(line: 428, column: 18, scope: !736)
!736 = distinct !DILexicalBlock(scope: !722, file: !3, line: 428, column: 9)
!737 = !DILocation(line: 428, column: 23, scope: !736)
!738 = !DILocation(line: 428, column: 9, scope: !722)
!739 = !DILocation(line: 429, column: 9, scope: !740)
!740 = distinct !DILexicalBlock(scope: !722, file: !3, line: 429, column: 9)
!741 = !DILocation(line: 429, column: 9, scope: !722)
!742 = !DILocation(line: 429, column: 29, scope: !740)
!743 = !DILocation(line: 430, column: 9, scope: !722)
!744 = !DILocation(line: 432, column: 5, scope: !745)
!745 = distinct !DILexicalBlock(scope: !722, file: !3, line: 432, column: 5)
!746 = !DILocation(line: 433, column: 32, scope: !747)
!747 = distinct !DILexicalBlock(scope: !748, file: !3, line: 432, column: 42)
!748 = distinct !DILexicalBlock(scope: !745, file: !3, line: 432, column: 5)
!749 = !DILocation(line: 433, column: 15, scope: !747)
!750 = !DILocation(line: 434, column: 27, scope: !747)
!751 = !DILocation(line: 434, column: 14, scope: !747)
!752 = !DILocation(line: 0, scope: !747)
!753 = !DILocation(line: 436, column: 9, scope: !747)
!754 = !DILocation(line: 437, column: 17, scope: !755)
!755 = distinct !DILexicalBlock(scope: !756, file: !3, line: 437, column: 17)
!756 = distinct !DILexicalBlock(scope: !747, file: !3, line: 436, column: 19)
!757 = !DILocation(line: 437, column: 17, scope: !756)
!758 = !DILocation(line: 433, column: 19, scope: !747)
!759 = !DILocation(line: 439, column: 21, scope: !760)
!760 = distinct !DILexicalBlock(scope: !761, file: !3, line: 439, column: 21)
!761 = distinct !DILexicalBlock(scope: !755, file: !3, line: 437, column: 55)
!762 = !DILocation(line: 439, column: 21, scope: !761)
!763 = !DILocation(line: 440, column: 40, scope: !760)
!764 = !DILocation(line: 440, column: 29, scope: !760)
!765 = !DILocation(line: 440, column: 34, scope: !760)
!766 = !DILocation(line: 440, column: 21, scope: !760)
!767 = !DILocation(line: 442, column: 51, scope: !760)
!768 = !DILocation(line: 442, column: 34, scope: !760)
!769 = !DILocation(line: 442, column: 21, scope: !760)
!770 = !DILocation(line: 442, column: 45, scope: !760)
!771 = !DILocation(line: 443, column: 22, scope: !772)
!772 = distinct !DILexicalBlock(scope: !761, file: !3, line: 443, column: 21)
!773 = !DILocation(line: 443, column: 21, scope: !761)
!774 = !DILocation(line: 444, column: 21, scope: !775)
!775 = distinct !DILexicalBlock(scope: !776, file: !3, line: 444, column: 21)
!776 = distinct !DILexicalBlock(scope: !772, file: !3, line: 443, column: 30)
!777 = !{!488, !98, i64 32}
!778 = !DILocation(line: 444, column: 21, scope: !776)
!779 = !DILocation(line: 445, column: 21, scope: !780)
!780 = distinct !DILexicalBlock(scope: !776, file: !3, line: 445, column: 21)
!781 = !DILocation(line: 445, column: 21, scope: !776)
!782 = !DILocation(line: 447, column: 27, scope: !761)
!783 = !DILocation(line: 447, column: 17, scope: !761)
!784 = !DILocation(line: 448, column: 30, scope: !761)
!785 = !DILocation(line: 448, column: 34, scope: !761)
!786 = !DILocation(line: 449, column: 17, scope: !761)
!787 = !DILocation(line: 452, column: 22, scope: !756)
!788 = distinct !{!788, !753, !789, !296}
!789 = !DILocation(line: 453, column: 9, scope: !747)
!790 = !DILocation(line: 454, column: 14, scope: !791)
!791 = distinct !DILexicalBlock(scope: !747, file: !3, line: 454, column: 13)
!792 = !DILocation(line: 454, column: 13, scope: !747)
!793 = distinct !{!793, !744, !794, !296}
!794 = !DILocation(line: 455, column: 5, scope: !745)
!795 = !DILocation(line: 457, column: 1, scope: !722)
!796 = distinct !DISubprogram(name: "dictDelete", scope: !3, file: !3, line: 459, type: !613, scopeLine: 459, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !797)
!797 = !{!798, !799}
!798 = !DILocalVariable(name: "ht", arg: 1, scope: !796, file: !3, line: 459, type: !326)
!799 = !DILocalVariable(name: "key", arg: 2, scope: !796, file: !3, line: 459, type: !63)
!800 = !DILocation(line: 0, scope: !796)
!801 = !DILocation(line: 460, column: 12, scope: !796)
!802 = !DILocation(line: 460, column: 5, scope: !796)
!803 = distinct !DISubprogram(name: "dictDeleteNoFree", scope: !3, file: !3, line: 463, type: !613, scopeLine: 463, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !804)
!804 = !{!805, !806}
!805 = !DILocalVariable(name: "ht", arg: 1, scope: !803, file: !3, line: 463, type: !326)
!806 = !DILocalVariable(name: "key", arg: 2, scope: !803, file: !3, line: 463, type: !63)
!807 = !DILocation(line: 0, scope: !803)
!808 = !DILocation(line: 464, column: 12, scope: !803)
!809 = !DILocation(line: 464, column: 5, scope: !803)
!810 = distinct !DISubprogram(name: "_dictClear", scope: !3, file: !3, line: 468, type: !811, scopeLine: 469, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !813)
!811 = !DISubroutineType(types: !812)
!812 = !{!13, !326, !301}
!813 = !{!814, !815, !816, !817, !821}
!814 = !DILocalVariable(name: "d", arg: 1, scope: !810, file: !3, line: 468, type: !326)
!815 = !DILocalVariable(name: "ht", arg: 2, scope: !810, file: !3, line: 468, type: !301)
!816 = !DILocalVariable(name: "i", scope: !810, file: !3, line: 470, type: !8)
!817 = !DILocalVariable(name: "he", scope: !818, file: !3, line: 474, type: !307)
!818 = distinct !DILexicalBlock(scope: !819, file: !3, line: 473, column: 52)
!819 = distinct !DILexicalBlock(scope: !820, file: !3, line: 473, column: 5)
!820 = distinct !DILexicalBlock(scope: !810, file: !3, line: 473, column: 5)
!821 = !DILocalVariable(name: "nextHe", scope: !818, file: !3, line: 474, type: !307)
!822 = !DILocation(line: 0, scope: !810)
!823 = !DILocation(line: 473, column: 37, scope: !819)
!824 = !DILocation(line: 473, column: 25, scope: !819)
!825 = !DILocation(line: 473, column: 19, scope: !819)
!826 = !DILocation(line: 473, column: 30, scope: !819)
!827 = !DILocation(line: 473, column: 42, scope: !819)
!828 = !DILocation(line: 473, column: 5, scope: !820)
!829 = !DILocation(line: 476, column: 23, scope: !830)
!830 = distinct !DILexicalBlock(scope: !818, file: !3, line: 476, column: 13)
!831 = !DILocation(line: 476, column: 19, scope: !830)
!832 = !DILocation(line: 0, scope: !818)
!833 = !DILocation(line: 476, column: 33, scope: !830)
!834 = !DILocation(line: 476, column: 13, scope: !818)
!835 = !DILocation(line: 478, column: 26, scope: !836)
!836 = distinct !DILexicalBlock(scope: !818, file: !3, line: 477, column: 19)
!837 = !DILocation(line: 481, column: 23, scope: !836)
!838 = !DILocation(line: 481, column: 13, scope: !836)
!839 = !DILocation(line: 482, column: 21, scope: !836)
!840 = !DILocation(line: 477, column: 9, scope: !818)
!841 = distinct !{!841, !840, !842, !296}
!842 = !DILocation(line: 484, column: 9, scope: !818)
!843 = !DILocation(line: 473, column: 48, scope: !819)
!844 = distinct !{!844, !828, !845, !296}
!845 = !DILocation(line: 485, column: 5, scope: !820)
!846 = !DILocation(line: 487, column: 19, scope: !810)
!847 = !DILocation(line: 487, column: 5, scope: !810)
!848 = !DILocation(line: 489, column: 5, scope: !810)
!849 = !DILocation(line: 490, column: 5, scope: !810)
!850 = distinct !DISubprogram(name: "dictRelease", scope: !3, file: !3, line: 494, type: !561, scopeLine: 495, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !851)
!851 = !{!852}
!852 = !DILocalVariable(name: "d", arg: 1, scope: !850, file: !3, line: 494, type: !326)
!853 = !DILocation(line: 0, scope: !850)
!854 = !DILocation(line: 496, column: 19, scope: !850)
!855 = !DILocation(line: 496, column: 5, scope: !850)
!856 = !DILocation(line: 497, column: 19, scope: !850)
!857 = !DILocation(line: 497, column: 5, scope: !850)
!858 = !DILocation(line: 498, column: 15, scope: !850)
!859 = !DILocation(line: 498, column: 5, scope: !850)
!860 = !DILocation(line: 499, column: 1, scope: !850)
!861 = distinct !DISubprogram(name: "dictFetchValue", scope: !3, file: !3, line: 522, type: !862, scopeLine: 522, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !864)
!862 = !DISubroutineType(types: !863)
!863 = !{!11, !326, !63}
!864 = !{!865, !866, !867}
!865 = !DILocalVariable(name: "d", arg: 1, scope: !861, file: !3, line: 522, type: !326)
!866 = !DILocalVariable(name: "key", arg: 2, scope: !861, file: !3, line: 522, type: !63)
!867 = !DILocalVariable(name: "he", scope: !861, file: !3, line: 523, type: !307)
!868 = !DILocation(line: 0, scope: !861)
!869 = !DILocation(line: 525, column: 10, scope: !861)
!870 = !DILocation(line: 526, column: 12, scope: !861)
!871 = !DILocation(line: 526, column: 17, scope: !861)
!872 = !DILocation(line: 526, column: 5, scope: !861)
!873 = distinct !DISubprogram(name: "dictGetIterator", scope: !3, file: !3, line: 529, type: !874, scopeLine: 530, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !885)
!874 = !DISubroutineType(types: !875)
!875 = !{!876, !326}
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!877 = !DIDerivedType(tag: DW_TAG_typedef, name: "dictIterator", file: !56, line: 82, baseType: !878)
!878 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dictIterator", file: !56, line: 77, size: 256, elements: !879)
!879 = !{!880, !881, !882, !883, !884}
!880 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !878, file: !56, line: 78, baseType: !326, size: 64)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "table", scope: !878, file: !56, line: 79, baseType: !13, size: 32, offset: 64)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !878, file: !56, line: 80, baseType: !13, size: 32, offset: 96)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "entry", scope: !878, file: !56, line: 81, baseType: !307, size: 64, offset: 128)
!884 = !DIDerivedType(tag: DW_TAG_member, name: "nextEntry", scope: !878, file: !56, line: 81, baseType: !307, size: 64, offset: 192)
!885 = !{!886, !887}
!886 = !DILocalVariable(name: "d", arg: 1, scope: !873, file: !3, line: 529, type: !326)
!887 = !DILocalVariable(name: "iter", scope: !873, file: !3, line: 531, type: !876)
!888 = !DILocation(line: 0, scope: !873)
!889 = !DILocation(line: 531, column: 26, scope: !873)
!890 = !DILocation(line: 533, column: 11, scope: !873)
!891 = !DILocation(line: 533, column: 13, scope: !873)
!892 = !{!893, !98, i64 0}
!893 = !{!"dictIterator", !98, i64 0, !191, i64 8, !191, i64 12, !98, i64 16, !98, i64 24}
!894 = !DILocation(line: 534, column: 11, scope: !873)
!895 = !DILocation(line: 534, column: 17, scope: !873)
!896 = !{!893, !191, i64 8}
!897 = !DILocation(line: 535, column: 11, scope: !873)
!898 = !DILocation(line: 535, column: 17, scope: !873)
!899 = !{!893, !191, i64 12}
!900 = !DILocation(line: 536, column: 11, scope: !873)
!901 = !DILocation(line: 537, column: 21, scope: !873)
!902 = !DILocation(line: 538, column: 5, scope: !873)
!903 = distinct !DISubprogram(name: "dictNext", scope: !3, file: !3, line: 541, type: !904, scopeLine: 542, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !906)
!904 = !DISubroutineType(types: !905)
!905 = !{!307, !876}
!906 = !{!907, !908}
!907 = !DILocalVariable(name: "iter", arg: 1, scope: !903, file: !3, line: 541, type: !876)
!908 = !DILocalVariable(name: "ht", scope: !909, file: !3, line: 545, type: !301)
!909 = distinct !DILexicalBlock(scope: !910, file: !3, line: 544, column: 34)
!910 = distinct !DILexicalBlock(scope: !911, file: !3, line: 544, column: 13)
!911 = distinct !DILexicalBlock(scope: !903, file: !3, line: 543, column: 15)
!912 = !DILocation(line: 0, scope: !903)
!913 = !DILocation(line: 543, column: 5, scope: !903)
!914 = !DILocation(line: 544, column: 19, scope: !910)
!915 = !{!893, !98, i64 16}
!916 = !DILocation(line: 544, column: 25, scope: !910)
!917 = !DILocation(line: 544, column: 13, scope: !911)
!918 = !DILocation(line: 545, column: 33, scope: !909)
!919 = !DILocation(line: 545, column: 45, scope: !909)
!920 = !DILocation(line: 545, column: 27, scope: !909)
!921 = !DILocation(line: 0, scope: !909)
!922 = !DILocation(line: 546, column: 23, scope: !923)
!923 = distinct !DILexicalBlock(scope: !909, file: !3, line: 546, column: 17)
!924 = !DILocation(line: 546, column: 29, scope: !923)
!925 = !DILocation(line: 546, column: 35, scope: !923)
!926 = !DILocation(line: 546, column: 65, scope: !923)
!927 = !DILocation(line: 546, column: 74, scope: !923)
!928 = !DILocation(line: 546, column: 56, scope: !923)
!929 = !DILocation(line: 547, column: 24, scope: !909)
!930 = !DILocation(line: 548, column: 45, scope: !931)
!931 = distinct !DILexicalBlock(scope: !909, file: !3, line: 548, column: 17)
!932 = !DILocation(line: 548, column: 32, scope: !931)
!933 = !DILocation(line: 548, column: 29, scope: !931)
!934 = !DILocation(line: 548, column: 17, scope: !909)
!935 = !DILocation(line: 549, column: 21, scope: !936)
!936 = distinct !DILexicalBlock(scope: !937, file: !3, line: 549, column: 21)
!937 = distinct !DILexicalBlock(scope: !931, file: !3, line: 548, column: 51)
!938 = !DILocation(line: 549, column: 46, scope: !936)
!939 = !DILocation(line: 550, column: 32, scope: !940)
!940 = distinct !DILexicalBlock(scope: !936, file: !3, line: 549, column: 67)
!941 = !DILocation(line: 551, column: 33, scope: !940)
!942 = !DILocation(line: 556, column: 13, scope: !937)
!943 = !DILocation(line: 557, column: 31, scope: !909)
!944 = !DILocation(line: 557, column: 43, scope: !909)
!945 = !DILocation(line: 557, column: 27, scope: !909)
!946 = !DILocation(line: 0, scope: !910)
!947 = !DILocation(line: 561, column: 13, scope: !948)
!948 = distinct !DILexicalBlock(scope: !911, file: !3, line: 561, column: 13)
!949 = !DILocation(line: 561, column: 13, scope: !911)
!950 = distinct !{!950, !913, !951, !296}
!951 = !DILocation(line: 567, column: 5, scope: !903)
!952 = !DILocation(line: 564, column: 44, scope: !953)
!953 = distinct !DILexicalBlock(scope: !948, file: !3, line: 561, column: 26)
!954 = !DILocation(line: 564, column: 19, scope: !953)
!955 = !DILocation(line: 564, column: 29, scope: !953)
!956 = !{!893, !98, i64 24}
!957 = !DILocation(line: 565, column: 13, scope: !953)
!958 = !DILocation(line: 569, column: 1, scope: !903)
!959 = distinct !DISubprogram(name: "dictReleaseIterator", scope: !3, file: !3, line: 571, type: !960, scopeLine: 572, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !962)
!960 = !DISubroutineType(types: !961)
!961 = !{null, !876}
!962 = !{!963}
!963 = !DILocalVariable(name: "iter", arg: 1, scope: !959, file: !3, line: 571, type: !876)
!964 = !DILocation(line: 0, scope: !959)
!965 = !DILocation(line: 573, column: 17, scope: !966)
!966 = distinct !DILexicalBlock(scope: !959, file: !3, line: 573, column: 9)
!967 = !DILocation(line: 573, column: 23, scope: !966)
!968 = !DILocation(line: 573, column: 29, scope: !966)
!969 = !DILocation(line: 573, column: 38, scope: !966)
!970 = !DILocation(line: 573, column: 44, scope: !966)
!971 = !DILocation(line: 573, column: 9, scope: !959)
!972 = !DILocation(line: 573, column: 57, scope: !966)
!973 = !DILocation(line: 573, column: 60, scope: !966)
!974 = !DILocation(line: 573, column: 69, scope: !966)
!975 = !DILocation(line: 573, column: 51, scope: !966)
!976 = !DILocation(line: 574, column: 15, scope: !959)
!977 = !DILocation(line: 574, column: 5, scope: !959)
!978 = !DILocation(line: 575, column: 1, scope: !959)
!979 = distinct !DISubprogram(name: "dictGetRandomKey", scope: !3, file: !3, line: 579, type: !980, scopeLine: 580, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !982)
!980 = !DISubroutineType(types: !981)
!981 = !{!307, !326}
!982 = !{!983, !984, !985, !986, !987, !988}
!983 = !DILocalVariable(name: "d", arg: 1, scope: !979, file: !3, line: 579, type: !326)
!984 = !DILocalVariable(name: "he", scope: !979, file: !3, line: 581, type: !307)
!985 = !DILocalVariable(name: "orighe", scope: !979, file: !3, line: 581, type: !307)
!986 = !DILocalVariable(name: "h", scope: !979, file: !3, line: 582, type: !30)
!987 = !DILocalVariable(name: "listlen", scope: !979, file: !3, line: 583, type: !13)
!988 = !DILocalVariable(name: "listele", scope: !979, file: !3, line: 583, type: !13)
!989 = !DILocation(line: 0, scope: !979)
!990 = !DILocation(line: 585, column: 9, scope: !991)
!991 = distinct !DILexicalBlock(scope: !979, file: !3, line: 585, column: 9)
!992 = !DILocation(line: 585, column: 21, scope: !991)
!993 = !DILocation(line: 585, column: 9, scope: !979)
!994 = !DILocation(line: 586, column: 9, scope: !995)
!995 = distinct !DILexicalBlock(scope: !979, file: !3, line: 586, column: 9)
!996 = !DILocation(line: 586, column: 9, scope: !979)
!997 = !DILocation(line: 586, column: 29, scope: !995)
!998 = !DILocation(line: 587, column: 9, scope: !999)
!999 = distinct !DILexicalBlock(scope: !979, file: !3, line: 587, column: 9)
!1000 = !DILocation(line: 587, column: 9, scope: !979)
!1001 = !DILocation(line: 588, column: 9, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !999, file: !3, line: 587, column: 29)
!1003 = !DILocation(line: 594, column: 9, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !999, file: !3, line: 593, column: 12)
!1005 = !DILocation(line: 589, column: 17, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 588, column: 12)
!1007 = !DILocation(line: 589, column: 38, scope: !1006)
!1008 = !DILocation(line: 589, column: 52, scope: !1006)
!1009 = !DILocation(line: 589, column: 42, scope: !1006)
!1010 = !DILocation(line: 589, column: 26, scope: !1006)
!1011 = !DILocation(line: 590, column: 19, scope: !1006)
!1012 = !DILocation(line: 590, column: 21, scope: !1006)
!1013 = !DILocation(line: 590, column: 18, scope: !1006)
!1014 = !DILocation(line: 590, column: 50, scope: !1006)
!1015 = !DILocation(line: 590, column: 58, scope: !1006)
!1016 = !DILocation(line: 590, column: 41, scope: !1006)
!1017 = !DILocation(line: 591, column: 48, scope: !1006)
!1018 = !DILocation(line: 591, column: 39, scope: !1006)
!1019 = !DILocation(line: 592, column: 20, scope: !1002)
!1020 = !DILocation(line: 592, column: 9, scope: !1006)
!1021 = distinct !{!1021, !1001, !1022, !296}
!1022 = !DILocation(line: 592, column: 27, scope: !1002)
!1023 = !DILocation(line: 595, column: 17, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 594, column: 12)
!1025 = !DILocation(line: 595, column: 37, scope: !1024)
!1026 = !DILocation(line: 596, column: 27, scope: !1024)
!1027 = !DILocation(line: 596, column: 18, scope: !1024)
!1028 = !DILocation(line: 597, column: 20, scope: !1004)
!1029 = !DILocation(line: 597, column: 9, scope: !1024)
!1030 = distinct !{!1030, !1003, !1031, !296}
!1031 = !DILocation(line: 597, column: 27, scope: !1004)
!1032 = !DILocation(line: 0, scope: !999)
!1033 = !DILocation(line: 606, column: 5, scope: !979)
!1034 = !DILocation(line: 607, column: 18, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !979, file: !3, line: 606, column: 15)
!1036 = !DILocation(line: 608, column: 16, scope: !1035)
!1037 = distinct !{!1037, !1033, !1038, !296}
!1038 = !DILocation(line: 609, column: 5, scope: !979)
!1039 = !DILocation(line: 610, column: 15, scope: !979)
!1040 = !DILocation(line: 610, column: 24, scope: !979)
!1041 = !DILocation(line: 612, column: 5, scope: !979)
!1042 = !DILocation(line: 612, column: 18, scope: !979)
!1043 = !DILocation(line: 612, column: 31, scope: !979)
!1044 = distinct !{!1044, !1041, !1043, !296}
!1045 = !DILocation(line: 614, column: 1, scope: !979)
!1046 = !DISubprogram(name: "random", scope: !3, file: !3, line: 589, type: !1047, flags: DIFlagArtificial, spFlags: DISPFlagOptimized, retainedNodes: !164)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!13}
!1049 = distinct !DISubprogram(name: "_dictExpandIfNeeded", scope: !3, file: !3, line: 619, type: !374, scopeLine: 620, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1050)
!1050 = !{!1051}
!1051 = !DILocalVariable(name: "d", arg: 1, scope: !1049, file: !3, line: 619, type: !326)
!1052 = !DILocation(line: 0, scope: !1049)
!1053 = !DILocation(line: 623, column: 9, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !1049, file: !3, line: 623, column: 9)
!1055 = !DILocation(line: 623, column: 9, scope: !1049)
!1056 = !DILocation(line: 624, column: 18, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1049, file: !3, line: 624, column: 9)
!1058 = !DILocation(line: 624, column: 23, scope: !1057)
!1059 = !DILocation(line: 624, column: 9, scope: !1049)
!1060 = !DILocation(line: 626, column: 18, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1049, file: !3, line: 626, column: 9)
!1062 = !DILocation(line: 626, column: 23, scope: !1061)
!1063 = !DILocation(line: 626, column: 40, scope: !1061)
!1064 = !DILocation(line: 628, column: 67, scope: !1061)
!1065 = !DILocation(line: 627, column: 9, scope: !1061)
!1066 = !DILocation(line: 630, column: 1, scope: !1049)
!1067 = distinct !DISubprogram(name: "dictEmpty", scope: !3, file: !3, line: 675, type: !561, scopeLine: 675, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1068)
!1068 = !{!1069}
!1069 = !DILocalVariable(name: "d", arg: 1, scope: !1067, file: !3, line: 675, type: !326)
!1070 = !DILocation(line: 0, scope: !1067)
!1071 = !DILocation(line: 676, column: 19, scope: !1067)
!1072 = !DILocation(line: 676, column: 5, scope: !1067)
!1073 = !DILocation(line: 677, column: 19, scope: !1067)
!1074 = !DILocation(line: 677, column: 5, scope: !1067)
!1075 = !DILocation(line: 678, column: 8, scope: !1067)
!1076 = !DILocation(line: 678, column: 18, scope: !1067)
!1077 = !DILocation(line: 679, column: 8, scope: !1067)
!1078 = !DILocation(line: 679, column: 18, scope: !1067)
!1079 = !DILocation(line: 680, column: 1, scope: !1067)
!1080 = distinct !DISubprogram(name: "_dictPrintStatsHt", scope: !3, file: !3, line: 683, type: !299, scopeLine: 683, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1081)
!1081 = !{!1082, !1083, !1084, !1085, !1086, !1087, !1088, !1092}
!1082 = !DILocalVariable(name: "ht", arg: 1, scope: !1080, file: !3, line: 683, type: !301)
!1083 = !DILocalVariable(name: "i", scope: !1080, file: !3, line: 684, type: !8)
!1084 = !DILocalVariable(name: "slots", scope: !1080, file: !3, line: 684, type: !8)
!1085 = !DILocalVariable(name: "chainlen", scope: !1080, file: !3, line: 684, type: !8)
!1086 = !DILocalVariable(name: "maxchainlen", scope: !1080, file: !3, line: 684, type: !8)
!1087 = !DILocalVariable(name: "totchainlen", scope: !1080, file: !3, line: 685, type: !8)
!1088 = !DILocalVariable(name: "clvector", scope: !1080, file: !3, line: 686, type: !1089)
!1089 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !1090)
!1090 = !{!1091}
!1091 = !DISubrange(count: 50)
!1092 = !DILocalVariable(name: "he", scope: !1093, file: !3, line: 695, type: !307)
!1093 = distinct !DILexicalBlock(scope: !1094, file: !3, line: 694, column: 36)
!1094 = distinct !DILexicalBlock(scope: !1095, file: !3, line: 694, column: 5)
!1095 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 694, column: 5)
!1096 = !DILocation(line: 0, scope: !1080)
!1097 = !DILocation(line: 686, column: 5, scope: !1080)
!1098 = !DILocation(line: 686, column: 19, scope: !1080)
!1099 = !DILocation(line: 688, column: 13, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 688, column: 9)
!1101 = !DILocation(line: 688, column: 18, scope: !1100)
!1102 = !DILocation(line: 688, column: 9, scope: !1080)
!1103 = !DILocation(line: 693, column: 58, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1105, file: !3, line: 693, column: 5)
!1105 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 693, column: 5)
!1106 = !DILocation(line: 694, column: 19, scope: !1094)
!1107 = !DILocation(line: 694, column: 5, scope: !1095)
!1108 = !DILocation(line: 689, column: 9, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1100, file: !3, line: 688, column: 24)
!1110 = !DILocation(line: 690, column: 9, scope: !1109)
!1111 = !DILocation(line: 697, column: 13, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 697, column: 13)
!1113 = !DILocation(line: 697, column: 26, scope: !1112)
!1114 = !DILocation(line: 697, column: 13, scope: !1093)
!1115 = !DILocation(line: 698, column: 24, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 697, column: 35)
!1117 = !DILocation(line: 699, column: 13, scope: !1116)
!1118 = !DILocation(line: 0, scope: !1093)
!1119 = !DILocation(line: 706, column: 21, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 705, column: 19)
!1121 = !DILocation(line: 707, column: 22, scope: !1120)
!1122 = !DILocation(line: 705, column: 9, scope: !1093)
!1123 = distinct !{!1123, !1122, !1124, !296}
!1124 = !DILocation(line: 708, column: 9, scope: !1093)
!1125 = !DILocation(line: 701, column: 14, scope: !1093)
!1126 = !DILocation(line: 709, column: 18, scope: !1093)
!1127 = !DILocation(line: 709, column: 9, scope: !1093)
!1128 = !DILocation(line: 709, column: 86, scope: !1093)
!1129 = !DILocation(line: 710, column: 22, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 710, column: 13)
!1131 = !DILocation(line: 710, column: 13, scope: !1093)
!1132 = !DILocation(line: 711, column: 21, scope: !1093)
!1133 = !DILocation(line: 712, column: 5, scope: !1094)
!1134 = !DILocation(line: 694, column: 32, scope: !1094)
!1135 = distinct !{!1135, !1107, !1136, !296}
!1136 = !DILocation(line: 712, column: 5, scope: !1095)
!1137 = !DILocation(line: 684, column: 22, scope: !1080)
!1138 = !DILocation(line: 684, column: 43, scope: !1080)
!1139 = !DILocation(line: 685, column: 19, scope: !1080)
!1140 = !DILocation(line: 694, column: 25, scope: !1094)
!1141 = !DILocation(line: 713, column: 5, scope: !1080)
!1142 = !DILocation(line: 714, column: 38, scope: !1080)
!1143 = !DILocation(line: 714, column: 5, scope: !1080)
!1144 = !DILocation(line: 715, column: 46, scope: !1080)
!1145 = !DILocation(line: 715, column: 5, scope: !1080)
!1146 = !DILocation(line: 716, column: 5, scope: !1080)
!1147 = !DILocation(line: 717, column: 5, scope: !1080)
!1148 = !DILocation(line: 718, column: 52, scope: !1080)
!1149 = !DILocation(line: 718, column: 71, scope: !1080)
!1150 = !DILocation(line: 718, column: 70, scope: !1080)
!1151 = !DILocation(line: 718, column: 5, scope: !1080)
!1152 = !DILocation(line: 719, column: 64, scope: !1080)
!1153 = !DILocation(line: 719, column: 53, scope: !1080)
!1154 = !DILocation(line: 719, column: 68, scope: !1080)
!1155 = !DILocation(line: 719, column: 5, scope: !1080)
!1156 = !DILocation(line: 720, column: 5, scope: !1080)
!1157 = !DILocation(line: 721, column: 5, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 721, column: 5)
!1159 = !DILocation(line: 722, column: 13, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1161, file: !3, line: 722, column: 13)
!1161 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 721, column: 48)
!1162 = distinct !DILexicalBlock(scope: !1158, file: !3, line: 721, column: 5)
!1163 = !DILocation(line: 722, column: 25, scope: !1160)
!1164 = !DILocation(line: 722, column: 13, scope: !1161)
!1165 = !DILocation(line: 723, column: 99, scope: !1161)
!1166 = !DILocation(line: 723, column: 122, scope: !1161)
!1167 = !DILocation(line: 723, column: 118, scope: !1161)
!1168 = !DILocation(line: 723, column: 117, scope: !1161)
!1169 = !DILocation(line: 723, column: 127, scope: !1161)
!1170 = !DILocation(line: 723, column: 98, scope: !1161)
!1171 = !DILocation(line: 723, column: 9, scope: !1161)
!1172 = !DILocation(line: 724, column: 5, scope: !1161)
!1173 = !DILocation(line: 721, column: 44, scope: !1162)
!1174 = !DILocation(line: 721, column: 19, scope: !1162)
!1175 = distinct !{!1175, !1157, !1176, !296}
!1176 = !DILocation(line: 724, column: 5, scope: !1158)
!1177 = !DILocation(line: 725, column: 1, scope: !1080)
!1178 = distinct !DISubprogram(name: "dictPrintStats", scope: !3, file: !3, line: 727, type: !561, scopeLine: 727, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1179)
!1179 = !{!1180}
!1180 = !DILocalVariable(name: "d", arg: 1, scope: !1178, file: !3, line: 727, type: !326)
!1181 = !DILocation(line: 0, scope: !1178)
!1182 = !DILocation(line: 728, column: 24, scope: !1178)
!1183 = !DILocation(line: 728, column: 5, scope: !1178)
!1184 = !DILocation(line: 729, column: 9, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1178, file: !3, line: 729, column: 9)
!1186 = !DILocation(line: 729, column: 9, scope: !1178)
!1187 = !DILocation(line: 730, column: 9, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1185, file: !3, line: 729, column: 29)
!1189 = !DILocation(line: 731, column: 28, scope: !1188)
!1190 = !DILocation(line: 731, column: 9, scope: !1188)
!1191 = !DILocation(line: 732, column: 5, scope: !1188)
!1192 = !DILocation(line: 733, column: 1, scope: !1178)
!1193 = distinct !DISubprogram(name: "dictEnableResize", scope: !3, file: !3, line: 735, type: !233, scopeLine: 735, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !164)
!1194 = !DILocation(line: 736, column: 21, scope: !1193)
!1195 = !DILocation(line: 737, column: 1, scope: !1193)
!1196 = distinct !DISubprogram(name: "dictDisableResize", scope: !3, file: !3, line: 739, type: !233, scopeLine: 739, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !164)
!1197 = !DILocation(line: 740, column: 21, scope: !1196)
!1198 = !DILocation(line: 741, column: 1, scope: !1196)
!1199 = distinct !DISubprogram(name: "_dictStringCopyHTHashFunction", scope: !3, file: !3, line: 745, type: !61, scopeLine: 746, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1200)
!1200 = !{!1201}
!1201 = !DILocalVariable(name: "key", arg: 1, scope: !1199, file: !3, line: 745, type: !63)
!1202 = !DILocation(line: 0, scope: !1199)
!1203 = !DILocation(line: 747, column: 37, scope: !1199)
!1204 = !DILocation(line: 747, column: 12, scope: !1199)
!1205 = !DILocation(line: 747, column: 5, scope: !1199)
!1206 = distinct !DISubprogram(name: "_dictStringCopyHTKeyDup", scope: !3, file: !3, line: 750, type: !67, scopeLine: 751, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1207)
!1207 = !{!1208, !1209, !1210, !1211}
!1208 = !DILocalVariable(name: "privdata", arg: 1, scope: !1206, file: !3, line: 750, type: !11)
!1209 = !DILocalVariable(name: "key", arg: 2, scope: !1206, file: !3, line: 750, type: !63)
!1210 = !DILocalVariable(name: "len", scope: !1206, file: !3, line: 752, type: !13)
!1211 = !DILocalVariable(name: "copy", scope: !1206, file: !3, line: 753, type: !9)
!1212 = !DILocation(line: 0, scope: !1206)
!1213 = !DILocation(line: 752, column: 15, scope: !1206)
!1214 = !DILocation(line: 753, column: 29, scope: !1206)
!1215 = !DILocation(line: 753, column: 18, scope: !1206)
!1216 = !DILocation(line: 756, column: 23, scope: !1206)
!1217 = !DILocation(line: 756, column: 5, scope: !1206)
!1218 = !DILocation(line: 757, column: 5, scope: !1206)
!1219 = !DILocation(line: 757, column: 15, scope: !1206)
!1220 = !DILocation(line: 758, column: 5, scope: !1206)
!1221 = distinct !DISubprogram(name: "_dictStringKeyValCopyHTValDup", scope: !3, file: !3, line: 761, type: !67, scopeLine: 762, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1222)
!1222 = !{!1223, !1224, !1225, !1226}
!1223 = !DILocalVariable(name: "privdata", arg: 1, scope: !1221, file: !3, line: 761, type: !11)
!1224 = !DILocalVariable(name: "val", arg: 2, scope: !1221, file: !3, line: 761, type: !63)
!1225 = !DILocalVariable(name: "len", scope: !1221, file: !3, line: 763, type: !13)
!1226 = !DILocalVariable(name: "copy", scope: !1221, file: !3, line: 764, type: !9)
!1227 = !DILocation(line: 0, scope: !1221)
!1228 = !DILocation(line: 763, column: 15, scope: !1221)
!1229 = !DILocation(line: 764, column: 29, scope: !1221)
!1230 = !DILocation(line: 764, column: 18, scope: !1221)
!1231 = !DILocation(line: 767, column: 23, scope: !1221)
!1232 = !DILocation(line: 767, column: 5, scope: !1221)
!1233 = !DILocation(line: 768, column: 5, scope: !1221)
!1234 = !DILocation(line: 768, column: 15, scope: !1221)
!1235 = !DILocation(line: 769, column: 5, scope: !1221)
!1236 = distinct !DISubprogram(name: "_dictStringCopyHTKeyCompare", scope: !3, file: !3, line: 772, type: !72, scopeLine: 774, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1237)
!1237 = !{!1238, !1239, !1240}
!1238 = !DILocalVariable(name: "privdata", arg: 1, scope: !1236, file: !3, line: 772, type: !11)
!1239 = !DILocalVariable(name: "key1", arg: 2, scope: !1236, file: !3, line: 772, type: !63)
!1240 = !DILocalVariable(name: "key2", arg: 3, scope: !1236, file: !3, line: 773, type: !63)
!1241 = !DILocation(line: 0, scope: !1236)
!1242 = !DILocation(line: 777, column: 12, scope: !1236)
!1243 = !DILocation(line: 777, column: 31, scope: !1236)
!1244 = !DILocation(line: 777, column: 5, scope: !1236)
!1245 = distinct !DISubprogram(name: "_dictStringCopyHTKeyDestructor", scope: !3, file: !3, line: 780, type: !76, scopeLine: 781, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1246)
!1246 = !{!1247, !1248}
!1247 = !DILocalVariable(name: "privdata", arg: 1, scope: !1245, file: !3, line: 780, type: !11)
!1248 = !DILocalVariable(name: "key", arg: 2, scope: !1245, file: !3, line: 780, type: !11)
!1249 = !DILocation(line: 0, scope: !1245)
!1250 = !DILocation(line: 784, column: 5, scope: !1245)
!1251 = !DILocation(line: 785, column: 1, scope: !1245)
!1252 = distinct !DISubprogram(name: "_dictStringKeyValCopyHTValDestructor", scope: !3, file: !3, line: 787, type: !76, scopeLine: 788, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1253)
!1253 = !{!1254, !1255}
!1254 = !DILocalVariable(name: "privdata", arg: 1, scope: !1252, file: !3, line: 787, type: !11)
!1255 = !DILocalVariable(name: "val", arg: 2, scope: !1252, file: !3, line: 787, type: !11)
!1256 = !DILocation(line: 0, scope: !1252)
!1257 = !DILocation(line: 791, column: 5, scope: !1252)
!1258 = !DILocation(line: 792, column: 1, scope: !1252)
