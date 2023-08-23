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

  get users => _users;

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
}
