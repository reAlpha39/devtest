import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

part 'home_data_source.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
  final ApiBaseHelper _helper;

  HomeDataSourceImpl(this._helper);

  @override
  Future<List<UserModel>?> getUsers() async {
    try {
      final response = await _helper.get(url: dotenv.env['USER'] ?? '');

      if (response == null) return null;

      return (response as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e, stacktrace) {
      await ErrorHelper.handleError(e, stack: stacktrace);
    }

    return null;
  }

  @override
  Future<List<CityModel>?> getCities() async {
    try {
      final response = await _helper.get(url: dotenv.env['CITY'] ?? '');

      if (response == null) return null;

      return (response as List).map((e) => CityModel.fromJson(e)).toList();
    } catch (e, stacktrace) {
      await ErrorHelper.handleError(e, stack: stacktrace);
    }

    return null;
  }

  @override
  Future<bool?> createUser(UserModel user) async {
    try {
      final response = await _helper.post(
        url: dotenv.env['USER'] ?? '',
        data: user.toJson(),
      );

      if (response == null) return null;

      return true;
    } catch (e, stacktrace) {
      ErrorHelper.handleError(e, stack: stacktrace);
    }

    return null;
  }
}
