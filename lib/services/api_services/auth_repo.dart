import 'package:bus_eka/data/fake_data/fake_data.dart';
import 'package:bus_eka/data/models/user_model.dart';
import 'package:bus_eka/services/local_services/auth_credentials.dart';

class AuthRepo {
  static Future<List<UserModel>> getUsers() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      List<UserModel> users = [];
      for (Map<String, dynamic> map in FakeData.users) {
        UserModel userModel = UserModel.fromMap(map);
        users.add(userModel);
      }
      return users;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserModel> getUserById({required String userId}) async {
    try {
      UserModel? user;
      List<UserModel> users = await getUsers();
      for (var userModel in users) {
        if (userModel.userId == userId) {
          user = userModel;
        }
      }
      if (user != null) {
        return user;
      } else {
        throw "user not available";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signUpUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        Future.delayed(const Duration(seconds: 1));
      } else {
        throw "some fields are empty";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserModel? userModel;
        List<UserModel> users = await getUsers();
        for (var user in users) {
          if (user.userEmail == email) {
            userModel = user;
          }
        }
        if (userModel != null) {
          AuthCredentials.addUser(userId: userModel.userId);
        } else {
          throw "wrong email or password";
        }
      } else {
        throw "some fields are empty";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
