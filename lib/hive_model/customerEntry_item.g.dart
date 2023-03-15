// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customerEntry_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerEntryDetailsAdapter extends TypeAdapter<CustomerEntryDetails> {
  @override
  final int typeId = 3;

  @override
  CustomerEntryDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerEntryDetails(
      customerNameCE: fields[0] as String,
      ownerName: fields[1] as String,
      addressCE: fields[2] as String,
      mobileCE: fields[3] as int,
      officePhone: fields[4] as int,
      previousDue: fields[5] as int,
      CreditLimit: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerEntryDetails obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.customerNameCE)
      ..writeByte(1)
      ..write(obj.ownerName)
      ..writeByte(2)
      ..write(obj.addressCE)
      ..writeByte(3)
      ..write(obj.mobileCE)
      ..writeByte(4)
      ..write(obj.officePhone)
      ..writeByte(5)
      ..write(obj.previousDue)
      ..writeByte(6)
      ..write(obj.CreditLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerEntryDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
