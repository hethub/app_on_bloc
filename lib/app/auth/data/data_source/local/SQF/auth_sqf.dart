import 'package:local_storage/app/auth/data/models/user_model.dart';
import '../../../../../../database/database.dart';

/// Write sql Query
class AuthSqf {
  final user = User();

  Future<({bool isCreted, String message, int status})> createUser(
      UserModel userModel) async {
    try {
      user.email = userModel.email;
      user.password = userModel.password;
      user.isSignIN = userModel.isSignIN;
      await user.save();
      return (status: 201, message: 'Successfully Created!', isCreted: true);
    } catch (e) {
      return (status: 500, message: e.toString(), isCreted: false);
    }
  }

  Future<bool> signIn(UserModel userModel) async {
    try {
      final isSignIn = await user.select().id.equals(userModel.userId).toList();
      isSignIn[0].isSignIN = true;
      await isSignIn.first.save();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOut(UserModel userModel) async {
    try {
      final signOutUser =
          await user.select().id.equals(userModel.userId).toList();
      signOutUser[0].isSignIN = false;
      await signOutUser.first.save();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<UserModel?> getUserProfile() async {
    // final profile = await user.select().id.equals(userId).toList();
    final profile = await user.select().toList();

    if (profile.isEmpty) {
      return null;
    }
    return UserModel.fromUser(profile[0]);
  }
}
