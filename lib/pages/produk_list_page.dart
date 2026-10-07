import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../widget_basic/product_card.dart';
import 'produk_detail_page.dart';

class ProdukListPage extends StatelessWidget {
  final List<Produk> daftarProduk;
  final VoidCallback onTambahKeranjang;
  final void Function(Produk) onHapus;

  const ProdukListPage({
    super.key,
    required this.daftarProduk,
    required this.onTambahKeranjang,
    required this.onHapus,
  });

  // Navigasi + ambil data balik (Bagian 4.2)
  Future<void> _bukaDetail(BuildContext context, Produk produk) async {
    final hasil = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ProdukDetailPage(produk: produk),
      ),
    );

    if (hasil == true) {
      onTambahKeranjang();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produk.nama} ditambahkan ke keranjang')),
      );
    }
  }

  // AlertDialog konfirmasi hapus (Bagian 5)
  Future<void> _konfirmasiHapus(BuildContext context, Produk produk) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('"${produk.nama}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin == true) {
      onHapus(produk);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produk.nama} telah dihapus')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (daftarProduk.isEmpty) {
      return const Center(child: Text('Belum ada produk'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: daftarProduk.length,
      itemBuilder: (context, index) {
        final produk = daftarProduk[index];
        return ProductCard(
          produk: produk,
          onTap: () => _bukaDetail(context, produk),
          onDelete: () => _konfirmasiHapus(context, produk),
        );
      },
    );
  }
}