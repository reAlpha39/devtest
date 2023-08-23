import 'package:dartz/dartz.dart';
import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCitiesUsecase implements UseCase<List<CityModel>, NoParams> {
  final HomeRepo _homeRepo;

  GetCitiesUsecase(this._homeRepo);

  @override
  Future<Either<dynamic, List<CityModel>>> call(NoParams params) async {
    return await _homeRepo.getCities();
  }
}
