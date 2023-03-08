import 'package:flutter/material.dart';

class MyProfilePAge extends StatefulWidget {
  const MyProfilePAge({super.key});

  @override
  State<MyProfilePAge> createState() => _MyProfilePAgeState();
}

class _MyProfilePAgeState extends State<MyProfilePAge> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Giriş Yap",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Email giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Şifre giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 45,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue, shape: StadiumBorder()),
                      onPressed: () {
                        setState(() {
                          String email = "deneme@email.com";
                          String password = "123";

                          if (_emailController.text != email) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 1500),
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Hatalı email",
                                  style: TextStyle(color: Colors.white),
                                )));
                            return;
                          }
                          if (_passwordController.text != password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 1500),
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Hatalı şifre",
                                  style: TextStyle(color: Colors.white),
                                )));
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 1500),
                              backgroundColor: Colors.green,
                              content: Text(
                                textAlign: TextAlign.center,
                                "Giriş yapıldı",
                                style: TextStyle(color: Colors.white),
                              )));
                        });
                      },
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
