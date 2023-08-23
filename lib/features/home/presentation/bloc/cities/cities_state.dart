part of 'cities_cubit.dart';

@freezed
class CitiesState with _$CitiesState {
  const factory CitiesState.initial() = _Initial;
  const factory CitiesState.loading() = _Loading;
  const factory CitiesState.loaded(List<CityModel> cities) = _Loaded;
  const factory CitiesState.error(String message) = _Error;
}
