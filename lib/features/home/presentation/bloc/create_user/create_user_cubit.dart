import 'package:devtest/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_user_state.dart';
part 'create_user_cubit.freezed.dart';

@injectable
class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this._createUserUsecase)
      : super(const CreateUserState.initial());

  final CreateUserUsecase _createUserUsecase;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    cityController.dispose();
    return super.close();
  }

  void createUser() async {
    bool isValid = formKey.currentState!.validate();

    if (!isValid) return;

    formKey.currentState!.save();

    emit(const CreateUserState.loading());
    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      phoneNumber: phoneController.text,
      city: cityController.text,
    );
    final result = await _createUserUsecase.call(user);
    result.fold(
      (l) => emit(CreateUserState.error(l.toString())),
      (r) => emit(const CreateUserState.success()),
    );
  }
}
