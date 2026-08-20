// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// Generator: WorkerGenerator 9.3.1 (Squadron 7.4.3)
// **************************************************************************

import 'package:squadron/squadron.dart';

import 'service.dart';

void _start$PipelineService(WorkerRequest command) {
  /// VM entry point for PipelineService
  run($PipelineServiceInitializer, command);
}

EntryPoint $getPipelineServiceActivator(SquadronPlatformType platform) {
  if (platform.isVm) {
    return _start$PipelineService;
  } else {
    throw UnsupportedError('${platform.label} not supported.');
  }
}
