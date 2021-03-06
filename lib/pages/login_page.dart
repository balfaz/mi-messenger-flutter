import 'package:flutter/material.dart';
import 'package:mimessenger/widget/btn_azul.dart';
import 'package:mimessenger/widget/custom_input.dart';
import 'package:mimessenger/widget/labels.dart';
import 'package:mimessenger/widget/logo_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoApp(
                    titolo: 'Messenger',
                  ),
                  _Form(),
                  Labels(
                    titulo: 'No tienes cuenta?',
                    subtitle: 'Crea una ahora',
                    ruta: 'register',
                  ),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final pswdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            isPassword: false,
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            isPassword: true,
            textController: pswdCtrl,
            keyboardType: TextInputType.text,
          ),
          ButtonBlue(
            text: 'Ingresar',
            onPressed: () {
              print(emailCtrl.text);
              print(pswdCtrl.text);
            },
          ),
        ],
      ),
    );
  }
}
