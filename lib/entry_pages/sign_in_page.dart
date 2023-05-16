import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modu_calorie/components/background_image.dart';

import '../components/app_bars/app_bar_button.dart';
import '../components/buttons/custom_button.dart';
import '../components/text_form_fields/email_text_form_field.dart';
import '../components/text_form_fields/password_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    String email = '';
    String password = '';

    void _tryValidation() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    // touch the screen to unfocus the TextFormField.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: AppBarTranslucentButton(
            icon: Icons.arrow_back,
            onPressed: () {},
          ),
        ),
        extendBodyBehindAppBar: true,
        // when the keyboard pops up,
        // the whole page in the SingleChildScrollView
        // that has screen sized SizedBox as a child
        // moves up along with the keyboard
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              child: Stack(
                children: [
                  // background image
                  const BackgroundImage(
                    imagePath: 'images/background_image_login_page.jpg',
                  ),
                  // bottom sheet
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        ),
                      ),
                      // bottom sheet contents
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 60.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // title and description
                                const Text(
                                  '돌아오셨군요!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '이메일과 비밀번호를 입력해주세요.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                // e-mail
                                EmailTextFormField(
                                  controller: _emailController,
                                  hintText: 'Email 입력',
                                  textInputAction: TextInputAction.next,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Email 주소를 입력해주세요.';
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value!)) {
                                      return '유효한 Email 주소를 입력해주세요.';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    email = value!;
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                // password
                                PasswordTextFormField(
                                  hintText: '비밀번호 입력',
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.send,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return '비밀번호를 입력해주세요.';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    password = value!;
                                  },
                                ),
                                const SizedBox(height: 40.0),
                                CustomButton(
                                  onPressed: () {
                                    _tryValidation();
                                  },
                                  text: '로그인',
                                ),
                                const SizedBox(height: 30.0),
                                // bottom texts
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    '비밀번호를 잊어버리셨나요?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '처음이신가요? ',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        '회원가입',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[700],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
