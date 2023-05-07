
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:password_manager/src/features/infra/handler/storage_response_status.dart';
import 'package:password_manager/src/features/infra/repositories/storage_repository.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState>
     {
  StorageRepository? storageRepository;
  // StreamController controller = StreamController();

  StorageBloc() : super(StorageStateInitial()) {
    // readAllStream = controller.stream;
    on<StorageEventInitial>((event, emit) {
      emit(StorageStateInitial());
      storageRepository = StorageRepository(
          dbName: event.dbName, dbkey: event.dbkey, dbLimit: event.dbLimit);
    });

    on<StorageEventRead>((event, emit) async {
      var response = await storageRepository?.readFromStorage(event.key);
      if (response != null) {
        response.fold((exception) {
          if (exception == StorageResponseStatus.notFound) {
            add(const StorageEventNotFound());
          } else {
            add(StorageEventFailure(exception));
          }
        }, (value) {
          emit(StorageStateRead(value));
        });
      }
    });

    on<StorageEventWrite>((event, emit) async {
      var response = await storageRepository?.writeToStorage(event.data);
      if (response != null) {
        response.fold((exception) {
          if (exception == StorageResponseStatus.alreadyRegistered) {
            add(StorageEventAlreadyRegistered());
          } else {
            add(StorageEventFailure(exception));
          }
        }, (value) {
          emit(StorageStateWrite());
        });
      }
    });

    on<StorageEventPut>((event, emit) async {
      var response =
          await storageRepository?.putToStorage(event.key, event.data);
      if (response != null) {
        response.fold((exception) {
          add(StorageEventFailure(exception));
        }, (value) {
          emit(StorageStatePut());
        });
      }
    });

    on<StorageEventDelete>((event, emit) async {
      var response = await storageRepository?.deleteFromStorage(event.key);
      if (response != null) {
        response.fold((exception) {
          add(StorageEventFailure(exception));
        }, (value) {
          emit(StorageStateDelete());
        });
      }
    });

    on<StorageEventReadAll>((event, emit) async {
      var response = await storageRepository?.readAllFromStorage();
      if (response != null) {
        response.fold((exception) {
          if (exception == StorageResponseStatus.emptyList) {
            add(StorageEventEmptyList());
          } else {
            add(StorageEventFailure(exception));
          }
        }, (value) {
          emit(StorageStateReadAll(value));
        });
      }
    });

    on<StorageEventSearch>((event, emit) async {
      var response = await storageRepository?.searchFromStorage(event.value);
      if (response != null) {
        response.fold((exception) {
          if (exception == StorageResponseStatus.notFound) {
            add(StorageEventNotFound(event.value));
          } else {
            add(StorageEventFailure(exception));
          }
        }, (value) {
          emit(const StorageStateFound()); // to rebuild the "same" state
          emit(StorageStateSearch(value));
        });
      }
    });

    on<StorageEventAlreadyRegistered>(
        (event, emit) => emit(StorageStateAlreadyRegistered()));

    on<StorageEventNotFound>(
        (event, emit) => emit(StorageStateNotFound(event.value)));

    on<StorageEventEmptyList>((event, emit) => emit(StorageStateEmptyList()));

    on<StorageEventFailure>(
        (event, emit) => emit(StorageStateFailure(event.error)));
  }
}
