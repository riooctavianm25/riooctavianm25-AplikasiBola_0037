import 'package:flutter/material.dart';
import 'package:mini_project/Register.dart';
import 'package:mini_project/home.dart';


class Login extends StatefulWidget {
  final String? email;
  final String? password;

   Login({super.key, this.email, this.password});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _passCtr = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    if (widget.email != null && widget.password != null) {
      _emailCtr.text = widget.email!;
      _passCtr.text = widget.password!;
    }

    print("Email diterima: ${widget.email}");
    print("Password diterima: ${widget.password}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:  EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/ManCity.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Selamat datang The Cityzens!!",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  Text(
                    "Silahkan login untuk melanjutkan ke aplikasi Manchester City official.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: "Email",
                      hintText: "Masukkan Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    controller: _passCtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong.";
                      }
                      if (value.length < 6) {
                        return "Password minimal 6 karakter.";
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Password",
                      hintText: "Masukkan password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5563DE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_emailCtr.text == widget.email &&
                              _passCtr.text == widget.password) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email atau password salah!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 15),

                  Column(
                    children: [
                       Text("Apakah anda belum punya akun?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child:  Text(
                          "Daftar di sini",
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
