// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'service.dart';

// **************************************************************************
// Generator: WorkerGenerator 9.3.0 (Squadron 7.4.3)
// **************************************************************************

// dart format width=80
/// Command ids used in operations map
const int _$buildBindingsCodeId = 1;
const int _$buildSubsetBytesId = 2;

/// WorkerService operations for PipelineService
extension on PipelineService {
  OperationsMap _$getOperations() => OperationsMap({
    _$buildBindingsCodeId: ($req) async {
      final String $res;
      try {
        final $dsr = _$Deser(contextAware: false);
        $res = await buildBindingsCode(
          $dsr.$0($req.args[0]),
          className: $dsr.$1($req.args[1]),
          fontFamily: $dsr.$2($req.args[2]),
          fontPackage: $dsr.$2($req.args[3]),
          forceTreeShakeIconGlyph: $dsr.$4($req.args[4]),
        );
      } finally {}
      return $res;
    },
    _$buildSubsetBytesId: ($req) async {
      final Uint8List $res;
      try {
        final $dsr = _$Deser(contextAware: false);
        $res = await buildSubsetBytes(
          $dsr.$0($req.args[0]),
          variableAxisConstraints: $dsr.$7($req.args[1]),
          forceSubset: $dsr.$8($req.args[2]),
          subsetFormat: $dsr.$11($req.args[3]),
        );
      } finally {}
      return $res;
    },
  });
}

/// Invoker for PipelineService, implements the public interface to invoke the
/// remote service.
base mixin _$PipelineService$Invoker on Invoker implements PipelineService {
  @override
  Future<String> buildBindingsCode(
    Uint8List inputBytes, {
    required String className,
    String? fontFamily,
    String? fontPackage,
    IconGlyph? forceTreeShakeIconGlyph,
  }) async {
    final dynamic $res = await send(
      _$buildBindingsCodeId,
      args: [
        inputBytes,
        className,
        fontFamily,
        fontPackage,
        forceTreeShakeIconGlyph,
      ],
    );
    try {
      final $dsr = _$Deser(contextAware: false);
      return $dsr.$1($res);
    } finally {}
  }

  @override
  Future<Uint8List> buildSubsetBytes(
    Uint8List inputBytes, {
    Map<VariableAxisTag, VariableAxisConstraint> variableAxisConstraints =
        const {},
    bool forceSubset = false,
    SubsetFormat? subsetFormat,
  }) async {
    final dynamic $res;
    try {
      final $sr = _$Ser(contextAware: false);
      $res = await send(
        _$buildSubsetBytesId,
        args: [
          inputBytes,
          $sr.$1(variableAxisConstraints),
          forceSubset,
          $sr.$3(subsetFormat),
        ],
      );
    } finally {}
    try {
      final $dsr = _$Deser(contextAware: false);
      return $dsr.$0($res);
    } finally {}
  }
}

/// Facade for PipelineService, implements other details of the service unrelated to
/// invoking the remote service.
base mixin _$PipelineService$Facade implements PipelineService {}

/// WorkerClient for PipelineService
final class $PipelineService$Client extends WorkerClient
    with _$PipelineService$Invoker, _$PipelineService$Facade
    implements PipelineService {
  $PipelineService$Client(PlatformChannel channelInfo)
    : super(Channel.deserialize(channelInfo)!);
}

/// Local worker extension for PipelineService
extension $PipelineServiceLocalWorkerExt on PipelineService {
  // Get a fresh local worker instance.
  LocalWorker<PipelineService> getLocalWorker([
    ExceptionManager? exceptionManager,
  ]) => LocalWorker.create(this, _$getOperations(), exceptionManager);
}

/// WorkerService class for PipelineService
base class _$PipelineService$WorkerService extends PipelineService
    implements WorkerService {
  _$PipelineService$WorkerService() : super();

  @override
  OperationsMap get operations => _$getOperations();
}

