import 'package:app_loja/src/config/app_colors.dart';
import 'package:app_loja/src/pages/cammon_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// TELA DE CADASTRO

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

//   Criação de mascara para os campos especiais
  final cpf = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final celular = MaskTextInputFormatter(
      mask: '(##)# ####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(
                          color: AppColors.shape,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Formulário de Cadastro
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                    color: AppColors.shape,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        inputtext: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Password',
                        inputtext: TextInputType.text,
                        isSecret: true,
                      ),
                      CustomTextField(
                        icon: Icons.person,
                        label: 'Nome',
                        inputtext: TextInputType.text,
                      ),
                      CustomTextField(
                        inputFormatters: [celular],
                        icon: Icons.call,
                        label: 'Celular',
                        inputtext: TextInputType.phone,
                      ),
                      CustomTextField(
                        inputFormatters: [cpf],
                        icon: Icons.file_copy,
                        label: 'CPF',
                        inputtext: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Cadastrar usuário'),
                        ),
                      )
                    ],
                  ),
                ),
              ]),

              // Botão de voltar pra tela de login
              Positioned(
                top: 25,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.shape,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
