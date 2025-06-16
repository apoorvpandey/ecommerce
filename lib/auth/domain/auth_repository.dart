import 'package:dartz/dartz.dart';

import 'entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> signIn(String email, String password);

  Future<Either<String, UserEntity>> signUp(
    String email,
    String password,
    String name,
    String phone,
  );

  Future<Either<String, void>> resetPassword(String email);

  Future<Either<String, UserEntity>> getUserById(String uid);
}
