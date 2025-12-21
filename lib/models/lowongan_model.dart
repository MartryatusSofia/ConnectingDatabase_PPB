class Lowongan {
  final int id;
  final String judul;
  final String perusahaan;
  final String tipe;
  final String? logo;

  Lowongan({
    required this.id,
    required this.judul,
    required this.perusahaan,
    required this.tipe,
    this.logo,
  });

  /// Factory untuk parsing JSON dari API Laravel
  factory Lowongan.fromJson(Map<String, dynamic> json) {
    return Lowongan(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      judul: json['judul'] ?? '',
      perusahaan: json['perusahaan'] != null
          ? json['perusahaan']['nama'] ?? ''
          : '',
      tipe: json['tipe_pekerjaan'] ?? 'Full-time',
      logo: json['perusahaan'] != null
          ? json['perusahaan']['logo']
          : null,
    );
  }

  /// Jika suatu saat ingin kirim data ke API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'perusahaan': perusahaan,
      'tipe_pekerjaan': tipe,
      'logo': logo,
    };
  }
}