/// Service initializer for PipelineService
WorkerService $PipelineServiceInitializer(WorkerRequest $req) =>
    _$PipelineService$WorkerService();

/// Worker for PipelineService
base class PipelineServiceWorker extends Worker
    with _$PipelineService$Invoker, _$PipelineService$Facade
    implements PipelineService {
  PipelineServiceWorker({
    PlatformThreadHook? threadHook,
    ExceptionManager? exceptionManager,
  }) : super(
         $PipelineServiceActivator(Squadron.platformType),
         threadHook: threadHook,
         exceptionManager: exceptionManager,
       );

  PipelineServiceWorker.vm({
    PlatformThreadHook? threadHook,
    ExceptionManager? exceptionManager,
  }) : super(
         $PipelineServiceActivator(SquadronPlatformType.vm),
         threadHook: threadHook,
         exceptionManager: exceptionManager,
       );

  @override
  List? getStartArgs() => null;
}

/// Worker pool for PipelineService
base class PipelineServiceWorkerPool extends WorkerPool<PipelineServiceWorker>
    with _$PipelineService$Facade
    implements PipelineService {
  PipelineServiceWorkerPool({
    PlatformThreadHook? threadHook,
    ExceptionManager? exceptionManager,
    ConcurrencySettings? concurrencySettings,
  }) : super(
         (ExceptionManager exceptionManager) => PipelineServiceWorker(
           threadHook: threadHook,
           exceptionManager: exceptionManager,
         ),
         concurrencySettings: concurrencySettings,
         exceptionManager: exceptionManager,
       );

  PipelineServiceWorkerPool.vm({
    PlatformThreadHook? threadHook,
    ExceptionManager? exceptionManager,
    ConcurrencySettings? concurrencySettings,
  }) : super(
         (ExceptionManager exceptionManager) => PipelineServiceWorker.vm(
           threadHook: threadHook,
           exceptionManager: exceptionManager,
         ),
         concurrencySettings: concurrencySettings,
         exceptionManager: exceptionManager,
       );

  @override
  Future<String> buildBindingsCode(
    Uint8List inputBytes, {
    required String className,
    String? fontFamily,
    String? fontPackage,
    IconGlyph? forceTreeShakeIconGlyph,
  }) => execute(
    (w) => w.buildBindingsCode(
      inputBytes,
      className: className,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
      forceTreeShakeIconGlyph: forceTreeShakeIconGlyph,
    ),
  );

  @override
  Future<Uint8List> buildSubsetBytes(
    Uint8List inputBytes, {
    Map<VariableAxisTag, VariableAxisConstraint> variableAxisConstraints =
        const {},
    bool forceSubset = false,
    SubsetFormat? subsetFormat,
  }) => execute(
    (w) => w.buildSubsetBytes(
      inputBytes,
      variableAxisConstraints: variableAxisConstraints,
      forceSubset: forceSubset,
      subsetFormat: subsetFormat,
    ),
  );
}

final class _$Deser extends MarshalingContext {
  _$Deser({super.contextAware});
  late final $0 = value<Uint8List>();
  late final $1 = value<String>();
  late final $2 = Converter.allowNull($1);
  late final $3 = value<IconGlyph>();
  late final $4 = Converter.allowNull($3);
  late final $5 = (($) => VariableAxisTag.fromJson($));
  late final $6 = value<VariableAxisConstraint>();
  late final $7 = map<VariableAxisTag, VariableAxisConstraint>(
    kcast: $5,
    vcast: $6,
  );
  late final $8 = value<bool>();
  late final $9 = value<int>();
  late final $10 = (($) => SubsetFormat.values[$9($)]);
  late final $11 = Converter.allowNull($10);
}

final class _$Ser extends MarshalingContext {
  _$Ser({super.contextAware});
  late final $0 = (($) => ($ as VariableAxisTag).toJson());
  late final $1 = map(kcast: $0);
  late final $2 = (($) => ($ as SubsetFormat).index);
  late final $3 = Converter.allowNull($2);
}
