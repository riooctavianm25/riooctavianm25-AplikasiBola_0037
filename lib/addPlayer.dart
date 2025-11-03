import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/detailPlayer.dart';

class Addplayer extends StatefulWidget {
  const Addplayer({super.key});

  @override
  State<Addplayer> createState() => _AddplayerState();
}

enum Gender { pria, wanita }

class _AddplayerState extends State<Addplayer> {
  final _formKey = GlobalKey<FormState>();
  final _namaPemainCtr = TextEditingController();
  final _posisiPemainCtr = TextEditingController();
  final _noPunggungCtr = TextEditingController();
  final _kewarganegaraanCtr = TextEditingController();
  final _usiaPemainCtr = TextEditingController();
  final _tinggiBadanCtr = TextEditingController();
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tambah Pemain Baru",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Form untuk menambahakan pemain baru akan ditempatkan di sini",
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _namaPemainCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama tidak boleh kosong.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Nama Pemain"),
                      hintText: 'Masukkan nama pemain',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _posisiPemainCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Posisi pemain tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Posisi Pemain"),
                      hintText: "Masukkan posisi pemain",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _noPunggungCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "No punggung tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: const Text("Nomor Punggung"),
                      hintText: "Masukkan nomor punggung",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _kewarganegaraanCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Kewarganegaraan tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Kewarganegaraan"),
                      hintText: "Masukkan kewarganegaraan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _usiaPemainCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Usia pemain tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: const Text("Usia Pemain"),
                      hintText: "Masukkan usia pemain",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _tinggiBadanCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tinggi badan pemain tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: const Text("Tinggi Badan (cm)"),
                      hintText: "Masukkan tinggi badan pemain",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Jenis Kelamin"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<Gender>(
                          title: const Text('Pria'),
                          value: Gender.pria,
                          groupValue: _selectedGender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<Gender>(
                          title: const Text('Wanita'),
                          value: Gender.wanita,
                          groupValue: _selectedGender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_selectedGender == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Pilih jenis kelamin terlebih dahulu")),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPlayer(
                              nama: _namaPemainCtr.text,
                              posisi: _posisiPemainCtr.text,
                              nomor: _noPunggungCtr.text,
                              kebangsaan: _kewarganegaraanCtr.text,
                              usia: _usiaPemainCtr.text,
                              tinggi: _tinggiBadanCtr.text,
                              gender: _selectedGender == Gender.pria ? "Laki-laki" : "Perempuan",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Tambah Pemain",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
