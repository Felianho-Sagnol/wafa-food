import 'package:get_storage/get_storage.dart';

class UserStorage {
  final storage = GetStorage();

  Future<void> storeUserInStorage(dynamic user) async {
    storage.write('user', user);
  }

  Future<dynamic> getUserFromeStorage() async {
    return storage.read('user');
  }

  Future<void> removeUserInStorage() async {
    storage.remove("user");
  }

  Future<void> storeUserIdInStorage(int id) async {
    storage.write('userId', id);
  }

  Future<dynamic> getUserIdFromeStorage() async {
    return storage.read('userId');
  }

  Future<void> removeUserIdInStorage() async {
    storage.remove("userId");
  }
}
