# devtest

## Build dari source

### Instalasi

- Tambahkan [Flutter](https://flutter.dev/docs/get-started/install "Flutter")
- Buka folder proyek ini dengan Terminal/CMD
- Pastikan tidak ada sisa cache/build dengan menjalankan `flutter clean` di Terminal
- Jalankan di Terminal `flutter pub get`
- Jalankan di Terminal `dart run build_runner build --delete-conflicting-outputs`

### Menjalankan Aplikasi

- Buka Android Emulator
- Jalankan `flutter run`

### Membuat APK

- Jalankan `flutter build apk` atau Jalankan `flutter build apk --split-per-abi` untuk split APK
- APK akan disimpan di lokasi ini: `[project]/build/app/outputs/flutter-apk/`
- Kita juga dapat membuat appbundle (.aab) dengan menjalankan perintah ini: `flutter build appbundle`

Untuk informasi lebih lanjut, lihat [dokumentasi resmi](https://flutter.dev/docs "documentation")

## Cara Penggunaan

1. Instal file APK
2. Aplikasi ini memiliki fitur pencarian menggunakan `app_bar_with_search_switch`, yang memungkinkan pengguna untuk mencari Users dengan lebih mudah tanpa harus membuka halaman baru.
3. Pada halaman awal juga terdapat `floating_action_bar`, yang terdapat pada kanan bawah tampilan. Berfungsi sebagai membuka halaman baru untuk membuat user baru.

## Teknologi yang digunakan

Aplikasi ini dikembangkan menggunakan Flutter. Beberapa library dan package yang digunakan dalam proyek ini meliputi:

* `app_bar_with_search_switch`: Digunakan untuk membuat opsi pencarian.
* `dio`: Library untuk membuat HTTP requests.
* `flutter_bloc`: Sebagai state management.A
* `flutter_dotenv`: Untuk mengelola environment variables.
* `get_it`: Sebagai service locator.
* `go_router`: Library untuk routing dalam aplikasi.
* `injectable`: Digunakan untuk dependency injection.

## Mengapa Tampilan/Interaksi Seperti Itu

Berikut adalah penjelasan mengapa tampilan dan interaksi dalam kode halaman utama aplikasi tersebut seperti itu:

1. Pencarian pada AppBar. Pencarian berada di AppBar agar pengguna dapat dengan mudah mengakses.
2. Filter kota dan Urutan nama. Kedua nya berada dibawah AppBar dan tidak akan ikut ter-scroll agar pengguna dapat mengaksesnya kapan saja.
3. Filter dan Urutan ketika di Klik akan membuka Bottom Sheets untuk memilih filter serta urutan yang diinginkan.
4. User Card hanya menampilkan Nama dan Kota karena meminimalkan informasi. User Card akan menampilkan dialog detail User ketika card tersebut di klik.
5. Bagian bawah kanan tampilan terdapat button dengan icon tambah, berfungsi untuk membuka tampilan baru untuk membuat user baru.

Berikut adalah penjelasan mengapa tampilan dan interaksi dalam kode halaman utama aplikasi tersebut seperti itu:

1. Pada bagian text field terdapat validator, untuk memvalidasi text yang di input.
2. Ketika tombol submit di klik dan semua field terisi, akan muncul loading overlay yang memberi tahu user data sedang di proses. Setelah proses selesai akan secara otomatis akan menutup halaman tambah user dan menampilkan snackbar dengan status data berhasil di input.
