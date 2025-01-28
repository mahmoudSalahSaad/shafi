import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String phone;
  final String password;
  final String? name;
  final String? confirmPassword;
  final String? otp;
  final String? Token;
  final String? image;
  final String? email;
  final String? postalCode;
  const UserEntity({
    required this.phone,
    this.postalCode,
    this.email,
    this.image,
    required this.password,
    this.confirmPassword,
    this.name,
    this.otp,
    this.Token,
  });
  @override
  List<Object> get props => [
        phone,
        password,
      ];
}
