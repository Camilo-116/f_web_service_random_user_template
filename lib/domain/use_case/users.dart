import 'package:get/get.dart';

import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';
import '../repositories/user_repository.dart';

class Users {

  UserRepository userRepo = Get.find();

  Future<void> addUser() async => userRepo.getUser();

  Future<List<RandomUser>> getAllUsers() async => userRepo.getAllUsers();

  Future<void> deleteUser(id) async => userRepo.deleteUser(id);
  
  Future<void> deleteAll() async =>  userRepo.deleteAll();

  Future<void> updateUser(user) async => userRepo.updateUser(user);

}
