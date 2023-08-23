import 'package:devtest/features/features.dart';
import 'package:devtest/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBottomSheet {
  static Future open(BuildContext context, {String? filter}) async =>
      await showModalBottomSheet(
        context: context,
        builder: (context) => _FilterBottomSheet(filter: filter),
      );
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet({this.filter});

  final String? filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CitiesCubit>()..getCities(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Pilih Kota',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (cities) => Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return ListTile(
                      title: Text(city.name ?? '-'),
                      selected: city.name == filter,
                      trailing: city.name == filter
                          ? const Icon(Icons.check)
                          : null,
                      onTap: () {
                        Navigator.pop(
                          context,
                          {
                            'id': city.id,
                            'name': city.name,
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
