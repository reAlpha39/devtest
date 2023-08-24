import 'package:dartz/dartz.dart';
import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateUserUsecase implements UseCase<bool, UserModel> {
  final HomeRepo _homeRepo;

  CreateUserUsecase(this._homeRepo);

  @override
  Future<Either<dynamic, bool>> call(UserModel params) async {
    return await _homeRepo.createUser(params);
  }
}
