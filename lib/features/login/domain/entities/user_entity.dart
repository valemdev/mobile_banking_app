import 'package:mobile_banking_app/features/login/data/models/user_model.dart';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromModel(UserModel userModel) {
    return User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
    );
  }
}
