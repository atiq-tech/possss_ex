import 'package:hive/hive.dart';

part 'account_info.g.dart';

@HiveType(typeId: 4)
class AccountInfoDetails {
  @HiveField(0)
  String accountId;

  @HiveField(1)
  String accountName;

  @HiveField(2)
  String description;

  AccountInfoDetails(
      {required this.accountId,
      required this.accountName,
      required this.description,
    });
}