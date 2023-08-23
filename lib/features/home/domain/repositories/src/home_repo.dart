import 'package:dartz/dartz.dart';
import 'package:devtest/features/features.dart';

abstract class HomeRepo {
  Future<Either<dynamic, List<UserModel>>> getUsers();
  Future<Either<dynamic, List<CityModel>>> getCities();
}