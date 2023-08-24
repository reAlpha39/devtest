import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:devtest/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateUserCubit>(),
      child: Builder(
        builder: (context) => BlocListener<CreateUserCubit, CreateUserState>(
          listener: (context, state) => state.maybeWhen(
            error: (e) {
              LoadingOverlay.hide();
              ErrorHelper.handleError(e);
              return;
            },
            loading: () => LoadingOverlay.show(),
            success: () {
              LoadingOverlay.hide();
              ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
                const SnackBar(
                  content: Text('Berhasil menambahkan user baru'),
                ),
              );
              return Navigator.of(context).pop(true);
            },
            orElse: () => null,
          ),
          child: KeyboardDismissOnTap(
            child: Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                title: const Text('Add User Page'),
              ),
              body: const _AddUserPageBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddUserPageBody extends StatelessWidget {
  const _AddUserPageBody();

  @override
  Widget build(BuildContext context) {
    final addUserCubit = context.read<CreateUserCubit>();
    return Form(
      key: addUserCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addUserCubit.nameController,
                      textInputType: TextInputType.name,
                      hint: 'Nama',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        if (val.length < 3) {
                          return 'Nama minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addUserCubit.addressController,
                      textInputType: TextInputType.text,
                      hint: 'Alamat',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        if (val.length < 3) {
                          return 'Alamat minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addUserCubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      hint: 'Email',
                      validator: (val) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val ?? '');
                        if (!emailValid) {
                          return 'Email tidak valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addUserCubit.phoneController,
                      textInputType: TextInputType.phone,
                      hint: 'No. Telepon',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'No. Telepon tidak boleh kosong';
                        }
                        if (val.length < 3) {
                          return 'No. Telepon minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: addUserCubit.cityController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      suffixIcon: const Icon(Icons.arrow_right),
                      onTap: () async {
                        final result = await FilterBottomSheet.open(
                          context,
                          filter: addUserCubit.cityController.text,
                        );
                        if (result != null) {
                          addUserCubit.cityController.text =
                              result['name'] == 'All' ? '' : result['name'];
                        }
                      },
                      hint: 'Kota',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Kota tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton(
                  onPressed: () => addUserCubit.createUser(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text('Simpan'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
