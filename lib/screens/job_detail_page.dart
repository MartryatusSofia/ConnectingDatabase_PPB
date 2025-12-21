import 'package:flutter/material.dart';
import 'lamaran_data_pribadi.dart'; 

class JobDetailPage extends StatelessWidget {
  final String title;
  final String company;
  final String logo;

  const JobDetailPage({
    super.key,
    required this.title,
    required this.company,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Informasi Lowongan",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(logo), radius: 28),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(company, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.bookmark_border),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Lowongan tersedia", style: TextStyle(fontWeight: FontWeight.w500)),
            const Text("Customer Support Specialist"),
            const SizedBox(height: 16),
            const Text("Status Lowongan Saat Ini",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const Row(
              children: [
                Icon(Icons.people_outline, size: 18),
                SizedBox(width: 4),
                Text("8 Pendaftar"),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Kebutuhan Dokumen",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DocItem(text: "CV"),
                DocItem(text: "Resume"),
                DocItem(text: "Portofolio"),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Persyaratan Lowongan",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            const Text(
              "FreshGraduate atau memiliki pengalaman minimal 1 tahun.\nSiap bekerja di bawah tekanan.",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DataPribadiPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Lamar Pekerjaan", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DocItem extends StatelessWidget {
  final String text;
  const DocItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, color: Colors.amber, size: 12),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
