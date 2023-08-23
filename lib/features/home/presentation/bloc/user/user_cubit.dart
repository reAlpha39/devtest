import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUsersUsecase) : super(const UserState.initial());

  final GetUsersUsecase _getUsersUsecase;

  List<UserModel>? _users;
  List<UserModel>? _filteredUsers;

  String _filterCity = '';
  String _query = '';

  List<UserModel>? get users => _users;
  String get filterCity => _filterCity;

  filter(String value) {
    _filterCity = value;
    searchUsers();
  }

  query(String value) {
    _query = value;
    searchUsers();
  }

  Future<void> getUsers() async {
    emit(const UserState.loading());
    final response = await _getUsersUsecase(NoParams());
    response.fold(
      (l) => emit(UserState.error(l.toString())),
      (r) {
        _users = r;
        emit(UserState.loaded(r));
      },
    );
  }

  void searchUsers() {
    if (_users == null) {
      return;
    }

    emit(const UserState.loading());

    _filteredUsers ??= _users;

    final filteredUsers = _users!
        .where(
          (user) =>
              (_query.isEmpty
                  ? true
                  : user.name!.toLowerCase().contains(_query.toLowerCase())) &&
              (_filterCity.isEmpty
                  ? true
                  : user.city!
                      .toLowerCase()
                      .contains(_filterCity.toLowerCase())),
        )
        .toList();
    _filteredUsers = filteredUsers;
    emit(UserState.loaded(filteredUsers));
  }
}
