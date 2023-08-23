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
  UserSortBy _sortBy = UserSortBy.nameAZ;

  List<UserModel>? get users => _users;
  String get filterCity => _filterCity;
  UserSortBy get sortBy => _sortBy;

  filter(String value) {
    _filterCity = value;
    _searchUsers();
  }

  query(String value) {
    _query = value;
    _searchUsers();
  }

  sort(UserSortBy value) {
    _sortBy = value;
    _searchUsers();
  }

  Future<void> getUsers() async {
    emit(const UserState.loading());
    final response = await _getUsersUsecase(NoParams());
    response.fold(
      (l) => emit(UserState.error(l.toString())),
      (r) {
        _users = r;
        _sortByName();
        emit(UserState.loaded(_filteredUsers!));
      },
    );
  }

  void _searchUsers() {
    if (_users == null) {
      return;
    }

    emit(const UserState.loading());

    _filteredUsers ??= _users;

    final filteredUsers = _filteredUsers!
        .where(
          (user) =>
              (_query.isEmpty
                  ? true
                  : (user.name ?? '')
                      .toLowerCase()
                      .contains(_query.toLowerCase())) &&
              (_filterCity.isEmpty
                  ? true
                  : (user.city ?? '')
                      .toLowerCase()
                      .contains(_filterCity.toLowerCase())),
        )
        .toList();
    _filteredUsers = filteredUsers;

    // sort after filtered
    _sortByName();

    emit(UserState.loaded(filteredUsers));
  }

  void _sortByName() {
    if (_users == null) {
      return;
    }

    _filteredUsers ??= _users;

    List<UserModel>? sortedUsers;

    if (_sortBy == UserSortBy.nameAZ) {
      sortedUsers = _filteredUsers!
        ..sort(
          (a, b) => (a.name ?? '')
              .toLowerCase()
              .compareTo((b.name ?? '').toLowerCase()),
        );
    } else {
      sortedUsers = _filteredUsers!
        ..sort(
          (a, b) => (b.name ?? '')
              .toLowerCase()
              .compareTo((a.name ?? '').toLowerCase()),
        );
    }

    _filteredUsers = sortedUsers;
  }
}

enum UserSortBy {
  nameAZ,
  nameZA,
}
