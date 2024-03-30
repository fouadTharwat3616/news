import 'package:news/sources/data/models/source.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  final List<Source> sources;

  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  final String message;

  GetSourcesError(this.message);
}
