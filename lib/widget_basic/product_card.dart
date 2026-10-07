import 'package:flutter/material.dart';
import '../models/produk.dart';

/// Widget kustom (reusable) - Bagian 7
class ProductCard extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.produk,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Icon(produk.ikon, size: 56, color: Colors.indigo),
                  ),
                ),
                Text(
                  produk.nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  produk.hargaRp,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Positioned(
              right: -8,
              top: -8,
              child: IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}