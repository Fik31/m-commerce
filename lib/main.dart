import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> catalog = [
      {
        'name': 'Baju',
        'image': 'https://s3.belanjapasti.com/media/image/baju-pria-akhir-kaos-tomorrow-is-another-day-472174.jpg',
        'description': 'Baju ini terbuat dari bahan katun berkualitas tinggi yang nyaman dipakai sehari-hari.',
        'quantity': 10,
        'price': 30000,
      },
      {
        'name': 'Celana',
        'image': 'https://hikenrun.com/cdn/shop/products/A1_8456cb28-c3d2-425d-a4a9-5487d0307369.png?v=1677666734',
        'description': 'Celana ini cocok untuk berbagai acara formal maupun kasual dengan desain yang modern.',
        'quantity': 10,
        'price': 20000,
      },
      {
        'name': 'Sepatu',
        'image': 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//99/MTA-69434217/kurota_shop_kurota_shop_sepatu_sneakers_pria_sepatu_kets_kuliah_kerja_jalan_berkualitas_warna_hitam_series_l3500_full03_itm7fvfv.jpg',
        'description': 'Sepatu ini memiliki desain ergonomis yang nyaman untuk digunakan sepanjang hari.',
        'quantity': 10,
        'price': 50000,
      },
      {
        'name': 'Jaket',
        'image': 'https://id-test-11.slatic.net/p/b9f04df8c86bed793ca3d31d6777c17b.jpg',
        'description': 'Jaket ini terbuat dari bahan tahan air yang ideal untuk cuaca dingin dan hujan.',
        'quantity': 10,
        'price': 80000,
      },
    ];

    return MaterialApp(
      title: 'Shopping App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(catalog: catalog),
        '/home': (context) => HomePage(catalog: catalog),
      },
    );
  }
}
