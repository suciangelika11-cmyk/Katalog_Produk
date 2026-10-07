import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final int harga;
  final IconData ikon;

  const Produk({
    required this.nama,
    required this.harga,
    required this.ikon,
  });

  // Format angka: 350000 -> "Rp 350.000"
  String get hargaRp {
    final teks = harga.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (m) => '.',
        );
    return 'Rp $teks';
  }
}