import 'package:flutter/material.dart';
import '../models/produk.dart';
import 'produk_list_page.dart';
import 'profil_page.dart';
import 'tambah_produk_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Produk> _daftarProduk = [
    const Produk(nama: 'Kursi Minimalis', harga: 350000, ikon: Icons.chair),
    const Produk(nama: 'Meja Kerja Kayu', harga: 750000, ikon: Icons.table_restaurant),
    const Produk(nama: 'Lampu Meja LED', harga: 120000, ikon: Icons.lightbulb),
    const Produk(nama: 'Rak Buku', harga: 500000, ikon: Icons.shelves),
    const Produk(nama: 'Sofa Santai', harga: 2500000, ikon: Icons.weekend),
  ];

  // setState: jumlah keranjang bertambah -> badge ikut berubah (Bagian 1)
  void _tambahKeranjang() {
    setState(() {
      _jumlahKeranjang++;
    });
  }

  void _hapusProduk(Produk produk) {
    setState(() {
      _daftarProduk.remove(produk);
    });
  }

  Future<void> _bukaFormTambah() async {
    final produkBaru = await Navigator.push<Produk>(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );

    if (produkBaru != null) {
      setState(() {
        _daftarProduk.add(produkBaru);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produkBaru.nama} berhasil ditambahkan')),
      );
    }
  }

  // Ikon keranjang + badge angka (Stack + Positioned)
  Widget _ikonKeranjang() {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Isi keranjang: $_jumlahKeranjang item')),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        if (_jumlahKeranjang > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$_jumlahKeranjang',
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      ProdukListPage(
        daftarProduk: _daftarProduk,
        onTambahKeranjang: _tambahKeranjang,
        onHapus: _hapusProduk,
      ),
      const ProfilPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTerpilih == 0 ? 'Katalog Produk' : 'Profil'),
        actions: [_ikonKeranjang()],
      ),
      body: halaman[_tabTerpilih],
      floatingActionButton: _tabTerpilih == 0
          ? FloatingActionButton(
              onPressed: _bukaFormTambah,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}