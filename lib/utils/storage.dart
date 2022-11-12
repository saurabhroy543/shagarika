import 'package:get_storage/get_storage.dart';
import 'package:shagarika/utils/storage_keys.dart';

import 'Network_requester.dart';

class Storage {
  Storage._privateConstructor();

  static GetStorage? box;

  static Future<bool> init() async {
    final result = await GetStorage.init();
    box = GetStorage();
    return result;
  }

  // Api key
  static String? get token => box?.read(StorageKeys.token);

  static set token(String? value) => box?.write(StorageKeys.token, value);

  // User ID
  static String? get userId => box?.read(StorageKeys.userId);

  static set userId(String? value) => box?.write(StorageKeys.userId, value);

  // User name
  static String? get username => box?.read(StorageKeys.username);

  static set username(String? value) => box?.write(StorageKeys.username, value);

  // Domain name
  static String get domainname => box?.read(StorageKeys.domainName);

  static set domainname(String value) =>
      box?.write(StorageKeys.domainName, value);

  // is Employee
  static bool? get isEmployee => box?.read(StorageKeys.isEmployee);

  static set isEmployee(bool? value) =>
      box?.write(StorageKeys.isEmployee, value);

  // is Approval
  static bool? get isApproval => box?.read(StorageKeys.isApproval);

  static set isApproval(bool? value) =>
      box?.write(StorageKeys.isApproval, value);

  // is Super user
  static bool? get isSuperuser => box?.read(StorageKeys.isSuperuser);

  static set isSuperuser(bool? value) =>
      box?.write(StorageKeys.isSuperuser, value);

  static clear() {
    box?.remove(StorageKeys.isSuperuser);
    box?.remove(StorageKeys.domainName);
    box?.remove(StorageKeys.isEmployee);
    box?.remove(StorageKeys.isApproval);
    box?.remove(StorageKeys.token);
    box?.remove(StorageKeys.userId);
    box?.remove(StorageKeys.username);
    box?.erase();
    NetworkRequester.shared.prepareRequest();
  }
}
