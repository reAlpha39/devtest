import 'package:devtest/features/features.dart';
import 'package:devtest/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar User'),
        ),
        body: const _HomePageBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        )
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        loaded: (_) => ListView.builder(
          itemCount: cubit.users.length,
          itemBuilder: (context, index) => UserCard(
            user: cubit.users[index],
          ),
        ),
      ),
    );
  }
}


