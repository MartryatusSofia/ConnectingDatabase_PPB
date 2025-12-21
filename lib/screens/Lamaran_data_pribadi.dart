import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'lamaran_riwayat_pendidikan.dart';

class DataPribadiPage extends StatefulWidget {
  const DataPribadiPage({Key? key}) : super(key: key);

  @override
  State<DataPribadiPage> createState() => _DataPribadiPageState();
}

class _DataPribadiPageState extends State<DataPribadiPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? jenisKelamin;

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
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.grey),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.grey,
          selectionColor: Colors.transparent,
          selectionHandleColor: Colors.grey,
        ),
      ),
      child: Scaffold(
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
                      Text(
                        'Step 1',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Data Pribadi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                labelWajib("Nama Lengkap"),
                const SizedBox(height: 6),
                TextFormField(
                  controller: namaController,
                  decoration: inputStyle("Masukkan nama lengkap"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                labelWajib("Jenis Kelamin"),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Laki-laki',
                      // ignore: deprecated_member_use
                      groupValue: jenisKelamin,
                      activeColor: Colors.blue,
                      // ignore: deprecated_member_use
                      onChanged: (val) {
                        setState(() {
                          jenisKelamin = val;
                        });
                      },
                    ),
                    const Text('Laki-laki'),
                    const SizedBox(width: 24),
                    Radio<String>(
                      value: 'Perempuan',
                      // ignore: deprecated_member_use
                      groupValue: jenisKelamin,
                      activeColor: Colors.blue,
                      // ignore: deprecated_member_use
                      onChanged: (val) {
                        setState(() {
                          jenisKelamin = val;
                        });
                      },
                    ),
                    const Text('Perempuan'),
                  ],
                ),
                if (jenisKelamin == null)
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Text(
                      'Pilih jenis kelamin wajib diisi',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 18),

                labelWajib("Alamat Lengkap"),
                const SizedBox(height: 6),
                TextField(
                  controller: alamatController,
                  maxLines: 3,
                  decoration: inputStyle("Masukkan alamat lengkap"),
                ),
                const SizedBox(height: 18),

                labelWajib("Nomor HP Aktif"),
                const SizedBox(height: 6),
                TextField(
                  controller: noHpController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: inputStyle("Masukkan nomor HP"),
                ),
                const SizedBox(height: 18),

                // email
                labelWajib("Alamat Email"),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputStyle("Masukkan alamat email"),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          jenisKelamin != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RiwayatPendidikanPage(),
                          ),
                        );
                      } else if (jenisKelamin == null) {
                        setState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Lengkapi semua data wajib terlebih dahulu'),
                          ),
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
      ),
    );
  }
}
