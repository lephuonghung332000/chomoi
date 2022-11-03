import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, UserModel>> fetchUser({
    String? userId,
  });
}
