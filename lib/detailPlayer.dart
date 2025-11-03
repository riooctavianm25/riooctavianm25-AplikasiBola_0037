import 'package:flutter/material.dart';
import 'home.dart';

class DetailPlayer extends StatelessWidget {
  final String nama;
  final String posisi;
  final String nomor;
  final String kebangsaan;
  final String usia;
  final String tinggi;
  final String gender;

  const DetailPlayer({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomor,
    required this.kebangsaan,
    required this.usia,
    required this.tinggi,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pemain"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText("Nama: $nama"),
            _buildText("Posisi: $posisi"),
            _buildText("Nomor: $nomor"),
            _buildText("Kebangsaan: $kebangsaan"),
            _buildText("Usia: $usia"),
            _buildText("Tinggi: ${tinggi} cm"),
            _buildText("Jenis Kelamin: $gender"),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false,
                    );
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
