import 'package:devtest/features/features.dart';
import 'package:flutter/material.dart';

class SortBottomSheet {
  static Future open(BuildContext context, {UserSortBy? sortBy}) async =>
      await showModalBottomSheet(
        context: context,
        builder: (context) => _SortBottomSheet(sortBy: sortBy),
      );
}

class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet({this.sortBy});

  final UserSortBy? sortBy;

  String convertEnum() {
    switch (sortBy) {
      case UserSortBy.nameAZ:
        return 'name_az';
      case UserSortBy.nameZA:
        return 'name_za';
      default:
        return 'name_az';
    }
  }

  UserSortBy convertString(String value) {
    switch (value) {
      case 'name_az':
        return UserSortBy.nameAZ;
      case 'name_za':
        return UserSortBy.nameZA;
      default:
        return UserSortBy.nameAZ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          'Urutkan',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        RadioListTile(
          title: const Text('Nama (A-Z)'),
          value: 'name_az',
          groupValue: convertEnum(),
          onChanged: (value) {
            Navigator.pop(context, convertString(value!));
          },
        ),
        RadioListTile(
          title: const Text('Nama (Z-A)'),
          value: 'name_za',
          groupValue: convertEnum(),
          onChanged: (value) {
            Navigator.pop(context, convertString(value!));
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
