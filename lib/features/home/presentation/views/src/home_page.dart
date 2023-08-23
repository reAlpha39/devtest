import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
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
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBarWithSearchSwitch(
            onChanged: (text) => context.read<UserCubit>().query(text),
            title: (context) {
              final mainWidget = AppBarWithSearchSwitch.of(context)!;
              return Directionality(
                textDirection: Directionality.of(context),
                child: TextField(
                  keyboardType: mainWidget.keyboardType,
                  decoration: const InputDecoration(
                    hintText: 'Cari user...',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  onSubmitted: AppBarWithSearchSwitch.of(context)
                      ?.submitCallbackForTextField,
                  autofocus: true,
                  controller: mainWidget.textEditingController,
                ),
              );
            },
            appBarBuilder: (context) => AppBar(
              title: const Text('Daftar User'),
              scrolledUnderElevation: 0,
              actions: [
                const AppBarSearchButton(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                  ),
                )
              ],
            ),
          ),
          body: const _HomePageBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Column(
      children: [
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return PillButton(
                    text: userCubit.filterCity.isEmpty
                        ? 'Filter Kota'
                        : userCubit.filterCity,
                    isActive: userCubit.filterCity.isNotEmpty,
                    prefixIcon: Icons.filter_alt_outlined,
                    onPressed: () async {
                      final result = await FilterBottomSheet.open(
                        context,
                        filter: userCubit.filterCity,
                      );
                      if (result != null) {
                        userCubit.filter(result['name'] ?? '');
                      }
                    },
                  );
                },
              ),
              const SizedBox(width: 8),
              PillButton(
                text: userCubit.sortBy == UserSortBy.nameAZ
                    ? 'Nama (A-Z)'
                    : 'Nama (Z-A)',
                isActive: true,
                prefixIcon: Icons.sort,
                onPressed: () async {
                  final result = await SortBottomSheet.open(
                    context,
                    sortBy: userCubit.sortBy,
                  );

                  if (result != null) {
                    userCubit.sort(result as UserSortBy);
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              loaded: (user) => ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) => UserCard(
                  user: user[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
