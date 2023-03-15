// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountInfoDetailsAdapter extends TypeAdapter<AccountInfoDetails> {
  @override
  final int typeId = 4;

  @override
  AccountInfoDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountInfoDetails(
      accountId: fields[0] as String,
      accountName: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountInfoDetails obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.accountName)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountInfoDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
