import 'dart:developer';

import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {

  UserLocalDataSource user_local_datasource = UserLocalDataSource();
  UserRemoteDatatasource user_remote_datasource = UserRemoteDatatasource();


  UserRepository() {
    logInfo("Starting UserRepository");
  }

  Future<bool> getUser() async {
    try {
    user_local_datasource.addUser(await user_remote_datasource.getUser());
    return true;
    } catch (e) {
      log('Error adding user.');
      return false;
    }
  }

  Future<List<RandomUser>> getAllUsers() async => 
    await user_local_datasource.getAllUsers();

  Future<void> deleteUser(id) async => user_local_datasource.deleteUser(id);

  Future<void> deleteAll() async =>  user_local_datasource.deleteAll();

  Future<void> updateUser(user) async => user_local_datasource.updateUser(user);
}
