import 'package:flutter/material.dart';
import 'package:flutter_application_1/authfirebase.dart';
import 'package:flutter_application_1/create.dart';
import 'package:flutter_application_1/kategori.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

// import 'package:flutter_application_1/profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  // bool _isChecked = false;
  late AuthFirebase auth;

  @override
  void initState() {
    super.initState();
    auth = AuthFirebase();
    auth.getUser().then((value) {
      MaterialPageRoute route;
      if (value != null) {
        route = MaterialPageRoute(
          builder: (context) => const DoctorSearchPage(),
        );
        Navigator.pushReplacement(context, route);
      }
    }).catchError((err) => print(err));
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> _login() async {
    final dbHelper = DBHelper.instance;
    final email = emailController.text;
    final password = passwordController.text;

    final results = await dbHelper.getUser(email, password);

    if (results.isNotEmpty) {
      print('Login berhasil oleh user: $email, $password');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorSearchPage(),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Login failed. Please check your email and password.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text('Create Account'),
      //     ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/background2.png'), // Ganti dengan path atau URL gambar Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 80)),
              const Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Di',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 90),
                child: Text(
                  'Medical',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90),
                child: Text(
                  'Center',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 400.0,
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailController,
                      key: const Key("email"),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      key: const Key("password"),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 285),
                      child: const Text('Lupa Password?'),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: 450,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(102, 204, 227, 1),
                            Color.fromRGBO(102, 71, 224, 1),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Menghilangkan latar belakang ElevatedButton
                          elevation: 0, // Menghilangkan bayangan
                        ),
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            _login();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please fill in both email and password.'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreatePage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 285),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 100),
                      child: const Text(
                        'Atau',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          onPressed: () {
                            auth.googleLogin().then((value) {
                              if (value != null) {
                                final snackBar = SnackBar(
                                    content: const Text("Google Login"),
                                    action: SnackBarAction(
                                        label: 'OK', onPressed: () {}));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorSearchPage()));
                              } else {
                                final snackBar = SnackBar(
                                    content: const Text("Login Failed"),
                                    action: SnackBarAction(
                                        label: 'OK', onPressed: () {}));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(Icons
                                  .g_mobiledata), // Icon Facebook (misalnya)
                              SizedBox(width: 8.0),
                              Text('Google'), // Teks tombol Facebook
                            ],
                          ),
                        ),
                        const SizedBox(
                            width:
                                16.0), // Jarak antara tombol Google dan Facebook
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 2, 34, 88)),
                          ),
                          onPressed: () {
                            // Aksi ketika tombol ditekan
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.facebook), // Icon Facebook (misalnya)
                              SizedBox(width: 8.0),
                              Text('Facebook'), // Teks tombol Facebook
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
