// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_key.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StorageKeyAdapter extends TypeAdapter<StorageKey> {
  @override
  final int typeId = 0;

  @override
  StorageKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StorageKey(
      storageKey: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StorageKey obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.storageKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StorageKeyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
