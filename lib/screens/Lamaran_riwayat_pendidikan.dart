import 'package:flutter/material.dart';
import 'lamaran_informasi_lain.dart';

class RiwayatPendidikanPage extends StatefulWidget {
  const RiwayatPendidikanPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPendidikanPage> createState() => _RiwayatPendidikanPageState();
}

class _RiwayatPendidikanPageState extends State<RiwayatPendidikanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController institusiController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  final TextEditingController tahunMulaiController = TextEditingController();
  final TextEditingController tahunBerakhirController = TextEditingController();

  String? pendidikanTerakhir;

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1.2),
      ),
    );
  }

  Widget labelWajib(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
        const Text(' *', style: TextStyle(color: Colors.red)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Lamar Pekerjaan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    Text('Step 2',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(
                      'Riwayat Pendidikan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              labelWajib("Pendidikan Terakhir"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                decoration: inputStyle("Pilih pendidikan terakhir"),
                // ignore: deprecated_member_use
                value: pendidikanTerakhir,
                items: const [
                  DropdownMenuItem(value: "SMA/SMK", child: Text("SMA/SMK")),
                  DropdownMenuItem(value: "Diploma", child: Text("Diploma")),
                  DropdownMenuItem(value: "Sarjana (S1)", child: Text("Sarjana (S1)")),
                  DropdownMenuItem(value: "Magister (S2)", child: Text("Magister (S2)")),
                ],
                onChanged: (value) {
                  setState(() {
                    pendidikanTerakhir = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Pendidikan terakhir wajib diisi' : null,
              ),
              const SizedBox(height: 18),

              labelWajib("Nama Institusi Pendidikan Terakhir"),
              const SizedBox(height: 6),
              TextFormField(
                controller: institusiController,
                decoration: inputStyle("Masukkan nama institusi"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 18),

              //jurusan
              labelWajib("Jurusan"),
              const SizedBox(height: 6),
              TextFormField(
                controller: jurusanController,
                decoration: inputStyle("Masukkan jurusan"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 18),

              labelWajib("Tahun Mulai"),
              const SizedBox(height: 6),
              TextFormField(
                controller: tahunMulaiController,
                keyboardType: TextInputType.number,
                decoration: inputStyle("Masukkan tahun mulai"),
              ),
              const SizedBox(height: 18),

              labelWajib("Tahun Berakhir"),
              const SizedBox(height: 6),
              TextFormField(
                controller: tahunBerakhirController,
                keyboardType: TextInputType.number,
                decoration: inputStyle("Masukkan tahun berakhir"),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const InformasiLainPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Lanjutkan',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
