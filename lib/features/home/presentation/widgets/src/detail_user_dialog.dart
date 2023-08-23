import 'package:devtest/core/core.dart';
import 'package:devtest/features/features.dart';
import 'package:flutter/material.dart';

class DetailUserDialog {
  static void show(UserModel user) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (context) => Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      UserItem(
                        title: 'Nama',
                        value: user.name ?? '-',
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        titleSize: 12,
                        valueSize: 16,
                      ),
                      UserItem(
                        title: 'Kota',
                        value: user.city ?? '-',
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        titleSize: 12,
                        valueSize: 16,
                      ),
                      UserItem(
                        title: 'Alamat',
                        value: user.address ?? '-',
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        titleSize: 12,
                        valueSize: 16,
                      ),
                      UserItem(
                        title: 'Email',
                        value: user.email ?? '-',
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        titleSize: 12,
                        valueSize: 16,
                      ),
                      UserItem(
                        title: 'Nomor Telepon',
                        value: user.phoneNumber ?? '-',
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        titleSize: 12,
                        valueSize: 16,
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          child: const Text(
                            'Tutup',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
