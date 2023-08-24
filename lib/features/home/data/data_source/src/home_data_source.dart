part of 'home_data_source_impl.dart';

abstract class HomeDataSource {
  Future<List<UserModel>?> getUsers();
  Future<List<CityModel>?> getCities();
  Future<bool?> createUser(UserModel user);
}
