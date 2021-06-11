import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_front/paginas/loginPage.dart';
import 'package:prueba_front/servicios/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthService>().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
            },
            child: Text("Registrar usuario"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("Volver"),
          )
        ],
      ),
    );
  }
}
