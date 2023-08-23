import 'package:dartz/dartz.dart';
import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUsersUsecase implements UseCase<List<UserModel>, NoParams> {
  final HomeRepo _homeRepo;

  GetUsersUsecase(this._homeRepo);

  @override
  Future<Either<dynamic, List<UserModel>>> call(NoParams params) async {
    return await _homeRepo.getUsers();
  }
}
