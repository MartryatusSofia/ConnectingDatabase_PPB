import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/app_bottom_nav.dart';

void main() {
  runApp(const StatusLamaranApp());
}

class StatusLamaranApp extends StatelessWidget {
  const StatusLamaranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusLamaranPage(),
    );
  }
}

class StatusLamaranPage extends StatefulWidget {
  const StatusLamaranPage({super.key});

  @override
  State<StatusLamaranPage> createState() => _StatusLamaranPageState();
}

class _StatusLamaranPageState extends State<StatusLamaranPage> {
  List<dynamic> lamaranList = [];

  @override
  void initState() {
    super.initState();
    _loadLamaranData();
  }

  Future<void> _loadLamaranData() async {
    final String response = await rootBundle.loadString(
      'assets/status_lamaran.json',
    );
    final data = json.decode(response);
    setState(() {
      lamaranList = data;
    });
  }

  // Warna background status berdasarkan status lamaran
  Color _statusColor(String status) {
    switch (status) {
      case "Terkirim":
        return const Color(0xFFD6E9FF);
      case "Diproses":
        return const Color(0xFFD8F7E1);
      case "Ditolak":
        return const Color(0xFFFFD8D8);
      default:
        return Colors.grey.shade200;
    }
  }

  // Warna teks status
  Color _textColor(String status) {
    switch (status) {
      case "Terkirim":
        return const Color(0xFF0D80F2);
      case "Diproses":
        return const Color(0xFF28A745);
      case "Ditolak":
        return const Color(0xFFE74C3C);
      default:
        return Colors.black;
    }
  }

  // Widget card lamaran
  Widget _buildLamaranCard(Map<String, dynamic> data) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            data['logo'],
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          data['nama'],
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(data['perusahaan']),
        trailing: Container(
          decoration: BoxDecoration(
            color: _statusColor(data['status']),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            data['status'],
            style: TextStyle(
              color: _textColor(data['status']),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ["Semua", "Terkirim", "Diproses", "Ditolak"];

    return DefaultTabController(
      // kl aku lupa penjelasan ada di dokumentasi flutter, aku copas kodingannya dari sana
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Status Lamaran',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF0D80F2),
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            List filtered = tab == "Semua"
                ? lamaranList
                : lamaranList.where((item) => item['status'] == tab).toList();

            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return _buildLamaranCard(filtered[index]);
              },
            );
          }).toList(),
        ),
        bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      ),
    );
  }
}
