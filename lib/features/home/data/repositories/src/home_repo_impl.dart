import 'package:dartz/dartz.dart';
import 'package:devtest/features/features.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepoImpl(this._homeDataSource);

  @override
  Future<Either<dynamic, List<UserModel>>> getUsers() async {
    try {
      final response = await _homeDataSource.getUsers();
      return Right(response!);
    } catch (e) {
      return Left(e);
    }
  }
}