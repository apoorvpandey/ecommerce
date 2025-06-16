import 'package:dartz/dartz.dart';

import '../../domain/auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../datasources/user_firestore_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource authDataSource;
  final UserFirestoreDatSource firestoreDataSource;

  AuthRepositoryImpl(this.authDataSource, this.firestoreDataSource);

  @override
  Future<Either<String, UserEntity>> signIn(
    String email,
    String password,
  ) async {
    try {
      final user = await authDataSource.signIn(email, password);
      if (user != null) {
        final userProfile = await firestoreDataSource.getUserById(user.uid);
        if (userProfile != null) {
          return Right(userProfile);
        } else {
          return Right(UserEntity(uid: user.uid, email: user.email ?? ''));
        }
      }
      return Left('User not found');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> signUp(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      final user = await authDataSource.signUp(email, password);
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          name: name,
          phone: phone,
        );
        await firestoreDataSource.createUser(userModel);
        return Right(userModel);
      }
      return Left('Signup failed');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> resetPassword(String email) async {
    try {
      await authDataSource.resetPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> getUserById(String uid) async {
    try {
      final userModel = await firestoreDataSource.getUserById(uid);
      if (userModel != null) {
        return Right(userModel);
      }
      return Left('User not found');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
