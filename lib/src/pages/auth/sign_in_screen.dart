import 'package:app_loja/src/config/app_colors.dart';
import 'package:app_loja/src/pages/auth/sign_up_screen.dart';
import 'package:app_loja/src/pages/cammon_widgets/app_name_widget.dart';
import 'package:flutter/material.dart';
import '../base/base_screen.dart';
import '../cammon_widgets/custom_text_field.dart';

// TELA DE LOGIN

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
// o media query pega o tamanho total da tela e nao deixa dar overflow
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Expanded(child: AppName()),
// Container Branco - Logo da empresa
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: AppColors.shape,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
// Botão EMAIL
                    CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                      inputtext: TextInputType.emailAddress,
                    ),

                    // Botão SENHA
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Password',
                      isSecret: true,
                      inputtext: TextInputType.text,
                    ),

// Botão LOGIN
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const BaseScreen()));
                          },
                          child: const Text('Login'),
                        )),

                    // Botão ESQUECEU A SENHA
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 231, 60, 48),
                                  fontWeight: FontWeight.bold),
                            ))),

                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          )),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Ou'),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          )),
                        ],
                      ),
                    ),

                    // Botão CRIAR CONTA
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            side: const BorderSide(
                                width: 2, color: AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (contex) => SignUp()));
                          },
                          child: const Text('Criar conta')),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
