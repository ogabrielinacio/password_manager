part of 'storage_bloc.dart';

abstract class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

class StorageStateInitial extends StorageState {}

class StorageStateWrite extends StorageState {}

class StorageStateRead extends StorageState {
  final dynamic data;
  const StorageStateRead(this.data);
}

class StorageStatePut extends StorageState {}

class StorageStateDelete extends StorageState {}

class StorageStateReadAll extends StorageState {
  final List data;
  const StorageStateReadAll(this.data);
}

class StorageStateSearch extends StorageState {
  final List data;
  const StorageStateSearch(this.data);
}

class StorageStateFound extends StorageState {
  const StorageStateFound();
}

class StorageStateAlreadyRegistered extends StorageState {}

class StorageStateNotFound extends StorageState {
  final String? value;
  const StorageStateNotFound(this.value);
}

class StorageStateEmptyList extends StorageState {}

class StorageStateFailure extends StorageState {
  final StorageResponseStatus error;
  const StorageStateFailure(this.error);
}
