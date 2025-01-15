import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String phone;
  final String password;
  final String? name;
  final String? confirmPassword;
  final String? otp;
  const UserEntity({
    required this.phone,
    required this.password,
    this.confirmPassword,
    this.name,
    this.otp,
  });
  @override
  List<Object> get props => [
        phone,
        password,
      ];
}
