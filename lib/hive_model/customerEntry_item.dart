import 'package:hive/hive.dart';

part 'customerEntry_item.g.dart';

@HiveType(typeId: 3)
class CustomerEntryDetails {
  @HiveField(0)
  String customerNameCE;

  @HiveField(1)
  String ownerName;

  @HiveField(2)
  String addressCE;

  @HiveField(3)
  int mobileCE;

  @HiveField(4)
  int officePhone;

  @HiveField(5)
  int previousDue;

  @HiveField(6)
  int CreditLimit;

  CustomerEntryDetails(
      {required this.customerNameCE,
      required this.ownerName,
      required this.addressCE,
      required this.mobileCE,
      required this.officePhone,
      required this.previousDue,
      required this.CreditLimit});
}