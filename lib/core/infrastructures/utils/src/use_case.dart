import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<dynamic, T>> call(Params params);
}

class NoParams {}
