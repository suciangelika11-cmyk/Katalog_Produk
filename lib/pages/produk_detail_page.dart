import 'package:flutter/material.dart';
import '../models/produk.dart';

class ProdukDetailPage extends StatelessWidget {
  final Produk produk;

  const ProdukDetailPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(produk.ikon, size: 140, color: Colors.indigo),
            ),
            const SizedBox(height: 24),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(produk.hargaRp, style: const TextStyle(fontSize: 18)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                // Kirim nilai balik ke halaman sebelumnya
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}