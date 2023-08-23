import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cities_state.dart';
part 'cities_cubit.freezed.dart';

@injectable
class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this._getCitiesUsecase) : super(const CitiesState.initial());

  final GetCitiesUsecase _getCitiesUsecase;

  List<CityModel>? _citiesModel;

  List<CityModel>? get citiesModel => _citiesModel;

  Future<void> getCities() async {
    emit(const CitiesState.loading());
    final result = await _getCitiesUsecase(NoParams());
    result.fold(
      (l) => emit(CitiesState.error(l.toString())),
      (r) {
        _citiesModel = r;
        _sortByName();
        emit(CitiesState.loaded(_citiesModel!));
      },
    );
  }

  void _sortByName() {
    if (_citiesModel == null) {
      return;
    }

    _citiesModel!.sort((a, b) => a.name!.compareTo(b.name!));
  }
}
