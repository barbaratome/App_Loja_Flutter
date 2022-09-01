import 'package:app_loja/src/config/app_colors.dart';
import 'package:app_loja/src/pages/auth/sign_in_screen.dart';
import 'package:app_loja/src/pages/cammon_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_loja/src/config/app_data.dart' as app_data;

// TELA DE PERFIL

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Perfil do Usuário',
          style: TextStyle(color: AppColors.shape, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => const SignIn()),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.stroke,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // EMAIL
          CustomTextField(
              readOnly: true,
              // INITVALUE É UMA VARIAVEL QUE TRAS AS INFORMAÇÕES SALVAS DE LOGIN, ENTAO O COMPO JÁ INICIA PREENCHIDO
              initialValue: app_data.user.email,
              icon: Icons.email,
              label: 'Email',
              inputtext: TextInputType.emailAddress),

          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person,
            label: 'Nome',
            inputtext: TextInputType.text,
          ),

          CustomTextField(
              readOnly: true,
              initialValue: app_data.user.phone,
              icon: Icons.call,
              label: 'Celular',
              inputtext: TextInputType.number),

          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            inputtext: TextInputType.number,
            isSecret: true,
          ),

// BOTÃO DE ATUALIZAR A SENHA
          SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  // CAIXA DE DIALOGO PARA ATUALIZAR SENHA

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualizar senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock,
                  label: 'Senha Atual',
                  inputtext: TextInputType.number,
                ),
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock,
                  label: 'Nova senha',
                  inputtext: TextInputType.number,
                ),
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock,
                  label: 'Confirmar nova senha',
                  inputtext: TextInputType.number,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
