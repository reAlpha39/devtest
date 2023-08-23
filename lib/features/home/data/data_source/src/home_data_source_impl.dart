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
}
