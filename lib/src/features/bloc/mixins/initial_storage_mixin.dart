import 'package:bloc/bloc.dart';
import 'package:password_manager/src/features/bloc/storage_bloc.dart';

mixin InitialPasswordStorageMixin on  Bloc<StorageEvent, StorageState> {}