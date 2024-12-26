class DataclassBarang {
  final String id_barang;
  final String nama_barang;
  final String harga_satuan;
  final String stok_barang;
  final String varian;
  final String? max_stok;
  final String? min_stok;
  final String? expired_date;
  final String? id_supplier;
  final String? id_kategori_barang;

  DataclassBarang({
    required this.id_barang,
    required this.nama_barang,
    required this.harga_satuan,
    required this.stok_barang,
    required this.varian,
    this.max_stok,
    this.min_stok,
    this.id_supplier,
    this.id_kategori_barang,
    this.expired_date,
  });
}
