import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mart_8_ornekler/register_page.dart';
import 'package:mart_8_ornekler/tab_subwidgets/home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "deneme@email.com";
  String password = "123";
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myPrimaryColor,
        elevation: 0,
        title: Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/lottie_login.json"),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString());
                        return !emailValid ? "Geçerli bir email giriniz" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email giriniz",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: myPrimaryColor)),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // commit
                    TextFormField(
                      obscureText: !isVisibility,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (password == value) {
                          return null;
                        }
                        return "Lütfen şifreyi doğru girin";
                      },
                      decoration: InputDecoration(
                        hintText: "Şifre giriniz",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: myPrimaryColor)),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isVisibility = !isVisibility;
                            });
                          },
                          child: Icon(isVisibility == true
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 45,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: myPrimaryColor,
                              shape: StadiumBorder()),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "Lütfen alanlarınızı kontrol ediniz",
                                        style: TextStyle(color: Colors.white),
                                      )));
                              return;
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: myPrimaryColor,
                                    content: Text(
                                      "Tebrikler giriş yapıldı",
                                      style: TextStyle(color: Colors.white),
                                    )));
                          },
                          child: Text(
                            "Giriş Yap",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyRegisterPage()));
                        },
                        child: Text(
                          "Hesabın yok mu? Kayıt ol",
                          style: TextStyle(color: myPrimaryColor),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const Color myPrimaryColor = Color.fromRGBO(2, 137, 123, 1);
