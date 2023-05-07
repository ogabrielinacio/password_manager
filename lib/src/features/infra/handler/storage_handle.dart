
import 'package:dartz/dartz.dart';
import 'package:password_manager/src/features/infra/handler/storage_response_status.dart';

class StorageHandler {
  Either<StorageResponseStatus, dynamic> handle(dynamic response) {
    if (response.runtimeType == StorageResponseStatus) {
      switch (response) {
        case StorageResponseStatus.dBCreated:
          return Right(response);
        case StorageResponseStatus.itemCreated:
          return Right(response);
        case StorageResponseStatus.itemUpdated:
          return Right(response);
        case StorageResponseStatus.itemDeleted:
          return Right(response);
        default:
          return Left(response);
      }
    } else {
      return Right(response);
    }
  }
}
