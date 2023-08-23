part of 'home_data_source_impl.dart';

abstract class HomeDataSource {
  Future<List<UserModel>?> getUsers();
}