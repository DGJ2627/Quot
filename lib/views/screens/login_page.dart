import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Global/variable.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/image/loginImage.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: LoginPage_key,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Login_email = val;
                      },
                      controller: Login_email_controller,
                      decoration: InputDecoration(
                        label: const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Login_password;
                      },
                      controller: Login_password_controller,
                      decoration: InputDecoration(
                        label: const Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Login_Model login = Login_Model(
                        //     email: Login_email!, password: Login_password!);
                        //
                        // int? res = await DataBase_Helper.dataBase_Helper
                        //     .InsertLogin(data: login);

                        Get.toNamed('/deshboard');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),

    );
  }
}
