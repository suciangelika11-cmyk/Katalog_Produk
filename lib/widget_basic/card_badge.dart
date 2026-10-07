import 'package:flutter/material.dart';

/// Ikon keranjang + badge angka (Stack + Positioned).
class CartBadge extends StatelessWidget {
  final int jumlah;
  const CartBadge({super.key, required this.jumlah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart, size: 28),
          if (jumlah > 0)
            Positioned(
              right: -8,
              top: -8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$jumlah',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
        ],
      ),
    );
  }
}