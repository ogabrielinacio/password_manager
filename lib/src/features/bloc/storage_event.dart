part of 'storage_bloc.dart';

abstract class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object> get props => [];
}

class StorageEventInitial extends StorageEvent {
  final String dbName;
  final String? dbkey;
  final int? dbLimit;
  const StorageEventInitial({required this.dbName, this.dbkey, this.dbLimit});
}

class StorageEventWrite extends StorageEvent {
  final dynamic data;
  const StorageEventWrite({required this.data});
}

class StorageEventRead extends StorageEvent {
  final dynamic key;
  const StorageEventRead({required this.key});
}

class StorageEventPut extends StorageEvent {
  final dynamic key;
  final dynamic data;
  const StorageEventPut({required this.data, required this.key});
}

class StorageEventDelete extends StorageEvent {
  final dynamic key;
  const StorageEventDelete({required this.key});
}

class StorageEventReadAll extends StorageEvent {}

class StorageEventSearch extends StorageEvent {
  final String value;
  const StorageEventSearch(this.value);
}

class StorageEventAlreadyRegistered extends StorageEvent {}

class StorageEventNotFound extends StorageEvent {
  final String? value;
  const StorageEventNotFound([this.value]);
}

class StorageEventEmptyList extends StorageEvent {}

class StorageEventFailure extends StorageEvent {
  final StorageResponseStatus error;
  const StorageEventFailure(this.error);
}
