import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

enum Gender { pria, wanita }

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _DomiCtr = TextEditingController();
  final _noTelpCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  final _passCtr = TextEditingController();
  final _passFinalCtr = TextEditingController();
  bool isObscure = true;
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Selamat datang Cityzens",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
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
                  Text(
                    "Silahkan daftar untuk melanjutkan ke aplikasi Machester City Official",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _namaCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama tidak boleh kosong.";
                      }
                      if (RegExp(r'^ [a-z] + $').hasMatch(value)) {
                        return "Nama hanya boleh berisi huruf kecil";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Nama"),
                      hintText: 'Masukkan nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _DomiCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Domisili tidak boleh kosong";
                      }
                      if (RegExp(r'^ [a-z, A-Z] + $').hasMatch(value)) {
                        return "Domisi hanya boleh berisi huruf";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Domisili"),
                      hintText: "Masukkan domisi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _noTelpCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nomor telepon tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: const Text("Nomor Telepon"),
                      hintText: "Masukkan nomor telepon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),

                  const Row(children: [Text("Jenis kelamin")]),
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

                  TextFormField(
                    controller: _emailCtr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains("@gmail.com")) {
                        return "Harus dengan format @";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      hintText: "Masukkan email, ex: @gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _passCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong.";
                      }
                      if (value.length < 6) {
                        return "Password harus terdiri dari minimal 6 karakter";
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      hintText: "Masukkan password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passFinalCtr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Konfirmasi password tidak boleh kosong";
                      }
                      if (value != _passCtr.text) {
                        return "Password tidak sama";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Konfirmasi Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(
                              email: _emailCtr.text,
                              password: _passCtr.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Column(
                    children: [
                      const Text("Apakah sudah punya akun?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(
                                email: _emailCtr.text,
                                password: _passCtr.text,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Masuk di sini",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
